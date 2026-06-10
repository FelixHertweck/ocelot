#!/bin/bash
set -e
set -u
set -x

export DEBIAN_FRONTEND=noninteractive

sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
  ca-certificates curl iptables-persistent netfilter-persistent

# Install Docker
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
  | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" \
  | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
  docker-ce \
  docker-ce-cli \
  containerd.io \
  docker-buildx-plugin \
  docker-compose-plugin

sudo usermod -aG docker "$USER"

# Set MTU to 1442 for all Docker networks (fixes slow internet in OpenStack environments)
sudo tee /etc/docker/daemon.json > /dev/null <<'EOF'
{
  "mtu": 1442
}
EOF

sudo systemctl enable docker
sudo systemctl start docker

sudo timedatectl set-timezone Europe/Berlin

# Fix asymmetric routing for dual-homed instances:
# When two NICs are present, DHCP on the secondary interface overwrites the
# default route set by the primary. This service removes spurious default routes
# at boot so management traffic (SSH, Ansible) always exits via eth0/ens3.
sudo tee /usr/local/bin/fix-multinic-routes.sh > /dev/null <<'EOF'
#!/bin/bash
# Remove default routes from all interfaces except the one with the lowest
# kernel index (ens3/eth0 = the first-attached OpenStack network).
PRIMARY=$(ip -br link show | grep -v '^lo' | sort | head -1 | cut -d' ' -f1)
ip route show | grep '^default' | while read -r route; do
  iface=$(echo "$route" | grep -o 'dev [^ ]*' | awk '{print $2}')
  if [ "$iface" != "$PRIMARY" ]; then
    ip route del $route
  fi
done
EOF
sudo chmod +x /usr/local/bin/fix-multinic-routes.sh

sudo tee /etc/systemd/system/fix-multinic-routes.service > /dev/null <<'EOF'
[Unit]
Description=Remove spurious default routes from secondary NICs
After=network-online.target
Wants=network-online.target

[Service]
Type=oneshot
ExecStart=/usr/local/bin/fix-multinic-routes.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl enable fix-multinic-routes.service
