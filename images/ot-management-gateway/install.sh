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

# ── admin setup ────────────────────────────────────────────────────────────

# Create restricted user for OT network SSH pivot access
sudo useradd -m -s /bin/bash admin

# Create .ssh directory with strict permissions (owner + mode in one step)
sudo install -d -m 700 -o admin -g admin \
  /home/admin/.ssh

# Generate RSA 4096 SSH key pair as admin
# ssh-keygen sets private key to 600 and public key to 644 automatically
sudo -u admin ssh-keygen -t rsa -b 4096 \
  -f /home/admin/.ssh/gateway_rsa \
  -N "" \
  -C "admin@ot-management-gateway"

# Install public key as authorized_keys (600, owned by admin)
sudo install -m 600 -o admin -g admin \
  /home/admin/.ssh/gateway_rsa.pub \
  /home/admin/.ssh/authorized_keys

# Place private key in the protected directory mounted into the NGINX container.
# 644: the nginx worker process (non-root) must be able to read it.
sudo install -d -m 755 /opt/gateway-protected
sudo install -m 644 -o root -g root \
  /home/admin/.ssh/gateway_rsa \
  /opt/gateway-protected/gateway_rsa

# ── SSH hardening ──────────────────────────────────────────────────────────

sudo tee /etc/ssh/sshd_config.d/99-gateway-hardening.conf > /dev/null <<'EOF'
# Allow only admin (OT pivot) and ubuntu (provisioning); reject everything else
AllowUsers admin ubuntu

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
