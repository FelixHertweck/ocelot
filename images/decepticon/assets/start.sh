#!/bin/bash
set -e

DECEPTICON_DIR="${DECEPTICON_HOME:-$HOME/.decepticon}"

if [ -f "$DECEPTICON_DIR/.env" ]; then
    set -a
    # shellcheck disable=SC1090
    source "$DECEPTICON_DIR/.env"
    set +a
fi

cd "$DECEPTICON_DIR"
exec docker compose up -d --quiet-pull
