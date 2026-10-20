# fuxa-hmi

Ubuntu 24.04 image running [FUXA](https://github.com/frangoteam/FUXA) (`frangoteam/fuxa`)
via Docker Compose — an open-source web SCADA/HMI/dashboard. Used as a read-only tag
database; nothing on this host issues control commands.

## What this image does

- Installs Docker (same boilerplate as the other Linux images here).
- Ships `docker-compose.yml` (`frangoteam/fuxa:latest`, port 1881) and a generic
  `mysettings.json` (`secureEnabled: true`, a non-default `secretCode`, no secrets).
- Pre-pulls the FUXA image; `run.sh` starts the container and waits for
  `http://localhost:1881/`.

## Admin credential

FUXA's factory default is `admin` / `123456`. Not baked into the image — the container
doesn't exist at build time (`install.sh` only pulls it; `run.sh` starts it, at deploy time).

`run.sh` repoints it instead: if `/home/ubuntu/.env` (via CAVE's `configFiles`) sets
`FUXA_ADMIN_PASSWORD`, it signs in with the factory default, then `POST /api/users` to
overwrite the password. Idempotent, non-fatal, persists in the `fuxa_db` volume. Leave
`FUXA_ADMIN_PASSWORD` unset to keep the account at its factory default.

By hand: `POST /api/signin` with the factory default to get a token, then `POST /api/users`
with that token.
