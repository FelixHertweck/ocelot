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

# Copy bundled files into the home directory
cp /tmp/assets/docker-compose.yml ~/docker-compose.yml

# Pre-pull the ot-proxy image
docker compose pull --quiet

# Install the run wrapper and host-configuration script
cp /tmp/assets/run.sh ~/run.sh
chmod +x ~/run.sh
cp /tmp/assets/configure-host.sh ~/configure-host.sh
chmod +x ~/configure-host.sh
