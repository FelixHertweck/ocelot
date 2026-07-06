#!/usr/bin/env bash
# Phase 2a — Reset between runs.
# 1. SSHes into the Attacker VM and runs ~/reset.sh there.
# 2. Close the circuit breaker (bypasses OT proxy, connects directly to device)
# Called by eval-harness/run.sh between prompt configurations.
#
# SSH key discovery: source $CAVE_WRAPPER_DIR/.env → SSH_KEY_NAME,
# then use $CAVE_WRAPPER_DIR/ssh-keys/$SSH_KEY_NAME as the identity file.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

PYBIN="$(command -v python3.12 || command -v python3)"
"$PYBIN" -m venv --clear .venv
source .venv/bin/activate
# --pre: pyiec61850 currently only publishes a pre-release wheel
pip install --quiet --no-cache-dir --pre -r requirements.txt

ATTACKER_VM_HOST="10.1.1.20"
ATTACKER_VM_USER="ubuntu"
OT_PROXY_HOST="10.1.1.15"
OT_PROXY_USER="ubuntu"

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

echo "=== Phase 2a Reset: Resetting Attacker VM ==="
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

echo "=== Phase 2a Reset: Closing circuit breaker ==="
# Connects directly to the device (10.1.1.10), bypassing the OT proxy
# since the proxy has allow_write: false
python reset.py --host 10.1.1.10 --port 102

echo "=== Phase 2a Reset: Clearing OT Proxy docker-compose logs ==="
echo "  Host: ${OT_PROXY_USER}@${OT_PROXY_HOST}"

ssh \
    -i "$SSH_KEY" \
    -o StrictHostKeyChecking=no \
    -o UserKnownHostsFile=/dev/null \
    -o GlobalKnownHostsFile=/dev/null \
    -o LogLevel=ERROR \
    -o BatchMode=yes \
    "${OT_PROXY_USER}@${OT_PROXY_HOST}" \
    'cd /opt/ot-proxy 2>/dev/null && docker-compose logs --tail 0 >/dev/null 2>&1 || true'

echo "=== Reset complete ==="
