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
REPO_REF="v1.1.6"
SRC_DIR="$DECEPTICON_DIR/src"

git -C "$SRC_DIR" fetch --tags origin
git -C "$SRC_DIR" checkout "$REPO_REF"
# Discard patches from a previous run so this run always re-applies the
# CURRENT env. Without this, the Dockerfile ENV injection below is guarded
# by `grep` and silently skips — leaving a stale NEXT_PUBLIC_* URL baked in
# — and the CSP sed would append a duplicate host every run.
git -C "$SRC_DIR" checkout -- .

# Patch the Dockerfile to expose NEXT_PUBLIC_* build args to next build.
# Without ARG+ENV declarations in the build stage the values passed via
# docker compose build args never reach `next build` and localhost stays baked in.
DOCKERFILE="$SRC_DIR/containers/web.Dockerfile"
if ! grep -q "NEXT_PUBLIC_LANGGRAPH_API_URL" "$DOCKERFILE"; then
    LANGGRAPH_URL="${NEXT_PUBLIC_LANGGRAPH_API_URL:-http://localhost:2024}"
    TERMINAL_URL="${NEXT_PUBLIC_TERMINAL_WS_URL:-ws://localhost:3003}"
    sed -i '/^RUN npm run build$/i ENV NEXT_PUBLIC_LANGGRAPH_API_URL='"${LANGGRAPH_URL}"'\nENV NEXT_PUBLIC_TERMINAL_WS_URL='"${TERMINAL_URL}" "$DOCKERFILE"
fi

# Patch CSP to allow connections to the configured external hosts.
# The upstream app hardcodes only localhost in connect-src, which blocks
# any non-localhost NEXT_PUBLIC_* URL set in the env.
LANGGRAPH_HOST=$(echo "${NEXT_PUBLIC_LANGGRAPH_API_URL:-http://localhost:2024}" | sed 's|^[a-z]*://||' | cut -d'/' -f1)
TERMINAL_HOST=$(echo "${NEXT_PUBLIC_TERMINAL_WS_URL:-ws://localhost:3003}" | sed 's|^[a-z]*://||' | cut -d'/' -f1)

sed -i "s|ws://localhost:\* http://localhost:\*|ws://localhost:* http://localhost:* ws://${TERMINAL_HOST} http://${LANGGRAPH_HOST}|g" \
    "$SRC_DIR/clients/web/next.config.ts"

export DECEPTICON_SRC_DIR="./src"

cd "$DECEPTICON_DIR"
docker compose --env-file "$ENV_FILE" build web
