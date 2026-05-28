# Phase 0: OpenHands

Deploys two VMs in a shared network:

| VM | Image | Role |
|---|---|---|
| `aloha-water-treatment` | `aloha-water-treatment:latest` | Modbus TCP water treatment plant simulator (target) |
| `openhands` | `openhands:latest` | AI-driven autonomous agent |

## Prerequisites

Complete **steps 1 and 2** of the [main README](../../README.md) first — OpenStack and `cave-infrastructure-docker` must be set up, and **both** the `aloha-water-treatment` and `openhands` images must be built and uploaded to OpenStack before continuing.

## 1. Place the Deployment Config

Clone the aegis-grid repository into `/tmp` and copy the entire `phase-0-openhands` folder into the `configs/` directory of your `cave-infrastructure-docker` checkout:

```bash
git clone https://github.com/FelixHertweck/aegis-grid.git /tmp/aegis-grid
cp -r /tmp/aegis-grid/config/phase-0-openhands ./configs/
```

## 2. Configure the Task

Edit `configs/phase-0-openhands/openhands.env` and fill in your LLM credentials and the task prompt:

```bash
nano configs/phase-0-openhands/openhands.env
```

| Variable | Description |
|---|---|
| `LLM_MODEL` | Model in provider-prefix format (e.g. `anthropic/claude-opus-4-7`) |
| `LLM_API_KEY` | API key for the LLM provider |
| `OPENHANDS_TASK` | The prompt OpenHands executes headlessly on VM start |

## 3. Deploy Infrastructure

```bash
# OpenVPN
docker compose run --rm cave /cave/deploy-wrapper.sh phase-0-openhands/phase0-openhands --lab-prefix aegis-p0oh

# WireGuard
docker compose run --rm cave /cave/deploy-wrapper.sh phase-0-openhands/phase0-openhands --wg --lab-prefix aegis-p0oh
```

The OpenHands agent starts automatically once the VM is up and the env file is in place. It reads `OPENHANDS_TASK` from `~/.openhands/.env` and runs headlessly — no interactive session required.

To run a one-off task manually after deployment:

```bash
ssh ubuntu@<openhands-ip> openhands-run "your task here"
```
