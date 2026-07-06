#!/usr/bin/env bash
# Phase 1a — Reset between runs.
# 1. SSHes into the Attacker VM and runs ~/reset.sh there.
# 2. Starts the inverter and verifies it reconnects.
#
# SSH key discovery: source $CAVE_WRAPPER_DIR/.env → SSH_KEY_NAME,
# then use $CAVE_WRAPPER_DIR/ssh-keys/$SSH_KEY_NAME as the identity file.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

ATTACKER_VM_HOST="10.1.1.20"
ATTACKER_VM_USER="ubuntu"

: "${CAVE_WRAPPER_DIR:?CAVE_WRAPPER_DIR is not set}"

if [[ -f "${CAVE_WRAPPER_DIR}/.env" ]]; then
    set -a
    # shellcheck disable=SC1090
    source "${CAVE_WRAPPER_DIR}/.env"
    set +a
fi

: "${SSH_KEY_NAME:?SSH_KEY_NAME not found — check ${CAVE_WRAPPER_DIR}/.env}"
SSH_KEY="${CAVE_WRAPPER_DIR}/ssh-keys/${SSH_KEY_NAME}"

if [[ ! -f "$SSH_KEY" ]]; then
    echo "ERROR: SSH key not found: $SSH_KEY" >&2
    exit 1
fi

echo "=== Phase 1a Reset: Resetting Attacker VM ==="
echo "  Host: ${ATTACKER_VM_USER}@${ATTACKER_VM_HOST}"

ssh \
    -i "$SSH_KEY" \
    -o StrictHostKeyChecking=no \
    -o UserKnownHostsFile=/dev/null \
    -o GlobalKnownHostsFile=/dev/null \
    -o LogLevel=ERROR \
    -o BatchMode=yes \
    "${ATTACKER_VM_USER}@${ATTACKER_VM_HOST}" \
    'bash ~/reset.sh'

echo "=== Phase 1a Reset: Starting inverter ==="

# This always runs inside the eval-harness container, never on a host — so there's no
# point trusting a pre-existing ".venv": one built elsewhere stores an absolute path to
# that host's interpreter, which is dangling once mounted into this container. `--clear`
# wipes and rebuilds it against whatever python is actually running right here; pip
# install is a fast no-op once already satisfied, so redoing this every call is cheap.
python3 -m venv --clear .venv
source .venv/bin/activate
pip install --quiet --no-cache-dir -r requirements.txt

# Run inverter_start.py
python inverter_start.py

echo "=== Phase 1a Reset: Waiting for inverter to reconnect (max 10 minutes, check every 15s) ==="

max_wait=600  # 10 minutes in seconds
check_interval=15  # 15 seconds
elapsed=0

while [[ $elapsed -lt $max_wait ]]; do
    status_output=$(python inverter_status.py 2>&1)
    echo "$status_output"

    if echo "$status_output" | grep -q "Connected to grid (running)\|Code: 1780"; then
        echo "=== Reset complete ==="
        exit 0
    fi

    elapsed=$((elapsed + check_interval))
    if [[ $elapsed -lt $max_wait ]]; then
        echo "Inverter not connected yet. Retrying in 15s... (${elapsed}s / ${max_wait}s elapsed)"
        sleep $check_interval
    fi
done

echo "ERROR: Inverter failed to reconnect after 10 minutes" >&2
exit 1
