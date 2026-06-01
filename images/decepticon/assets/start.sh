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
docker compose up -d --quiet-pull

# Auto-create engagement after startup if DECEPTICON_ENGAGEMENT_NAME is set.
# Idempotent: HTTP 409 (already exists) is treated as success so re-running
# decepticon-start on an existing lab does not fail.
if [ -n "${DECEPTICON_ENGAGEMENT_NAME:-}" ]; then
    WEB_URL="http://localhost:${WEB_PORT:-3000}"

    # Wait up to 3 minutes for the web container to pass its healthcheck.
    # The entrypoint runs `prisma migrate deploy` before starting the server,
    # so healthy == DB migrated == API ready.
    i=0
    health=""
    while [ "$health" != "healthy" ] && [ "$i" -lt 36 ]; do
        sleep 5
        i=$((i + 1))
        health=$(docker inspect decepticon-web --format '{{.State.Health.Status}}' 2>/dev/null || true)
    done

    if [ "$health" != "healthy" ]; then
        echo "Warning: web service not ready after 3 minutes — skipping auto-engagement creation"
    else
        payload=$(jq -n \
            --arg name  "$DECEPTICON_ENGAGEMENT_NAME" \
            --arg type  "${DECEPTICON_ENGAGEMENT_TARGET_TYPE:-ip_range}" \
            --arg value "${DECEPTICON_ENGAGEMENT_TARGET_VALUE:-}" \
            '{"name":$name,"targetType":$type,"targetValue":$value}')
        status=$(curl -s -o /dev/null -w "%{http_code}" \
            -X POST "${WEB_URL}/api/engagements" \
            -H "Content-Type: application/json" \
            -d "$payload" 2>/dev/null || echo "000")
        case "$status" in
            201) echo "Engagement '${DECEPTICON_ENGAGEMENT_NAME}' created." ;;
            409) echo "Engagement '${DECEPTICON_ENGAGEMENT_NAME}' already exists, skipping." ;;
            *)   echo "Warning: engagement creation returned HTTP ${status}." ;;
        esac
    fi
fi
