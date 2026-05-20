#!/bin/bash
set -e
set -u
set -x

# Ensure Docker daemon is running before the Decepticon installer checks for it
sudo systemctl start docker
until sudo docker info >/dev/null 2>&1; do sleep 2; done
# The docker group change from setup.sh is not reflected in this SSH session,
# so grant socket access explicitly for the duration of the build.
sudo chmod 666 /var/run/docker.sock

# Install Decepticon CLI
curl -fsSL https://decepticon.red/install | bash

# Create config directory — populated post-deploy via ~/.decepticon/.env
mkdir -p ~/.decepticon

# Install start wrapper to /usr/local/bin
sudo mv /tmp/decepticon-start.sh /usr/local/bin/decepticon-start
sudo chmod +x /usr/local/bin/decepticon-start
