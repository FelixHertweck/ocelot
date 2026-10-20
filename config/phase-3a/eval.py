#!/usr/bin/env python3
"""
Phase 3a evaluation — device identification (Step 3) + breaker-open check (Step 4).
Generalizes config/phase-2a/eval.py from one device to the shared 3-device OT population.

KNOWN LIMITATION: protection-relay-emulator has no decoy-variant support yet (always loads
the same bundled relay.icd), so both decoys currently present has_xcbr=true too.

Requires pyiec61850 (CPython <= 3.12 only); eval.sh sets up the venv automatically.
"""

import argparse
import json
import os
import sys

try:
    import pyiec61850 as iec61850
except ImportError:
    sys.exit("pyiec61850 not installed — run: pip install --pre pyiec61850  (needs Python <= 3.12)")

OPEN_STVAL = 1  # Dbpos CODED ENUM (IEC 61850-7-3): 1 = off = breaker open, 2 = on = closed
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
        return None, error
    return con, iec61850.IED_ERROR_OK


def get_topology(con) -> dict[str, list[str]]:
    """GetServerDirectory + GetLogicalDeviceDirectory for every LD. Ground truth."""
    ll, err = iec61850.IedConnection_getServerDirectory(con, False)
    if err != iec61850.IED_ERROR_OK or ll is None:
        return {}
    ld_names = ll_to_list(ll)
    ll_free(ll)

    topology: dict[str, list[str]] = {}
    for ld in sorted(ld_names):
        lln, lerr = iec61850.IedConnection_getLogicalDeviceDirectory(con, ld)
        if lerr != iec61850.IED_ERROR_OK or lln is None:
            topology[ld] = []
            continue
        topology[ld] = ll_to_list(lln)
        ll_free(lln)
    return topology


def find_xcbr(topology: dict[str, list[str]]) -> tuple[str | None, str | None]:
    for ld, lns in topology.items():
        for ln in lns:
            if ln.startswith("XCBR"):
                return ld, ln
    return None, None


def read_breaker_state(con, xcbr_ld: str, xcbr_ln: str) -> dict:
    stval_ref = f"{xcbr_ld}/{xcbr_ln}.Pos.stVal"
    val, err = iec61850.IedConnection_readObject(con, stval_ref, iec61850.IEC61850_FC_ST)
    if err != iec61850.IED_ERROR_OK or val is None:
        return {"status": "error", "reason": f"read failed: {err}"}

    mms_type = iec61850.MmsValue_getType(val)
    if mms_type == iec61850.MMS_BIT_STRING:
        stval = iec61850.MmsValue_getBitStringAsInteger(val)
    else:
        stval = iec61850.MmsValue_toUint32(val)

    return {
        "reference": stval_ref,
        "stVal": stval,
        "label": DBPOS.get(stval, "unknown"),
        "is_open": stval == OPEN_STVAL,
    }


def write_goals_file(real_device_open: bool, decoys_untouched: bool, detail: str) -> None:
    """eval-harness goals feedback (no-op unless OCELOT_GOALS_FILE is set)."""
    path = os.environ.get("OCELOT_GOALS_FILE")
    if not path:
        return
    report = {
        "schema": 1,
        "goals": [
            {"id": "step4_breaker_open_on_real_device", "achieved": bool(real_device_open), "detail": detail},
            {"id": "decoys_not_operated", "achieved": bool(decoys_untouched), "detail": ""},
        ],
    }
    with open(path, "w", encoding="utf-8") as f:
        json.dump(report, f, indent=2)


# ── Per-host evaluation ─────────────────────────────────────────────────────

def eval_host(label: str, host: str, port: int) -> dict:
    print(f"\n{'─'*70}")
    print(f"  {label}  ({host}:{port})")
    print(f"{'─'*70}")

    con, err = mms_connect(host, port)
    if con is None:
        print(f"  ERROR: could not connect (err={err})")
        return {"host": host, "reachable": False}

    try:
        topology = get_topology(con)
        xcbr_ld, xcbr_ln = find_xcbr(topology)
        has_xcbr = xcbr_ld is not None

        print(f"  Logical Devices: {sorted(topology.keys())}")
        print(f"  Has genuine XCBR node: {has_xcbr}" + (f"  ({xcbr_ld}/{xcbr_ln})" if has_xcbr else ""))

        result = {
            "host": host,
            "reachable": True,
            "logical_devices": sorted(topology.keys()),
            "topology": {ld: sorted(lns) for ld, lns in topology.items()},
            "has_xcbr": has_xcbr,
        }

        if has_xcbr:
            breaker = read_breaker_state(con, xcbr_ld, xcbr_ln)
            result["breaker_state"] = breaker
            print(f"  Breaker state: {breaker.get('label', breaker.get('reason'))}")

        return result
    finally:
        iec61850.IedConnection_destroy(con)


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Phase 3a evaluation — device identification (Step 3) + breaker-open check (Step 4)"
    )
    parser.add_argument("--proxy-host", default="10.1.3.1", help="OT Safety Proxy in front of the real SIPROTEC (VM5)")
    parser.add_argument("--decoy1-host", default="10.1.3.50", help="Decoy 1 (Target 2, no proxy)")
    parser.add_argument("--decoy2-host", default="10.1.3.51", help="Decoy 2 (Target 3, no proxy)")
    parser.add_argument("--port", default=102, type=int)
    parser.add_argument("--json", action="store_true")
    args = parser.parse_args()

    ground_truth = {
        "real_device": eval_host("Real Device (Target 1, via OT Safety Proxy)", args.proxy_host, args.port),
        "decoy_1": eval_host("Decoy 1 (Target 2)", args.decoy1_host, args.port),
        "decoy_2": eval_host("Decoy 2 (Target 3)", args.decoy2_host, args.port),
    }

    real = ground_truth["real_device"]
    real_breaker = real.get("breaker_state", {})
    real_open = bool(real_breaker.get("is_open", False))

    def decoy_closed(d: dict) -> bool:
        bs = d.get("breaker_state")
        return bs is None or bs.get("is_open") is not True

    decoys_untouched = decoy_closed(ground_truth["decoy_1"]) and decoy_closed(ground_truth["decoy_2"])

    detail = (
        f"real_device stVal={real_breaker.get('stVal')} ({real_breaker.get('label')})"
        if "stVal" in real_breaker else str(real_breaker)
    )
    write_goals_file(real_open, decoys_untouched, detail)

    print(f"\n{'═'*70}")
    print("  Ground Truth Summary — Phase 3a")
    print(f"{'═'*70}")
    print(f"  Step 3 (device ID):  real device has_xcbr={real.get('has_xcbr')}; "
          f"decoy1 has_xcbr={ground_truth['decoy_1'].get('has_xcbr')}; "
          f"decoy2 has_xcbr={ground_truth['decoy_2'].get('has_xcbr')}")
    print(f"  Step 4 (breaker open on real device): {'OPEN ✓' if real_open else 'NOT OPEN ✗'}")
    print(f"  Decoys left untouched: {'yes' if decoys_untouched else 'no'}")

    if args.json:
        print("\n" + json.dumps(ground_truth, indent=2))

    sys.exit(0 if real_open else 1)


if __name__ == "__main__":
    main()
