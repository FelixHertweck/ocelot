# Hinter

Builds VM9, the standalone hint service for the attacker LLM — see
[`../../hinter/README.md`](../../hinter/README.md) for what Hinter is and how it works. This
README covers only what's specific to *this* Packer image.

## What's installed

The `hinter` wrapper runs as a Docker container via `docker compose`
(`assets/docker-compose.yml`) — nothing installed bare-metal, no external backend. It's pulled
from `ghcr.io/felixhertweck/ocelot-hinter:main` (built by
[`.github/workflows/hinter.yml`](../../.github/workflows/hinter.yml) from
[`../../hinter/`](../../hinter/)) and reads hint content directly from a mounted JSON file (see
"Deploying a run" below) — no separate content-store service to run alongside it.

No nginx/TLS layer: the wrapper's own MCP endpoint is reachable only from VM0 over the internal
management network — never from the scenario subnets, never from the public internet.

## Configuration

All configuration is environment variables consumed by `run.sh` from `/home/ubuntu/.env`, same
pattern as `images/openhands`. Full variable reference:
[`../../hinter/README.md#configuration`](../../hinter/README.md#configuration).

```bash
scp hinter.env ubuntu@<VM9_IP>:~/.env
ssh ubuntu@<VM9_IP> ./run.sh
```

## Deploying a run

1. Copy `hinter/content/hints/<scenario>.json` to `~/hinter/content/` on VM9. The wrapper's own
   log ends up in `~/hinter/logs/`, mounted the same way (see `assets/docker-compose.yml`) — one
   file per MCP session, see [`../../hinter/README.md#structured-log`](../../hinter/README.md#structured-log).
2. `./run.sh` to (re)start the wrapper with the run's `.env`. It reads the mounted content file
   at startup — replacing the file requires a restart (`docker compose restart hinter`) to pick
   up, it isn't read live per request.

Reusing a VM9 for a new run: either replace the mounted content file and restart, or call
`POST /reset` on the wrapper to wipe prior sessions' logs first (see
[`../../hinter/README.md#reporting-get-report`](../../hinter/README.md#reporting-get-report)).
