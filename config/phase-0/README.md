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

## 3. Push Configs and Start Decepticon

After deployment, push the engagement configs to both VMs.

**Before pushing**, open `./configs/phase-0/decepticon.env` and add your LLM API key (at minimum `ANTHROPIC_API_KEY`).

Push `aloha-water-treatment.env` to the target VM and restart both services:

```bash
docker compose run --rm cave /cave/push-vm-config.sh \
  --only-instances aloha-water-treatment-1 \
  --config-file ./configs/phase-0/aloha-water-treatment.env \
  --remote-path /etc/aloha-water-treatment.env \
  --post-command "sudo systemctl restart aloha-plc.service aloha-hmi.service"
```

Push `decepticon.env` to the decepticon VM (the destination directory is created automatically):

```bash
docker compose run --rm cave /cave/push-vm-config.sh \
  --only-instances decepticon-1 \
  --config-file ./configs/phase-0/decepticon.env \
  --remote-path /home/ubuntu/.decepticon/.env
```

Push `set-targets.sh`, run it, and start Decepticon in one step:

```bash
docker compose run --rm cave /cave/push-vm-config.sh \
  --only-instances decepticon-1 \
  --config-file ./configs/phase-0/set-targets.sh \
  --remote-path /home/ubuntu/set-targets.sh \
  --post-command "bash ~/set-targets.sh && decepticon-start"
```

`set-targets.sh` runs on the decepticon VM itself — it reads the VM's own network interface to derive the shared subnet, then builds the target IP as `<subnet>.10`. It will:

1. Verify Modbus (port 5020) and HMI (port 8090) on `aloha-water-treatment` are reachable
2. Patch `~/.decepticon/.env` with `DECEPTICON_TARGET_RANGES` and `DECEPTICON_TARGET_URLS`
3. Print the Decepticon dashboard URL (`http://<decepticon-ip>:3000`)

After that `decepticon-start` launches the agent immediately.
