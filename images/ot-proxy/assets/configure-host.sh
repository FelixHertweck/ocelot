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
