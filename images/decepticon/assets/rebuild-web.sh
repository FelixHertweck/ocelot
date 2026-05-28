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

if [ -d "$SRC_DIR/.git" ]; then
    git -C "$SRC_DIR" fetch --tags origin
    git -C "$SRC_DIR" checkout "$REPO_REF"
else
    git clone --depth 1 --branch "$REPO_REF" "$REPO_URL" "$SRC_DIR"
fi

export DECEPTICON_SRC_DIR="./src"

cd "$DECEPTICON_DIR"
docker compose build web
