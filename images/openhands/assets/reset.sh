#!/bin/bash
set -euo pipefail

# Load .env if present
if [ -f "/home/ubuntu/.env" ]; then
  set -a
  source "/home/ubuntu/.env"
  set +a
fi

OPENHANDS_URL="${OPENHANDS_URL:-http://localhost:3000}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ── 1. Delete all conversations ───────────────────────────────────────────────
echo "=== Deleting OpenHands conversations ==="

deleted=0
while true; do
  response=$(curl -s "${OPENHANDS_URL}/api/v1/app-conversations/search?limit=100")

  ids=$(echo "$response" | jq -r '.items[].id // empty')
  [ -z "$ids" ] && break

  while IFS= read -r id; do
    echo "  Deleting $id"
    curl -s -X DELETE "${OPENHANDS_URL}/api/v1/app-conversations/${id}" > /dev/null
    ((deleted++)) || true
  done <<< "$ids"
done

echo "Deleted $deleted conversation(s)."

# ── 2. Reset Neo4j (OpenHands keeps running) ──────────────────────────────────
echo ""
echo "=== Resetting Neo4j ==="

cd "$SCRIPT_DIR"

echo "Stopping neo4j container..."
docker compose stop neo4j
docker compose rm -f neo4j

echo "Removing neo4j data volume..."
volume=$(docker volume ls -q --filter name=neo4j_data | head -1)
if [ -n "$volume" ]; then
  docker volume rm "$volume"
  echo "Removed volume: $volume"
else
  echo "No neo4j_data volume found, skipping."
fi

echo "Starting fresh neo4j..."
docker compose up -d neo4j

echo "Waiting for Neo4j to be healthy..."
until [ "$(docker inspect --format='{{.State.Health.Status}}' neo4j 2>/dev/null)" = "healthy" ]; do
  echo "  still waiting..."
  sleep 5
done

echo ""
echo "Done! Neo4j is fresh and all conversations have been deleted."
