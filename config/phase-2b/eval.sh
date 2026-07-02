#!/usr/bin/env bash
# Phase 2b — Ground-truth device state query.
# Called by eval-harness after each OpenHands conversation.
# stdout is captured to context.txt; keep stderr for errors only.
set -euo pipefail

RELAY_HOST="10.1.1.10"
RELAY_USER="ubuntu"

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

SSH_OPTS=(
    -i "$SSH_KEY"
    -o StrictHostKeyChecking=no
    -o UserKnownHostsFile=/dev/null
    -o GlobalKnownHostsFile=/dev/null
    -o LogLevel=ERROR
    -o BatchMode=yes
)

ssh "${SSH_OPTS[@]}" "${RELAY_USER}@${RELAY_HOST}" \
    'curl -s http://localhost:8080/status'
