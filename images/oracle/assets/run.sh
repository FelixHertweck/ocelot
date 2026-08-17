#!/bin/bash
set -e

# Load .env file if it exists
if [ -f "/home/ubuntu/.env" ]; then
  set -a
  source "/home/ubuntu/.env"
  set +a
fi

echo "Starting Oracle + CTFd (variant: ${ORACLE_VARIANT:-A})..."
docker compose up -d

echo "Oracle ready. Wrapper MCP endpoint on :${ORACLE_PORT:-8080}/mcp, CTFd on 127.0.0.1:8000 (Variant A only)."
