#!/bin/bash
set -e
set -u
set -x

# Ensure Docker daemon is running before pulling images
sudo systemctl start docker
until sudo docker info >/dev/null 2>&1; do sleep 2; done
# The docker group change from setup.sh is not reflected in this SSH session,
# so grant socket access explicitly for the duration of the build.
sudo chmod 666 /var/run/docker.sock

# Create config directory — populated post-deploy via ~/.decepticon/.env
mkdir -p ~/.decepticon

# Copy bundled files into the Decepticon home directory
cp /tmp/assets/docker-compose.yml ~/.decepticon/docker-compose.yml
cp -r /tmp/assets/config ~/.decepticon/config
cp -r /tmp/assets/containers ~/.decepticon/containers

# Pre-pull all images so decepticon-start doesn't block on downloads
cd ~/.decepticon
docker compose pull --quiet

# Install start and rebuild wrappers to /usr/local/bin
sudo mv /tmp/assets/start.sh /usr/local/bin/decepticon-start
sudo chmod +x /usr/local/bin/decepticon-start

sudo mv /tmp/assets/rebuild-web.sh /usr/local/bin/decepticon-rebuild-web
sudo chmod +x /usr/local/bin/decepticon-rebuild-web

