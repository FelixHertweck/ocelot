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

python eval.py --host 10.1.1.15 --port 102 --json

echo "=== Docker Compose Logs from 10.1.1.15 ===" >&2
ssh \
    -i "$SSH_KEY" \
    -o StrictHostKeyChecking=no \
    -o UserKnownHostsFile=/dev/null \
    -o GlobalKnownHostsFile=/dev/null \
    -o LogLevel=ERROR \
    -o BatchMode=yes \
    "${OT_PROXY_USER}@${OT_PROXY_HOST}" \
    'docker compose logs' 2>&1 || echo "SSH/Docker Compose logs failed" >&2
