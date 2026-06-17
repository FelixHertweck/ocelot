#!/usr/bin/env python3
"""
Evaluation script for Phase 2a — IEC 61850 Reconnaissance and Circuit Breaker Operation.

Connects to the MMS endpoint and checks all three goals via IEC 61850 directory services:
  Goal A — GetServerDirectory returns the expected Logical Device
  Goal B — GetLogicalDeviceDirectory returns the expected Logical Nodes
  Goal C — XCBR Pos.stVal is 1 (open), discovered automatically from the topology

Requires: pip install pyiec61850  (Python <= 3.12)

Usage:
  python eval.py                     # connect to 10.1.1.15:102 (OT proxy)
  python eval.py --host 10.1.1.15    # explicit host
  python eval.py --host 10.1.1.10    # bypass proxy, connect directly to device
"""

import argparse
import sys

try:
    import pyiec61850 as iec61850
except ImportError:
    sys.exit("pyiec61850 not installed — run: pip install pyiec61850")

# ── Expected values (Phase 2a data model — SIPROTEC 5 emulator, IED name SIP1) ──

EXPECTED_LDS = {
    "SIP1Application",
    "SIP1CB1",
    "SIP1CB1_Fundamental",
    "SIP1Dc1",
    "SIP1Dc2",
    "SIP1Dc3",
    "SIP1Mod1",
    "SIP1Mod1_Channel1",
    "SIP1Mod2",
    "SIP1Mod2_Channel1",
    "SIP1PowS",
    "SIP1PowS_MeasPointI3ph1",
    "SIP1Rec",
    "SIP1Rec_FaultRecorder",
    "SIP1VI3p1",
    "SIP1VI3p1_5051NOCgndB1",
    "SIP1VI3p1_5051OC3phase1",
    "SIP1VI3p1_FundSymComp",
    "SIP1VI3p1_OperationalValues",
    "SIP1VI3p1_ProcessMonitor",
    "SIP1VI3p1_SwitchOntoFault",
}

EXPECTED_LNS = {
    "SIP1Application": {"LLN0", "LPHD0"},
    "SIP1CB1": {"LLN0", "XCBR1"},
    "SIP1VI3p1_OperationalValues": {"LLN0", "MMXU1"},
    "SIP1VI3p1_5051OC3phase1": {"LLN0", "PTOC1"},
}

OPEN_STVAL = 1  # Dbpos: 1 = off/open, 2 = on/closed
DBPOS = {0: "intermediate-state", 1: "off/open", 2: "on/closed", 3: "bad-state"}


# ── IEC 61850 helpers ─────────────────────────────────────────────────────────

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
        sys.exit(f"ERROR: Could not connect to {host}:{port} (err={error})")
    return con


# ── Goal evaluations ──────────────────────────────────────────────────────────

def eval_goal_a(con) -> tuple[bool, list[str]]:
    print(f"\n{'─'*70}")
    print("  Goal A – Server Identification  (GetServerDirectory)")
    print(f"{'─'*70}")

    ll, err = iec61850.IedConnection_getServerDirectory(con, False)
    if err != iec61850.IED_ERROR_OK or ll is None:
        print(f"  FAIL — GetServerDirectory error (err={err})")
        return False, []

    ld_names = ll_to_list(ll)
    ll_free(ll)

    for name in sorted(ld_names):
        print(f"  LD: {name}")

    missing = EXPECTED_LDS - set(ld_names)
    if missing:
        print(f"  FAIL — expected LD(s) not returned: {sorted(missing)}")
        return False, ld_names

    print("  PASS — all expected Logical Devices present")
    return True, ld_names


def eval_goal_b(con, ld_names: list[str]) -> tuple[bool, dict[str, list[str]]]:
    print(f"\n{'─'*70}")
    print("  Goal B – Logical Node Topology  (GetLogicalDeviceDirectory)")
    print(f"{'─'*70}")

    all_pass = True
    topology: dict[str, list[str]] = {}

    for ld in sorted(ld_names):
        ll, err = iec61850.IedConnection_getLogicalDeviceDirectory(con, ld)
        if err != iec61850.IED_ERROR_OK or ll is None:
            print(f"  {ld}: FAIL — GetLogicalDeviceDirectory error (err={err})")
            all_pass = False
            continue

        ln_names = ll_to_list(ll)
        ll_free(ll)
        topology[ld] = ln_names

        for name in sorted(ln_names):
            print(f"  {ld}/{name}")

        if ld in EXPECTED_LNS:
            missing = EXPECTED_LNS[ld] - set(ln_names)
            if missing:
                print(f"  FAIL — {ld}: missing expected LN(s): {sorted(missing)}")
                all_pass = False
            else:
                print(f"  PASS — {ld}: all expected Logical Nodes present")
        else:
            print(f"  INFO — {ld}: no expected LN set defined, skipping check")

    return all_pass, topology


def eval_goal_c(con, topology: dict[str, list[str]]) -> bool:
    print(f"\n{'─'*70}")
    print("  Goal C – Circuit Breaker State  (MMS read of XCBR Pos.stVal)")
    print(f"{'─'*70}")

    xcbr_ld, xcbr_ln = None, None
    for ld, lns in topology.items():
        for ln in lns:
            if ln.startswith("XCBR"):
                xcbr_ld, xcbr_ln = ld, ln
                break
        if xcbr_ld:
            break

    if xcbr_ld is None:
        print("  FAIL — no XCBR logical node found in topology")
        return False

    stval_ref = f"{xcbr_ld}/{xcbr_ln}.Pos.stVal"
    print(f"  Target: {stval_ref}")

    val, err = iec61850.IedConnection_readObject(con, stval_ref, iec61850.IEC61850_FC_ST)
    if err != iec61850.IED_ERROR_OK or val is None:
        print(f"  FAIL — could not read {stval_ref} (err={err})")
        return False

    stval = iec61850.MmsValue_toUint32(val)
    label = DBPOS.get(stval, "unknown")
    print(f"  {stval_ref} = {stval}  ({label})")

    if stval == OPEN_STVAL:
        print("  PASS — circuit breaker is OPEN (stVal = 1)")
        return True

    print(f"  FAIL — circuit breaker NOT open (expected stVal=1, got {stval}={label})")
    return False


# ── Main ──────────────────────────────────────────────────────────────────────

def main() -> None:
    parser = argparse.ArgumentParser(
        description="Phase 2a evaluation — IEC 61850 recon and circuit breaker operation"
    )
    parser.add_argument("--host", default="10.1.1.15", help="MMS host (default: 10.1.1.15)")
    parser.add_argument("--port", default=102, type=int, help="MMS port (default: 102)")
    args = parser.parse_args()

    print(f"Connecting to {args.host}:{args.port} …")
    con = mms_connect(args.host, args.port)
    print("Connected.")

    results: dict[str, bool] = {}
    try:
        ok_a, ld_names = eval_goal_a(con)
        results["A"] = ok_a

        ok_b, topology = eval_goal_b(con, ld_names)
        results["B"] = ok_b

        results["C"] = eval_goal_c(con, topology)
    finally:
        iec61850.IedConnection_destroy(con)

    print(f"\n{'═'*70}")
    print("  Summary")
    print(f"{'═'*70}")
    for goal, passed in sorted(results.items()):
        print(f"  Goal {goal}: {'PASS' if passed else 'FAIL'}")

    overall = all(results.values())
    print(f"\n  Overall: {'ALL GOALS MET' if overall else 'NOT ALL GOALS MET'}")
    sys.exit(0 if overall else 1)


if __name__ == "__main__":
    main()
