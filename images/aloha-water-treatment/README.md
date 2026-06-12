# Aloha Water Treatment Simulator

This image builds an Ubuntu 24.04 VM running the [MITRE Aloha Water Treatment Simulator](https://github.com/mitre/aloha-water-treatment) — a simplified water treatment plant simulation exposing Modbus TCP and a Flask-based HMI web interface. It serves as the OT target in attack scenario deployments.

## Services

| Service | Port | Description |
|---|---|---|
| Modbus TCP (PLC) | 5020 | Pymodbus TCP server with holding registers, coils, and input registers |
| HMI Web Interface | 8090 | Flask-based web HMI connecting to the local PLC |

Both services start automatically via systemd (`aloha-plc.service`, `aloha-hmi.service`) on boot.

## Building the Image

```bash
docker compose run --rm cave /cave/build-images.sh https://github.com/FelixHertweck/ocelot.git
```

Select `aloha-water-treatment` when prompted.

## Configuration

The simulator reads its configuration from `/etc/aloha-water-treatment.env` on the deployed VM. This file is created with defaults during image build and can be overridden after deployment.

Use `config/aloha-water-treatment.env.example` from this repository as a reference:

```bash
# Copy the example config to the deployed VM
scp config/aloha-water-treatment.env.example ubuntu@<VM_IP>:/etc/aloha-water-treatment.env

# Restart services to apply changes
ssh ubuntu@<VM_IP> "sudo systemctl restart aloha-plc.service aloha-hmi.service"
```

The only configurable parameter is `MODBUS_PORT` (default: `5020`). The PLC binds to all interfaces (`0.0.0.0`) and the HMI connects to it locally (`127.0.0.1`) — both using the configured port.
