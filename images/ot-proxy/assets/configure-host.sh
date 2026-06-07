#!/bin/bash
set -e

ENV_FILE="/home/ubuntu/ot-proxy.env"

if [ ! -f "$ENV_FILE" ]; then
  echo "No ot-proxy.env found, skipping host configuration."
  exit 0
fi

set -a
source "$ENV_FILE"
set +a

if [ -n "${OT_HOSTNAME:-}" ]; then
  echo "Setting hostname: $OT_HOSTNAME"
  sudo hostnamectl set-hostname "$OT_HOSTNAME"
fi

if [ -n "${OT_MAC_ADDRESS:-}" ]; then
  IFACE=$(ip route show default | awk '/default/ {print $5}' | head -1)
  if [ -z "$IFACE" ]; then
    echo "Could not determine default interface, skipping MAC change."
  else
    echo "Setting MAC address of $IFACE: $OT_MAC_ADDRESS"
    # Persist via netplan so the MAC survives reboots
    sudo tee /etc/netplan/99-ot-proxy.yaml > /dev/null <<EOF
network:
  version: 2
  ethernets:
    ${IFACE}:
      macaddress: "${OT_MAC_ADDRESS}"
EOF
    # Run netplan apply out-of-band so the current SSH session survives the
    # brief interface flap. systemd-run fires 2s after this script returns.
    sudo systemd-run --on-active=2s --timer-property=AccuracySec=1s netplan apply
  fi
fi
