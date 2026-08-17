# Oracle

Builds VM9, the standalone hint service for the attacker LLM — see
[`../../oracle/README.md`](../../oracle/README.md) for what Oracle is and how it works. This
README covers only what's specific to *this* Packer image.

## What's installed

Both run as Docker containers via `docker compose` (`assets/docker-compose.yml`) — nothing
installed bare-metal.

- **CTFd** ([`ctfd/ctfd:3.7.7`](https://hub.docker.com/r/ctfd/ctfd)), published only to
  `127.0.0.1:8000` on the host — Variant A's hint-content backend. A fresh `ctfd-uploads` volume
  starts empty; setup, points, and hint content are provisioned per-run (see "Deploying a run"
  below) and then persist across restarts, reboots, and `docker compose down` — only
  `docker compose down -v` wipes it.
- **The `oracle` wrapper**, pulled from `ghcr.io/felixhertweck/ocelot-oracle:main` (built by
  [`.github/workflows/oracle.yml`](../../.github/workflows/oracle.yml) from
  [`../../oracle/`](../../oracle/)), reaching CTFd by its service name (`ctfd`) over the default
  compose network. **Both hint variants (A and B) ship in this one container image** — `run.sh`
  starts it with whatever `ORACLE_VARIANT` the deploy config supplies; there is no separate
  "Variant A image" / "Variant B image".

No nginx/TLS layer: CTFd isn't reachable from outside the VM at all — the oracle wrapper talks
to it over the internal compose network, and the loopback-only host port exists solely for the
provisioning steps below. The wrapper's own MCP endpoint is reachable only from VM0 over the
internal management network — never from the scenario subnets, never from the public internet.

## Configuration

All configuration is environment variables consumed by `run.sh` from `/home/ubuntu/.env`, same
pattern as `images/openhands`. Full variable reference:
[`../../oracle/README.md#configuration`](../../oracle/README.md#configuration).

```bash
scp oracle.env ubuntu@<VM9_IP>:~/.env
ssh ubuntu@<VM9_IP> ./run.sh
```

## Deploying a run

`run.sh` only (re)starts CTFd and the wrapper container — it does **not** provision CTFd's
setup wizard, per-run user, or scenario content. Those are run-scoped, provisioned separately,
against `http://127.0.0.1:8000` on VM9.

CTFd's state persists across restarts (see "What's installed"), so reusing a VM9 for a new run
needs a clean slate first: `docker compose down -v`.

1. Copy `oracle/content/hints/<scenario>.json` (Variant A) or
   `oracle/content/solution-guides/<scenario>.md` (Variant B) to `~/oracle/content/` on VM9
   (mounted read-only into the wrapper container, see `assets/docker-compose.yml`). The
   wrapper's own log ends up in `~/oracle/logs/` the same way.
2. `./run.sh` to (re)start CTFd and the wrapper with the run's `.env`. The wrapper logs in to
   CTFd at startup, so for Variant A it will crash-loop until step 3 provisions its account —
   `restart: unless-stopped` recovers it automatically once that's done.
3. For Variant A only: `./provision.py content/hints/<scenario>.json`. Completes CTFd's setup
   wizard (creating `CTFD_USERNAME`/`CTFD_PASSWORD` from the run's `.env` as a plain user — see
   `oracle/README.md`'s "CTFd auth" section for why), grants that user a point balance, and
   imports the scenario's hint content. Safe to re-run.
