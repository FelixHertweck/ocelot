#!/bin/bash
set -e

# Load .env file if it exists
if [ -f "/home/ubuntu/.env" ]; then
  set -a
  source "/home/ubuntu/.env"
  set +a
fi

echo "Starting FUXA HMI..."
docker compose up -d

echo "Waiting for FUXA web UI..."
until curl -sf http://localhost:1881/ > /dev/null 2>&1; do
  sleep 2
done

echo "FUXA HMI started. Access it at http://localhost:1881"

# Optional: repoint the admin account if FUXA_ADMIN_PASSWORD is set (factory
# default is admin/123456). Idempotent, never fatal — see README.md "Admin credential".
set +e

# Minimal JSON string escaper (no jq on this image).
json_escape() {
  local s=$1
  s=${s//\\/\\\\}
  s=${s//\"/\\\"}
  printf '%s' "$s"
}

if [ -n "${FUXA_ADMIN_PASSWORD:-}" ]; then
  echo "Repointing FUXA admin credential..."
  fuxa_pw_json=$(json_escape "$FUXA_ADMIN_PASSWORD")

  already_ok=$(curl -sf -X POST http://localhost:1881/api/signin \
    -H 'Content-Type: application/json' \
    -d "{\"username\":\"admin\",\"password\":\"${fuxa_pw_json}\"}" \
    | grep -c -E '"status"[[:space:]]*:[[:space:]]*"success"')

  if [ "$already_ok" = "1" ]; then
    echo "FUXA admin credential already set to the target password."
  else
    token=$(curl -sf -X POST http://localhost:1881/api/signin \
      -H 'Content-Type: application/json' \
      -d '{"username":"admin","password":"123456"}' \
      | sed -n 's/.*"token"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p')

    if [ -z "$token" ]; then
      echo "WARNING: could not sign in with FUXA's factory-default credential —" >&2
      echo "WARNING: admin password was NOT repointed. Repoint manually, see" >&2
      echo "WARNING: README.md 'Admin credential'." >&2
    else
      curl -sf -X POST http://localhost:1881/api/users \
        -H "x-access-token: ${token}" \
        -H 'Content-Type: application/json' \
        -d "{\"params\":{\"username\":\"admin\",\"fullname\":\"Administrator Account\",\"password\":\"${fuxa_pw_json}\",\"groups\":-1,\"info\":null}}" \
        > /dev/null

      verify_ok=$(curl -sf -X POST http://localhost:1881/api/signin \
        -H 'Content-Type: application/json' \
        -d "{\"username\":\"admin\",\"password\":\"${fuxa_pw_json}\"}" \
        | grep -c -E '"status"[[:space:]]*:[[:space:]]*"success"')

      if [ "$verify_ok" = "1" ]; then
        echo "FUXA admin credential repointed and verified."
      else
        echo "WARNING: FUXA admin credential repoint did not verify — check manually." >&2
      fi
    fi
  fi
fi

set -e
