#!/bin/bash
set -e

# Load .env file if it exists
if [ -f "/home/ubuntu/.env" ]; then
  set -a
  source "/home/ubuntu/.env"
  set +a
fi

echo "Starting OT-Gateway..."
docker compose up -d

echo "Waiting for OT-Gateway to become ready..."
until docker compose ps | grep -q "healthy\|running"; do
  echo "  Waiting..."
  sleep 3
done

echo "OT-Gateway is running."
