#!/bin/bash
set -e
set -u
set -x

APP_DIR="/opt/aloha-water-treatment"
APP_USER="ubuntu"
ENV_FILE="/etc/aloha-water-treatment.env"

sudo git clone https://github.com/mitre/aloha-water-treatment.git "${APP_DIR}"

sudo python3 -m venv "${APP_DIR}/venv"
sudo "${APP_DIR}/venv/bin/pip" install --upgrade pip
sudo "${APP_DIR}/venv/bin/pip" install -r "${APP_DIR}/requirements.txt"

sudo chown -R "${APP_USER}:${APP_USER}" "${APP_DIR}"

sudo tee "${ENV_FILE}" > /dev/null <<'EOF'
MODBUS_PORT=5020
EOF
sudo chmod 0644 "${ENV_FILE}"

sudo tee /etc/systemd/system/aloha-plc.service > /dev/null <<EOF
[Unit]
Description=Aloha Water Treatment PLC (Modbus TCP)
After=network.target

[Service]
Type=simple
User=${APP_USER}
WorkingDirectory=${APP_DIR}/modbus-sim/plc
EnvironmentFile=${ENV_FILE}
Environment=MODBUS_HOST=0.0.0.0
ExecStart=${APP_DIR}/venv/bin/python3 plc.py
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

sudo tee /etc/systemd/system/aloha-hmi.service > /dev/null <<EOF
[Unit]
Description=Aloha Water Treatment HMI (Flask Web Interface)
After=network.target aloha-plc.service
Requires=aloha-plc.service

[Service]
Type=simple
User=${APP_USER}
WorkingDirectory=${APP_DIR}/modbus-sim/hmi
EnvironmentFile=${ENV_FILE}
Environment=MODBUS_HOST=127.0.0.1
ExecStart=${APP_DIR}/venv/bin/python3 HMI.py
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl enable aloha-plc.service
sudo systemctl enable aloha-hmi.service
