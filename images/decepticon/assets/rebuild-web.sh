#!/bin/bash
set -euo pipefail

DECEPTICON_DIR="${DECEPTICON_HOME:-$HOME/.decepticon}"
ENV_FILE="$DECEPTICON_DIR/.env"

if [ -f "$ENV_FILE" ]; then
    set -a
    # shellcheck disable=SC1090
    source "$ENV_FILE"
    set +a
fi

REPO_URL="https://github.com/purpleailab/decepticon"
REPO_REF="v1.1.3"
SRC_DIR="$DECEPTICON_DIR/src"

git -C "$SRC_DIR" fetch --tags origin
git -C "$SRC_DIR" checkout "$REPO_REF"
# Discard patches from a previous run so this run always re-applies the
# CURRENT env. Without this, the Dockerfile ENV injection below is guarded
# by `grep` and silently skips — leaving a stale NEXT_PUBLIC_* URL baked in
# — and the CSP sed would append a duplicate host every run.
git -C "$SRC_DIR" checkout -- .

export DECEPTICON_SRC_DIR="./src"

cd "$DECEPTICON_DIR"
docker compose --env-file "$ENV_FILE" build web
