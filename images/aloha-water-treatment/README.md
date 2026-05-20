# Aloha Water Treatment Simulator

This image builds an Ubuntu 24.04 VM running the [MITRE Aloha Water Treatment Simulator](https://github.com/mitre/aloha-water-treatment) — a simplified water treatment plant simulation exposing Modbus TCP and a Flask-based HMI web interface. It serves as the OT target in Decepticon scenario deployments.

## Services

| Service | Port | Description |
|---|---|---|
| Modbus TCP (PLC) | 5020 | Pymodbus TCP server with holding registers, coils, and input registers |
| HMI Web Interface | 8090 | Flask-based web HMI connecting to the local PLC |

Both services start automatically via systemd (`aloha-plc.service`, `aloha-hmi.service`) on boot.

## Building the Image

```bash
docker compose run --rm cave /cave/build-images.sh https://github.com/FelixHertweck/aegis-grid.git
```

Select `aloha-water-treatment` when prompted.

## Configuration

The Decepticon scenario is configured via a JSON file placed in the CAVE infrastructure backend.

### Configuration File

The example configuration is located at:

```
config/aloha-water-treatment.example.json
```

### Where to Place It

Copy the example config to the `backend/configs/` directory of your [cave-infrastructure-docker](https://github.com/FelixHertweck/cave-infrastructure-docker) checkout and rename it:

```bash
cp config/aloha-water-treatment.example.json <path-to-cave-infrastructure-docker>/backend/configs/aloha-water-treatment.json
```

Adjust the `image_name_prefix` values to match the image names built by Packer (use `openstack image list` to confirm).

### Deploying the Scenario

Run the following command from within your `cave-infrastructure-docker` directory:

```bash
docker compose run --rm cave /cave/deploy-wrapper.sh aloha-water-treatment
```

To tear down the deployment:

```bash
docker compose run --rm cave /cave/exterminate.sh aloha-water-treatment
```
