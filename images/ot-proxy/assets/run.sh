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

echo "OT-Proxy started. Health is managed by Docker's built-in healthcheck."
