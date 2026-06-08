#!/bin/bash
set -e
set -u
set -x

# Ensure Docker daemon is running before pulling images
sudo systemctl start docker
until sudo docker info >/dev/null 2>&1; do sleep 2; done
sudo chmod 666 /var/run/docker.sock

# Copy bundled files into the home directory
cp /tmp/assets/docker-compose.yml ~/docker-compose.yml
cp /tmp/assets/run.sh ~/run.sh
chmod +x ~/run.sh

# ── gateway-user setup ─────────────────────────────────────────────────────

# Create restricted user for OT network SSH pivot access
sudo useradd -m -s /bin/bash gateway-user

# Generate RSA 4096 SSH key pair
sudo -u gateway-user mkdir -p /home/gateway-user/.ssh
sudo chmod 700 /home/gateway-user/.ssh
sudo -u gateway-user ssh-keygen -t rsa -b 4096 \
  -f /home/gateway-user/.ssh/gateway_rsa \
  -N "" \
  -C "gateway-user@ot-management-gateway"

# Install public key for SSH authentication
sudo cp /home/gateway-user/.ssh/gateway_rsa.pub \
        /home/gateway-user/.ssh/authorized_keys
sudo chmod 600 /home/gateway-user/.ssh/authorized_keys
sudo chown gateway-user:gateway-user /home/gateway-user/.ssh/authorized_keys

# Place private key in the protected directory mounted into the Docker container
sudo mkdir -p /opt/gateway-protected
sudo cp /home/gateway-user/.ssh/gateway_rsa /opt/gateway-protected/gateway_rsa
sudo chmod 644 /opt/gateway-protected/gateway_rsa

# ── SSH hardening ──────────────────────────────────────────────────────────

sudo tee /etc/ssh/sshd_config.d/99-gateway-hardening.conf > /dev/null <<'EOF'
# Allow only gateway-user (OT pivot) and ubuntu (admin); reject everything else
AllowUsers gateway-user ubuntu

# Key-based authentication only
PasswordAuthentication no
PubkeyAuthentication yes

# No direct root login
PermitRootLogin no
EOF

sudo systemctl restart ssh

# ── Kernel IP forwarding ───────────────────────────────────────────────────

sudo tee /etc/sysctl.d/99-gateway.conf > /dev/null <<'EOF'
net.ipv4.ip_forward = 1
EOF
sudo sysctl -p /etc/sysctl.d/99-gateway.conf

# ── Pre-pull Docker image ──────────────────────────────────────────────────

docker compose pull --quiet
