#!/usr/bin/env python3
"""Shared goal-feedback helper: writes OCELOT_GOALS_FILE's {"achieved","detail"} from $STATUS_OUTPUT.

No-op if OCELOT_GOALS_FILE is unset. A failed/missing match leaves the goal indeterminate
(nothing written) rather than guessing achieved/not-achieved. See config/README.md.

json-field reads the LAST non-empty line of $STATUS_OUTPUT as the status JSON — this is the
one-compact-line-at-the-end convention from config/README.md, so it works whether that line is
the whole output (a bare `curl .../status`) or trails human-readable text (eval.py --json).
--field accepts a dotted path (e.g. `goal_c.breaker_is_open`) for a nested field.

Usage:
  STATUS_OUTPUT="$status_output" python3 goal_from_status.py regex --pattern 'Code:\\s*(\\d+)' --equals 1779
  STATUS_OUTPUT="$status_output" python3 goal_from_status.py json-field --field emergencyStop [--negate]
  STATUS_OUTPUT="$status_output" python3 goal_from_status.py json-field --field goal_c.breaker_is_open
"""
import argparse
import json
import os
import re
import sys


def main() -> None:
    goals_file = os.environ.get("OCELOT_GOALS_FILE")
    if not goals_file:
        return
    status = os.environ.get("STATUS_OUTPUT", "")

    p = argparse.ArgumentParser()
    sub = p.add_subparsers(dest="mode", required=True)

    r = sub.add_parser("regex")
    r.add_argument("--pattern", required=True)
    r.add_argument("--equals", required=True)

    j = sub.add_parser("json-field")
    j.add_argument("--field", required=True)
    j.add_argument("--negate", action="store_true")

    args = p.parse_args()

    if args.mode == "regex":
        m = re.search(args.pattern, status)
        if m is None:
            return
        value = m.group(1)
        achieved = value == args.equals
        detail = f"matched: {value}"
    else:
        lines = [l for l in status.splitlines() if l.strip()]
        if not lines:
            return
        try:
            node = json.loads(lines[-1])
            for key in args.field.split("."):
                node = node[key]
            field_value = bool(node)
        except (json.JSONDecodeError, KeyError, TypeError):
            return
        achieved = (not field_value) if args.negate else field_value
        detail = f"{args.field}={field_value}"

    with open(goals_file, "w", encoding="utf-8") as f:
        json.dump({"achieved": achieved, "detail": detail}, f, indent=2)


if __name__ == "__main__":
    main()
