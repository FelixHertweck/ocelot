#!/bin/bash
set -e

echo "Starting Inverter Emulator..."
docker compose up -d

echo "Inverter Emulator started. Health is managed by Docker's built-in healthcheck."
