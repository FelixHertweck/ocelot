#!/usr/bin/env python3
"""
Phase 3c reset — closes the circuit breaker on all three OT hosts (real device +
both decoys); a host that errors is skipped rather than aborting the whole reset.

Requires pyiec61850 (CPython <= 3.12 only); reset.sh sets up the venv automatically.
"""

import argparse
import sys

try:
    import pyiec61850 as iec61850
except ImportError:
    sys.exit("pyiec61850 not installed — run: pip install --pre pyiec61850  (needs Python <= 3.12)")

# ctlModel values per IEC 61850-7-2
CTL_SBO = {2, 4}
CTL_SBO_ENHANCED = {4}  # needs SelectWithValue, not a bare Select

CLOSED_STVAL = 2  # Dbpos: 1 = off/open, 2 = on/closed
DBPOS = {0: "intermediate-state", 1: "off/open", 2: "on/closed", 3: "bad-state"}


# ── IEC 61850 helpers ──────────────────────────────────────────────────────────

def ll_to_list(ll) -> list[str]:
    result = []
    item = iec61850.LinkedList_getNext(ll)
    while item:
        raw = iec61850.LinkedList_getData(item)
        try:
            name = iec61850.toCharP(raw)
        except Exception:
            name = str(raw) if raw is not None else ""
        if name:
            result.append(name)
        item = iec61850.LinkedList_getNext(item)
    return result


def ll_free(ll) -> None:
    try:
        iec61850.LinkedList_destroy(ll)
    except Exception:
        pass


def mms_connect(host: str, port: int):
    con = iec61850.IedConnection_create()
    error = iec61850.IedConnection_connect(con, host, port)
    if error != iec61850.IED_ERROR_OK:
        iec61850.IedConnection_destroy(con)
        return None
    return con


def find_breaker_lns(con) -> tuple[str, str, str] | tuple[None, None, None]:
    ll, err = iec61850.IedConnection_getServerDirectory(con, False)
    if err != iec61850.IED_ERROR_OK or ll is None:
        return None, None, None
    ld_names = ll_to_list(ll)
    ll_free(ll)

    for ld in ld_names:
        lln, lerr = iec61850.IedConnection_getLogicalDeviceDirectory(con, ld)
        if lerr != iec61850.IED_ERROR_OK or lln is None:
            continue
        ln_names = ll_to_list(lln)
        ll_free(lln)
        xcbr_ln = next((ln for ln in ln_names if ln.startswith("XCBR")), None)
        cswi_ln = next((ln for ln in ln_names if ln.startswith("CSWI")), None)
        if xcbr_ln and cswi_ln:
            return ld, xcbr_ln, cswi_ln
    return None, None, None


def read_ctl_model(con, ld: str, ln: str) -> int | None:
    ref = f"{ld}/{ln}.Pos.ctlModel"
    val, err = iec61850.IedConnection_readObject(con, ref, iec61850.IEC61850_FC_CF)
    if err != iec61850.IED_ERROR_OK or val is None:
        return None
    return iec61850.MmsValue_toUint32(val)


def read_stval(con, ld: str, ln: str) -> int | None:
    ref = f"{ld}/{ln}.Pos.stVal"
    val, err = iec61850.IedConnection_readObject(con, ref, iec61850.IEC61850_FC_ST)
    if err != iec61850.IED_ERROR_OK or val is None:
        return None
    return iec61850.MmsValue_getBitStringAsInteger(val)


def print_last_appl_error(ctl) -> None:
    try:
        e = iec61850.ControlObjectClient_getLastApplError(ctl)
    except Exception:
        return
    if e is None or getattr(e, "error", 0) == 0:
        return
    print(f"    LastApplError: error={e.error} addCause={e.addCause} ctlNum={getattr(e, 'ctlNum', '?')}")


