#!/bin/bash
set -e

# Load .env file if it exists
if [ -f "/home/ubuntu/.env" ]; then
  set -a
  source "/home/ubuntu/.env"
  set +a
fi

echo "Starting OpenHands with Neo4j MCP..."

# Write OpenHands config with Neo4j MCP server before starting
mkdir -p ~/data
NEO4J_PASSWORD="${NEO4J_PASSWORD:-neo4j}" envsubst < ~/config.toml > ~/data/config.toml

# 1. Docker Compose starten
echo "Starting services..."
docker compose up -d

# 2. Warten bis API bereit ist
echo "⏳ Waiting for API to be ready..."
sleep 15

# Warten auf Health Check
until curl -f http://localhost:3000/api/v1/health > /dev/null 2>&1; do
  echo "  Waiting for OpenHands API..."
  sleep 5
done

echo "✅ OpenHands is ready!"

# 3. Optional: LLM über API konfigurieren
echo "🔧 Configuring LLM..."
SESSION_TOKEN="${SESSION_TOKEN:-default-token}"

curl -s -X POST "http://localhost:3000/api/v1/settings" \
  -H "Content-Type: application/json" \
  -H "Cookie: oh-session=${SESSION_TOKEN}" \
  -d '{
    "agent_settings_diff": {
      "llm": {
        "model": "openai/'${LLM_MODEL}'",
        "api_key": "'${LLM_API_KEY}'",
        "base_url": "'${LLM_BASE_URL}'"
      }
    }
  }' || echo "⚠️ LLM configuration via API (optional)"

# 4. Automatisch Conversation starten
echo "🤖 Starting automated conversation..."
curl -s -X POST "http://localhost:3000/api/v1/app-conversations/stream-start" \
  -H "Content-Type: application/json" \
  -H "Cookie: oh-session=${SESSION_TOKEN}" \
  --no-buffer \
  -d "$(jq -n --arg task "${OPENHANDS_TASK}" '{
    title: "Automated Task",
    agent_type: "default",
    initial_message: {
      role: "user",
      content: [{"type": "text", "text": $task}]
    }
  }')"

echo "✅ Setup complete! Access OpenHands at http://localhost:3000"