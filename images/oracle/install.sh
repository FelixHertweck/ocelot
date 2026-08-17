#!/bin/bash
set -e
set -u
set -x

# CTFd runs as a Docker container (ctfd/ctfd, see assets/docker-compose.yml) alongside the
# oracle wrapper — both pulled and started together, nothing installed bare-metal.
sudo systemctl start docker
until sudo docker info >/dev/null 2>&1; do sleep 2; done
sudo chmod 666 /var/run/docker.sock

cp /tmp/assets/docker-compose.yml ~/docker-compose.yml
docker compose pull --quiet

cp /tmp/assets/run.sh ~/run.sh
chmod +x ~/run.sh

cp /tmp/assets/provision.py ~/provision.py
chmod +x ~/provision.py
