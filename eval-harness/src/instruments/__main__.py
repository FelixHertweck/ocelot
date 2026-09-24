"""CLI for run.sh:  python3 -m instruments plan <mode> <source>  |  validate <config>  |  uses-oracle <mode>"""
import json
import sys

from . import get


def main() -> int:
    if len(sys.argv) == 4 and sys.argv[1] == "plan":
        conditions = get(sys.argv[2]).plan(sys.argv[3])
        print(json.dumps([c.to_dict() for c in conditions], ensure_ascii=False, indent=2))
        return 0

    if len(sys.argv) == 3 and sys.argv[1] == "validate":
        from lib.config import load

        cfg = load(sys.argv[2])
        errors, warnings = get(cfg["prompts"]["mode"]).validate(cfg)
        for w in warnings:
            print(f"WARNING: {w}", file=sys.stderr)
        for e in errors:
            print(f"ERROR: {e}", file=sys.stderr)
        return 1 if errors else 0

    if len(sys.argv) == 3 and sys.argv[1] == "uses-oracle":
        print("true" if get(sys.argv[2]).uses_oracle else "false")
        return 0

    print("Usage: python3 -m instruments plan <mode> <source> | validate <config> | uses-oracle <mode>", file=sys.stderr)
    return 2


if __name__ == "__main__":
    try:
        sys.exit(main())
    except ValueError as e:
        print(f"ERROR: {e}", file=sys.stderr)
        sys.exit(1)
