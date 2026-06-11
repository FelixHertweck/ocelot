#!/bin/bash
set -e

echo "Starting Protection Relay Emulator..."
docker compose up -d

echo "Protection Relay Emulator started. Health is managed by Docker's built-in healthcheck."
