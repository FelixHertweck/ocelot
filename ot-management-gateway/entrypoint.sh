#!/bin/sh
set -e

MODEL="${OT_DEVICE_MODEL:-}"
IP="${OT_DEVICE_IP:-}"
PORT="${OT_DEVICE_PORT:-}"

IT_IFACE_NAME="${IT_IFACE_NAME:-}"
IT_IFACE_IP="${IT_IFACE_IP:-}"
OT_IFACE_NAME="${OT_IFACE_NAME:-}"
OT_IFACE_IP="${OT_IFACE_IP:-}"

# Escape a string for safe embedding in a JSON value.
# Strips ASCII control characters (0x00-0x1F), then escapes backslash and double-quote.
json_esc() { printf '%s' "$1" | tr -d '\000-\037' | sed 's/\\/\\\\/g; s/"/\\"/g'; }

mkdir -p /var/www/gateway/api/v1/ot
mkdir -p /var/www/gateway/api/v1/network

# Generate interfaces.json from env vars; fall back to static file if unset
if [ -n "$IT_IFACE_NAME" ] || [ -n "$OT_IFACE_NAME" ]; then
    IT_NAME="$(json_esc "${IT_IFACE_NAME:-eth0}")"
    IT_IP_RAW="${IT_IFACE_IP:-}"
    IT_IP="$(json_esc "${IT_IP_RAW%%/*}")"
    IT_PREFIX="${IT_IP_RAW##*/}"
    case "$IT_PREFIX" in
        ''|*[!0-9]*|"$IT_IP_RAW") IT_SUBNET="255.255.255.0" ;;
        8)  IT_SUBNET="255.0.0.0" ;;
        16) IT_SUBNET="255.255.0.0" ;;
        *)  IT_SUBNET="255.255.255.0" ;;
    esac

    OT_NAME="$(json_esc "${OT_IFACE_NAME:-eth1}")"
    OT_IP_RAW="${OT_IFACE_IP:-}"
    OT_IP="$(json_esc "${OT_IP_RAW%%/*}")"
    OT_PREFIX="${OT_IP_RAW##*/}"
    case "$OT_PREFIX" in
        ''|*[!0-9]*|"$OT_IP_RAW") OT_SUBNET="255.255.255.0" ;;
        8)  OT_SUBNET="255.0.0.0" ;;
        16) OT_SUBNET="255.255.0.0" ;;
        *)  OT_SUBNET="255.255.255.0" ;;
    esac

    cat > /var/www/gateway/api/v1/network/interfaces.json <<EOF
{
  "interfaces": [
    {
      "name": "${IT_NAME}",
      "ip": "${IT_IP}",
      "subnet": "${IT_SUBNET}",
      "network": "IT",
      "status": "up"
    },
    {
      "name": "${OT_NAME}",
      "ip": "${OT_IP}",
      "subnet": "${OT_SUBNET}",
      "network": "OT",
      "status": "up",
      "inventory": "/api/v1/ot/assets"
    }
  ]
}
EOF
fi

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
