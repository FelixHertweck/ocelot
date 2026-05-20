#!/usr/bin/env bash
# Detects the aloha-water-treatment target IP and patches ~/.decepticon/.env.
# Run on the decepticon VM after deployment.
set -euo pipefail

ENV_FILE="${HOME}/.decepticon/.env"
MODBUS_PORT=5020
HMI_PORT=8090

die() { echo "ERROR: $*" >&2; exit 1; }

# Derive own subnet (first interface with a 10.x.x.x address, excluding loopback)
own_ip=$(ip -4 addr show scope global \
  | grep -oP '10\.\d+\.\d+\.\d+' \
  | head -1)
[[ -n "$own_ip" ]] || die "No 10.x.x.x address found on this VM."

subnet_prefix=$(echo "$own_ip" | cut -d. -f1-3)
target_ip="${subnet_prefix}.10"

echo "Own IP    : ${own_ip}"
echo "Target IP : ${target_ip}"

# Verify connectivity
ping -c1 -W2 "$target_ip" &>/dev/null \
  || die "Target ${target_ip} is not reachable (ping failed)."

check_port() {
  local port=$1
  nc -z -w3 "$target_ip" "$port" &>/dev/null \
    || die "Port ${port} on ${target_ip} is not open."
  echo "Port ${port} : open"
}

check_port "$MODBUS_PORT"
check_port "$HMI_PORT"

# Patch or create .env
patch_env() {
  local key=$1 value=$2
  if grep -q "^${key}=" "$ENV_FILE" 2>/dev/null; then
    sed -i "s|^${key}=.*|${key}=${value}|" "$ENV_FILE"
  else
    echo "${key}=${value}" >> "$ENV_FILE"
  fi
}

[[ -f "$ENV_FILE" ]] || die "${ENV_FILE} not found — copy decepticon.env there first."

patch_env "DECEPTICON_TARGET_RANGES" "${target_ip}/32"
patch_env "DECEPTICON_TARGET_URLS"   "http://${target_ip}:${HMI_PORT}"

echo ""
echo "Patched ${ENV_FILE}:"
echo "  DECEPTICON_TARGET_RANGES=${target_ip}/32"
echo "  DECEPTICON_TARGET_URLS=http://${target_ip}:${HMI_PORT}"
web_port=$(grep -oP '(?<=^WEB_PORT=)\d+' "$ENV_FILE" 2>/dev/null || echo 3000)
echo ""
echo "Decepticon dashboard : http://${own_ip}:${web_port}"
