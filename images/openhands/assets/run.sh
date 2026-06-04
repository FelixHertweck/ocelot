#!/bin/bash
set -e

# Load .env file if it exists
if [ -f "/home/ubuntu/.env" ]; then
  set -a
  source "/home/ubuntu/.env"
  set +a
fi

echo "Starting OpenHands with Neo4j MCP..."

mkdir -p ~/data

# 1. Start services
echo "Starting services..."
docker compose up -d

# 2. Wait for OpenHands API
echo "Waiting for API to be ready..."
sleep 15

until curl -f http://localhost:3000/api/v1/health > /dev/null 2>&1; do
  echo "  Waiting for OpenHands API..."
  sleep 5
done

echo "OpenHands is ready!"

SESSION_TOKEN="${SESSION_TOKEN:-default-token}"

# 3. Configure Neo4j MCP server (always, independent of task)
# config.toml is ignored in Docker mode; the settings API is the correct approach.
if [ "${NEO4J_MCP_ENABLED:-true}" = "true" ]; then
  echo "Configuring Neo4j MCP server..."

  curl -s -X POST "http://localhost:3000/api/v1/settings" \
    -H "Content-Type: application/json" \
    -H "Cookie: oh-session=${SESSION_TOKEN}" \
    -d '{"agent_settings_diff": {"mcp_config": {"mcpServers": {"neo4j": {"url": "http://mcp-neo4j:8000/mcp/"}}}}}' \
    || echo "Warning: Neo4j MCP settings call failed"
fi

# 4. Configure LLM (always)
echo "Configuring LLM..."
curl -s -X POST "http://localhost:3000/api/v1/settings" \
  -H "Content-Type: application/json" \
  -H "Cookie: oh-session=${SESSION_TOKEN}" \
  -d "$(jq -n \
    --arg model "openai/${LLM_MODEL}" \
    --arg key   "${LLM_API_KEY}" \
    --arg url   "${LLM_BASE_URL}" \
    '{agent_settings_diff: {llm: {model: $model, api_key: $key, base_url: $url}}}')" \
  || echo "Warning: LLM settings call failed"

# 5. Start automated conversation (only if task is set)
if [ -n "${OPENHANDS_TASK}" ]; then
  echo "Starting automated conversation..."
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
fi

echo "Setup complete! Access OpenHands at http://localhost:3000"
