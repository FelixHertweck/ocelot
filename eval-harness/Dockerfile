FROM python:3.12-slim

# System deps: bash, curl, openvpn (for VPN tunnel), iproute2 (ip route),
# openssh-client (scenario scripts SSH into CAVE hosts), Docker CLI (for CAVE deploy)
RUN apt-get update && apt-get install -y --no-install-recommends \
        bash curl ca-certificates gnupg iproute2 openvpn openssh-client \
    && curl -fsSL https://download.docker.com/linux/debian/gpg \
        | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
        https://download.docker.com/linux/debian bookworm stable" \
        > /etc/apt/sources.list.d/docker.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends docker-ce-cli docker-compose-plugin \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY src/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Source code is baked into the image; config and results are mounted at runtime:
#   ./docker/config  → /app/config
#   ./docker/results → /app/results
COPY src/ .

ENTRYPOINT ["bash", "run.sh"]
