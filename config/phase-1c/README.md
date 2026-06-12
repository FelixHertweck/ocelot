# Phase 1c: OpenHands vs. SMA Inverter Emulator

Deploys two VMs in a shared network. OpenHands attacks a software-emulated SMA solar inverter that exposes unauthenticated Modbus TCP.

| VM | Image | Role |
|---|---|---|
| `inverter-emulator` | `inverter-emulator:latest` | SMA solar inverter emulator (target) |
| `openhands` | `openhands:latest` | AI-driven autonomous agent (attacker) |

The emulator runs a background simulation loop generating dynamic telemetry (fluctuating AC power, accumulating daily yield) and implements an Emergency Stop via holding register 40000.

## Prerequisites

Complete **steps 1 and 2** of the [main README](../../README.md) first — OpenStack and `cave-infrastructure-docker` must be set up, and **both** the `inverter-emulator` and `openhands` images must be built and uploaded to OpenStack before continuing.

## 1. Place the Deployment Config

Clone the aegis-grid repository into `/tmp` and copy the entire `phase-1c` folder into the `configs/` directory of your `cave-infrastructure-docker` checkout:

```bash
git clone https://github.com/FelixHertweck/aegis-grid.git /tmp/aegis-grid
cp -r /tmp/aegis-grid/config/phase-1c ./configs/phase-1c
```

## 2. Configure the Task

Edit `configs/phase-1c/openhands.env` and fill in your LLM credentials and the task prompt:

```bash
nano configs/phase-1c/openhands.env
```

| Variable | Description |
|---|---|
| `LLM_MODEL` | Model in provider-prefix format (e.g. `anthropic/claude-opus-4-7`) |
| `LLM_API_KEY` | API key for the LLM provider |
| `OPENHANDS_TASK` | The prompt OpenHands executes headlessly on VM start |

Use one of the prompts from [`docs/prompts/Phase-1c.md`](../../docs/prompts/Phase-1c.md) as the task value.

## 3. Deploy Infrastructure

Run the interactive wrapper from your `cave-infrastructure-docker` directory:

```bash
docker compose run --rm cave /cave/deploy-wrapper.sh
```

To deploy non-interactively with a custom lab prefix:

```bash
# OpenVPN
docker compose run --rm cave /cave/deploy-wrapper.sh phase-1c/phase-1c --lab-prefix aegis-p1c

# WireGuard
docker compose run --rm cave /cave/deploy-wrapper.sh phase-1c/phase-1c --wg --lab-prefix aegis-p1c
```

Both VMs are fully configured automatically during deployment via `postCommand`:

- **inverter-emulator**: starts the Docker container exposing Modbus TCP on port 502
- **openhands**: runs `run.sh` which reads `OPENHANDS_TASK` from `~/.env` and starts the agent headlessly — no interactive session required

## 4. Connect and Access

After deployment, retrieve the OpenVPN client config from your `cave-infrastructure-docker` output directory and connect from your local machine:

```bash
sudo openvpn --config out/<your-prefix>/openvpn/admins/admin1.ovpn
```

**OpenHands runs fully automatically** — no further action required. You can follow progress via the dashboard:

| Service | URL / Address |
|---|---|
| OpenHands dashboard | http://10.1.1.20:3000/ |
| Inverter Emulator (Modbus TCP) | 10.1.1.10:502 |
