#!/bin/bash
set -e
set -u
set -x

export DEBIAN_FRONTEND=noninteractive

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    git

sudo timedatectl set-timezone Europe/Berlin
