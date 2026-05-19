#!/bin/bash
set -e
set -u
set -x

myuser="kali"
vnc_pass="kali"
home_path="/home/${myuser}"
vnc_path="${home_path}/.vnc"

# Update and install
export DEBIAN_FRONTEND=noninteractive
sudo apt-get update

# Install Kali Tools (headless contains CLI tools), UI, VNC, noVNC, nodejs, npm and MCP server
sudo -E apt-get install -y kali-linux-headless xfce4 xfce4-goodies tigervnc-standalone-server dbus-x11 novnc websockify nodejs npm jq curl mcp-kali-server

# Ensure passwordless sudo for user 'kali'
echo "${myuser} ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/${myuser}
sudo chmod 0440 /etc/sudoers.d/${myuser}

# Setup VNC password
sudo mkdir -p "${vnc_path}"
echo "${vnc_pass}" | sudo vncpasswd -f | sudo tee "${vnc_path}/passwd" > /dev/null
sudo chown -R "${myuser}:${myuser}" "${vnc_path}"
sudo chmod 0600 "${vnc_path}/passwd"

# Setup xstartup
sudo cat <<EOF | sudo tee "${vnc_path}/xstartup" > /dev/null
#!/bin/sh
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
startxfce4
EOF
sudo chmod +x "${vnc_path}/xstartup"
sudo chown "${myuser}:${myuser}" "${vnc_path}/xstartup"

# Create VNC Service
sudo tee /etc/systemd/system/vncserver@.service > /dev/null <<EOF
[Unit]
Description=Start TigerVNC server at startup
After=syslog.target network.target

[Service]
Type=forking
User=$myuser
Group=$myuser
WorkingDirectory=$home_path

PIDFile=$vnc_path/%H:%i.pid
ExecStartPre=-/usr/bin/vncserver -kill :%i > /dev/null 2>&1
ExecStart=/usr/bin/vncserver -depth 24 -geometry 1280x720 -localhost no :%i
ExecStop=/usr/bin/vncserver -kill :%i

Restart=always
RestartSec=3

[Install]
WantedBy=multi-user.target
EOF

# Generate self-signed certificate for noVNC (HTTPS)
sudo openssl req -x509 -nodes -newkey rsa:3072 -keyout /etc/ssl/private/novnc.key -out /etc/ssl/certs/novnc.pem -days 365 -subj "/CN=kali-agent"
sudo chown $myuser:$myuser /etc/ssl/private/novnc.key /etc/ssl/certs/novnc.pem

# Create noVNC Service
sudo tee /etc/systemd/system/novnc.service > /dev/null <<EOF
[Unit]
Description=Start noVNC server
After=syslog.target network.target vncserver@1.service

[Service]
Type=simple
User=$myuser
Group=$myuser
ExecStart=/usr/bin/websockify --web /usr/share/novnc --cert=/etc/ssl/certs/novnc.pem --key=/etc/ssl/private/novnc.key --wrap-mode=ignore 6080 localhost:5901

Restart=always
RestartSec=3

[Install]
WantedBy=multi-user.target
EOF

sudo chmod +x /etc/systemd/system/vncserver@.service
sudo chmod +x /etc/systemd/system/novnc.service

sudo systemctl enable vncserver@1.service
sudo systemctl enable novnc.service

# Setup agent terminal environment variables (to help LLM output parsing)
sudo cat <<EOF | sudo tee /etc/profile.d/agent-env.sh > /dev/null
# Variables to help AI agents parse terminal output easily
export TERM=dumb
export NO_COLOR=1
EOF

sudo timedatectl set-timezone Europe/Berlin

# Change cloud-init config to prevent automatic disabling of the kali login (if applicable)
if [ -f /etc/cloud/cloud.cfg.d/20_kali.cfg ]; then
  sudo sed -i -e 's/lock_passwd\: True/lock_passwd\: False/g' /etc/cloud/cloud.cfg.d/20_kali.cfg || true
fi