def close_breaker(con, ld: str, ln: str, ctl_model: int) -> bool:
    pos_ref = f"{ld}/{ln}.Pos"
    ctl = iec61850.ControlObjectClient_create(pos_ref, con)
    if ctl is None:
        print(f"    ERROR — could not create control object for {pos_ref}")
        return False

    if ctl_model in CTL_SBO:
        if ctl_model in CTL_SBO_ENHANCED:
            print(f"    Control model: SBO enhanced (ctlModel={ctl_model}) — SelectWithValue(true) …")
            ok = iec61850.ControlObjectClient_selectWithValue(ctl, iec61850.MmsValue_newBoolean(True))
        else:
            print(f"    Control model: SBO normal (ctlModel={ctl_model}) — Select …")
            ok = iec61850.ControlObjectClient_select(ctl)
        if not ok:
            print("    ERROR — Select failed")
            print_last_appl_error(ctl)
            return False
        print("    Select OK")

    print("    Issuing Operate(ctlVal=true) …")
    ok = iec61850.ControlObjectClient_operate(ctl, iec61850.MmsValue_newBoolean(True), 0)
    if not ok:
        print("    ERROR — Operate failed")
        print_last_appl_error(ctl)
        return False
    return True


# ── Per-host reset ────────────────────────────────────────────────────────────

def reset_host(label: str, host: str, port: int) -> bool:
    """True if the host ends up CLOSED (or was already); never raises."""
    print(f"\n--- {label} ({host}:{port}) ---")
    con = mms_connect(host, port)
    if con is None:
        print("  SKIP — unreachable")
        return False

    try:
        ld, xcbr_ln, cswi_ln = find_breaker_lns(con)
        if ld is None:
            print("  SKIP — no logical device with both XCBR and CSWI found")
            return False
        print(f"  Found: {ld}/{xcbr_ln} (status), {ld}/{cswi_ln} (control)")

        before = read_stval(con, ld, xcbr_ln)
        print(f"  Current state: Pos.stVal = {before}  ({DBPOS.get(before, 'unknown')})")

        if before == CLOSED_STVAL:
            print("  Already CLOSED — nothing to do.")
            return True

        ctl_model = read_ctl_model(con, ld, cswi_ln)
        if ctl_model is None:
            print("  WARNING — could not read ctlModel, assuming direct-with-normal-security")
            ctl_model = 1
        else:
            print(f"  ctlModel = {ctl_model}")

        if ctl_model == 0:
            print("  SKIP — ctlModel is status-only (0), cannot operate")
            return False

        ok = close_breaker(con, ld, cswi_ln, ctl_model)
        if not ok:
            return False

        after = read_stval(con, ld, xcbr_ln)
        print(f"  After:  Pos.stVal = {after}  ({DBPOS.get(after, 'unknown')})")
        return after == CLOSED_STVAL

    finally:
        iec61850.IedConnection_destroy(con)


def main() -> None:
    parser = argparse.ArgumentParser(description="Phase 3c reset — close the breaker on all three OT hosts")
    parser.add_argument("--proxy-host", default="10.1.3.1", help="OT Safety Proxy in front of the real SIPROTEC (VM5)")
    parser.add_argument("--decoy1-host", default="10.1.3.50", help="Decoy 1 (Target 2, no proxy)")
    parser.add_argument("--decoy2-host", default="10.1.3.51", help="Decoy 2 (Target 3, no proxy)")
    parser.add_argument("--port", default=102, type=int)
    args = parser.parse_args()

    results = {
        "real_device": reset_host("Real Device (via OT Safety Proxy)", args.proxy_host, args.port),
        "decoy_1": reset_host("Decoy 1", args.decoy1_host, args.port),
        "decoy_2": reset_host("Decoy 2", args.decoy2_host, args.port),
    }

    print(f"\n{'='*70}")
    print("  Reset Summary — Phase 3c")
    print(f"{'='*70}")
    for name, ok in results.items():
        print(f"  {name}: {'CLOSED ✓' if ok else 'NOT CONFIRMED ✗'}")

    sys.exit(0 if results["real_device"] else 1)


if __name__ == "__main__":
    main()
