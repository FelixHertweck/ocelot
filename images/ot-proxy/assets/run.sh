#!/bin/bash
set -e

# Load .env file if it exists
if [ -f "/home/ubuntu/.env" ]; then
  set -a
  source "/home/ubuntu/.env"
  set +a
fi

/home/ubuntu/configure-host.sh

echo "Starting OT-Proxy..."
docker compose up -d

echo "Waiting for OT-Proxy to become ready..."
until docker compose ps | grep -q "healthy\|running"; do
  echo "  Waiting..."
  sleep 3
done

echo "OT-Proxy is running."
