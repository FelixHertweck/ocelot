#!/bin/bash
set -e

# Load .env file if it exists
if [ -f "/home/ubuntu/.env" ]; then
  set -a
  source "/home/ubuntu/.env"
  set +a
fi

# Create the bind-mount source dirs up front so they end up owned by ubuntu
mkdir -p ~/hinter/content ~/hinter/logs

echo "Starting Hinter..."
docker compose up -d

echo "Hinter ready. Wrapper MCP endpoint on :${HINTER_PORT:-8080}/mcp."
