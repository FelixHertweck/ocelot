#!/bin/bash
set -e
set -u
set -x

# Ensure Docker daemon is running before pulling images
sudo systemctl start docker
until sudo docker info >/dev/null 2>&1; do sleep 2; done
# The docker group change from setup.sh is not reflected in this SSH session,
# so grant socket access explicitly for the duration of the install.
sudo chmod 666 /var/run/docker.sock

# Copy bundled files into the OpenHands home directory
cp /tmp/assets/docker-compose.yml ~/docker-compose.yml
cp /tmp/assets/config.toml ~/config.toml

# Pre-pull all images so openhands-run doesn't block on downloads
docker compose pull --quiet

# Also pre-pull the agent-server image (declared as env vars, not as a compose service)
AGENT_REPO=$(grep 'AGENT_SERVER_IMAGE_REPOSITORY' ~/docker-compose.yml | awk -F': ' '{print $2}' | tr -d ' ')
AGENT_TAG=$(grep 'AGENT_SERVER_IMAGE_TAG' ~/docker-compose.yml | awk -F': ' '{print $2}' | tr -d ' ')
docker pull --quiet "${AGENT_REPO}:${AGENT_TAG}"

# Pre-pull the Neo4j MCP server image (used as a stdio MCP server by OpenHands)
docker pull --quiet mcp/neo4j

# Install the run wrapper
cp /tmp/assets/run.sh  ~/run.sh
chmod +x ~/run.sh
