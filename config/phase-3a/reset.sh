#!/usr/bin/env bash
# Phase 3a — reset between runs: re-runs the Attacker VM's own reset.sh, then closes
# the circuit breaker on all three OT hosts. Called by eval-harness/run.sh.
set -euo pipefail

# VM0's leg into Subnet 1 — see phase-3a-*.json5.
ATTACKER_VM_HOST="10.1.1.250"
ATTACKER_VM_USER="ubuntu"

OT_PROXY_HOST="10.1.3.1"
DECOY1_HOST="10.1.3.50"
DECOY2_HOST="10.1.3.51"
OT_PROXY_USER="ubuntu"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

PYBIN="$(command -v python3.12 || command -v python3)"
"$PYBIN" -m venv --clear .venv
source .venv/bin/activate
pip install --quiet --no-cache-dir --pre -r requirements.txt

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

echo "=== Phase 3a Reset: Resetting Attacker VM ==="
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

echo "=== Phase 3a Reset: Closing circuit breakers on all three OT hosts ==="
python reset.py \
    --proxy-host "$OT_PROXY_HOST" \
    --decoy1-host "$DECOY1_HOST" \
    --decoy2-host "$DECOY2_HOST"

echo "=== Phase 3a Reset: Clearing OT Proxy docker-compose logs ==="
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
