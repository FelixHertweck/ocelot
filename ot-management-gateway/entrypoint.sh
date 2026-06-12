#!/bin/sh
set -e

MODEL="${OT_DEVICE_MODEL:-}"
IP="${OT_DEVICE_IP:-}"
PORT="${OT_DEVICE_PORT:-}"

mkdir -p /var/www/gateway/api/v1/ot

if [ -n "$MODEL" ]; then
    # Build device JSON — ip/port included only when provided
    FIELDS="\"protocol\": \"Modbus TCP\", \"type\": \"field_device\", \"model\": \"${MODEL}\""
    if [ -n "$IP" ]; then
        PORT_VAL="${PORT:-502}"
        FIELDS="${FIELDS}, \"ip\": \"${IP}\", \"port\": ${PORT_VAL}"
    fi
    printf '{\n  "segment": "OT",\n  "devices": [\n    { %s }\n  ]\n}\n' "$FIELDS" \
        > /var/www/gateway/api/v1/ot/assets.json
else
    printf '{\n  "segment": "OT",\n  "devices": []\n}\n' \
        > /var/www/gateway/api/v1/ot/assets.json
fi

exec nginx -g 'daemon off;'
