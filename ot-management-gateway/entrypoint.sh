#!/bin/sh
set -e

MODEL="${OT_DEVICE_MODEL:-}"
IP="${OT_DEVICE_IP:-}"
PORT="${OT_DEVICE_PORT:-}"

# Escape a string for safe embedding in a JSON value
json_esc() { printf '%s' "$1" | sed 's/\\/\\\\/g; s/"/\\"/g'; }

mkdir -p /var/www/gateway/api/v1/ot

if [ -n "$MODEL" ]; then
    FIELDS="\"protocol\": \"Modbus TCP\", \"type\": \"field_device\", \"model\": \"$(json_esc "$MODEL")\""

    if [ -n "$IP" ]; then
        PORT_VAL="${PORT:-502}"
        # Validate port is a plain integer in 1-65535; fall back to 502 otherwise
        case "$PORT_VAL" in
            ''|*[!0-9]*) PORT_VAL=502 ;;
        esac
        [ "$PORT_VAL" -ge 1 ] && [ "$PORT_VAL" -le 65535 ] || PORT_VAL=502
        FIELDS="${FIELDS}, \"ip\": \"$(json_esc "$IP")\", \"port\": ${PORT_VAL}"
    fi

    printf '{\n  "segment": "OT",\n  "devices": [\n    { %s }\n  ]\n}\n' "$FIELDS" \
        > /var/www/gateway/api/v1/ot/assets.json
else
    printf '{\n  "segment": "OT",\n  "devices": []\n}\n' \
        > /var/www/gateway/api/v1/ot/assets.json
fi

exec nginx -g 'daemon off;'
