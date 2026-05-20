#!/bin/bash
set -e

ENV_FILE="${DECEPTICON_HOME:-$HOME/.decepticon}/.env"

if [ -f "$ENV_FILE" ]; then
    set -a
    # shellcheck disable=SC1090
    source "$ENV_FILE"
    set +a
fi

# Generate engagement workspace from env vars if DECEPTICON_ENGAGEMENT_NAME is set
# and the workspace files don't already exist.
if [ -n "${DECEPTICON_ENGAGEMENT_NAME:-}" ]; then
    WORKSPACE="${DECEPTICON_HOME:-$HOME/.decepticon}/workspace/${DECEPTICON_ENGAGEMENT_NAME}"
    mkdir -p "$WORKSPACE"

    if [ ! -f "$WORKSPACE/roe.md" ]; then
        {
            echo "# Rules of Engagement"
            echo ""
            echo "## Authorization"
            echo "- **Authorized by:** ${DECEPTICON_AUTHORIZED_BY:-}"
            echo "- **Testing window:** ${DECEPTICON_TESTING_WINDOW:-}"
            echo ""
            echo "## Scope"
            echo ""
            echo "### In-scope targets"
            if [ -n "${DECEPTICON_TARGET_RANGES:-}" ]; then
                echo "$DECEPTICON_TARGET_RANGES" | tr ',' '\n' \
                    | sed 's/^ *//;s/ *$//' | grep -v '^$' | sed 's/^/- /'
            fi
            if [ -n "${DECEPTICON_TARGET_URLS:-}" ]; then
                echo "$DECEPTICON_TARGET_URLS" | tr ',' '\n' \
                    | sed 's/^ *//;s/ *$//' | grep -v '^$' | sed 's/^/- /'
            fi
            echo ""
            echo "### Out-of-scope"
            if [ -n "${DECEPTICON_SCOPE_EXCLUDE:-}" ]; then
                echo "$DECEPTICON_SCOPE_EXCLUDE" | tr ',' '\n' \
                    | sed 's/^ *//;s/ *$//' | grep -v '^$' | sed 's/^/- /'
            fi
            echo ""
            echo "## Permitted actions"
            echo "- Network reconnaissance"
            echo "- Vulnerability scanning"
            echo "- Exploitation of in-scope systems"
            echo "- Privilege escalation"
            echo "- Lateral movement within scope"
        } > "$WORKSPACE/roe.md"
    fi

    if [ ! -f "$WORKSPACE/conops.md" ]; then
        {
            echo "# Concept of Operations"
            echo ""
            echo "## Engagement overview"
            echo "- **Name:** ${DECEPTICON_ENGAGEMENT_NAME}"
            echo "- **Objective:** ${DECEPTICON_OBJECTIVE:-}"
            echo ""
            echo "## Threat actor profile"
            echo "- **Profile:** ${DECEPTICON_THREAT_PROFILE:-nation-state}"
            echo ""
            echo "## OPSEC requirements"
            echo "- **Noise level:** ${DECEPTICON_OPSEC_LEVEL:-medium}"
        } > "$WORKSPACE/conops.md"
    fi
fi

exec decepticon "$@"
