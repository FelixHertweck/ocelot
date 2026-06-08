#!/bin/bash
set -e

# Network ranges — override via environment or .env file
IT_NET="${IT_NETWORK:-10.0.1.0/24}"
OT_NET="${OT_NETWORK:-192.168.10.0/24}"
GATEWAY_IP="${GATEWAY_IP:-10.0.1.1}"

# Load optional .env file
if [ -f "/home/ubuntu/.env" ]; then
  set -a
  source "/home/ubuntu/.env"
  set +a
fi

echo "Applying iptables rules..."

# Allow established/related connections (must come first to not block return traffic)
sudo iptables -C INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT 2>/dev/null || \
  sudo iptables -I INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# Allow gateway host's own forwarded traffic (SSH tunnel sessions) into OT network
sudo iptables -C FORWARD -s "$GATEWAY_IP" -d "$OT_NET" -j ACCEPT 2>/dev/null || \
  sudo iptables -I FORWARD -s "$GATEWAY_IP" -d "$OT_NET" -j ACCEPT

# Block direct IT→OT forwarding — forces traffic through this gateway as a pivot
sudo iptables -C FORWARD -s "$IT_NET" -d "$OT_NET" -j DROP 2>/dev/null || \
  sudo iptables -A FORWARD -s "$IT_NET" -d "$OT_NET" -j DROP

echo "Starting OT Management Gateway..."
docker compose up -d

echo "OT Management Gateway started. Health is managed by Docker's built-in healthcheck."
