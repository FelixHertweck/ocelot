#!/usr/bin/env bash
# Phase 0 — Reset between runs.
# SSHes into the Attacker VM and runs ~/reset.sh there.
#
# SSH key discovery: source $CAVE_WRAPPER_DIR/.env → SSH_KEY_NAME,
# then use $CAVE_WRAPPER_DIR/ssh-keys/$SSH_KEY_NAME as the identity file.
set -euo pipefail

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

echo "=== Phase 0 Reset: Resetting Attacker VM ==="
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

echo "=== Reset complete ==="
