# Phase 0: Decepticon vs. Aloha Water Treatment

Deploys two VMs in a shared network:

| VM | Image | Role |
|---|---|---|
| `aloha-water-treatment` | `aloha-water-treatment:latest` | Modbus TCP water treatment plant simulator (target) |
| `decepticon` | `decepticon:latest` | AI-driven red team agent (attacker) |

## Prerequisites

Complete **steps 1 and 2** of the [main README](../../README.md) first — OpenStack and `cave-infrastructure-docker` must be set up, and **both** the `aloha-water-treatment` and `decepticon` images must be built and uploaded to OpenStack before continuing.

## 1. Place the Deployment Config

Clone the aegis-grid repository into `/tmp` and copy the entire `phase-0` folder into the `configs/` directory of your `cave-infrastructure-docker` checkout:

```bash
git clone https://github.com/FelixHertweck/aegis-grid.git /tmp/aegis-grid
cp -r /tmp/aegis-grid/config/phase-0 ./configs/
```

## 2. Deploy Infrastructure

Run the interactive wrapper from your `cave-infrastructure-docker` directory:

```bash
docker compose run --rm cave /cave/deploy-wrapper.sh
```

To deploy non-interactively with a custom lab prefix:

```bash
# OpenVPN
docker compose run --rm cave /cave/deploy-wrapper.sh phase-0/phase0-decepticon --lab-prefix aegis-p0

# WireGuard
docker compose run --rm cave /cave/deploy-wrapper.sh phase-0/phase0-decepticon --wg --lab-prefix aegis-p0
```

Both VMs are fully configured automatically during deployment via `postCommand`:

- **aloha-water-treatment**: restarts `aloha-plc.service` and `aloha-hmi.service`
- **decepticon**: runs `set-targets.sh` (auto-detects the shared subnet, verifies Modbus/HMI reachability, patches `~/.decepticon/.env`) and then starts the agent via `decepticon-start`

The Decepticon dashboard URL (`http://<decepticon-ip>:3000`) is printed to the VM console at the end of the `postCommand`.
