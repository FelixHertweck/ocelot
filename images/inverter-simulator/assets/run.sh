#!/bin/bash
set -e

echo "Starting Inverter Simulator..."
docker compose up -d

echo "Inverter Simulator started. Health is managed by Docker's built-in healthcheck."
