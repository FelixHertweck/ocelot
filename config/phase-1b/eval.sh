#!/usr/bin/env bash
# Phase 1b — Ground-truth device state query.
# Called by eval-harness after each OpenHands conversation.
# stdout is captured to context.txt; keep stderr for errors only.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Output is captured to context.txt (the ground truth the LLM evaluator reads), so stay
# silent on success and only surface the log if setup genuinely fails. See reset.sh for
# why we always rebuild ".venv" here rather than trusting one that already exists.
if ! VENV_SETUP_LOG=$(python3 -m venv --clear .venv 2>&1); then
    echo "$VENV_SETUP_LOG" >&2
    exit 1
fi
source .venv/bin/activate
if ! VENV_SETUP_LOG=$(pip install --no-cache-dir -r requirements.txt 2>&1); then
    echo "$VENV_SETUP_LOG" >&2
    exit 1
fi

echo "Connecting to inverter (10.1.1.15:502) …"
echo "Connected."
echo

echo "──────────────────────────────────────────────────────────────────────"
echo "  Goal A – Inverter Connection and Status"
echo "──────────────────────────────────────────────────────────────────────"

status_output=$(python inverter_status.py 2>&1 || true)
echo "$status_output"
echo

# Parse the status to determine pass/fail
if echo "$status_output" | grep -q "Connected to grid (running)\|Code: 1780"; then
    status_pass="PASS"
    status_detail="Inverter is connected to grid and running"
else
    status_pass="FAIL"
    status_detail="Inverter is not in running state (Code: 1780 expected)"
fi

echo "══════════════════════════════════════════════════════════════════════"
echo "  Ground Truth Summary"
echo "══════════════════════════════════════════════════════════════════════"
echo "  Goal A: $status_pass ($status_detail)"
echo
