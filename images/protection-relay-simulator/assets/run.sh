#!/bin/bash
set -e

echo "Starting Protection Relay Simulator..."
docker compose up -d

echo "Protection Relay Simulator started. Health is managed by Docker's built-in healthcheck."
