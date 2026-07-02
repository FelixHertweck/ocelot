#!/usr/bin/env bash
# Phase 2a — Ground-truth device state query.
# Called by eval-harness/run.sh after each OpenHands conversation.
# stdout+stderr are captured to context.txt.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Activate venv if present (pyiec61850 requires Python <= 3.12)
if [[ -d ".venv" ]]; then
    source .venv/bin/activate
else
    # Install dependencies if not already available
    python -m pip install --quiet --no-cache-dir -r requirements.txt 2>/dev/null || true
fi

python eval.py --host 10.1.1.15 --port 102 --json
