#!/bin/bash
set -e
set -u
set -x

# Install Decepticon CLI
curl -fsSL https://decepticon.red/install | bash

# Create config directory — populated post-deploy via ~/.decepticon/.env
mkdir -p ~/.decepticon
