# Aegis Grid: AI-Driven Multi-Agent System for ICS Exploitation

Current monolithic Large Language Models (LLMs) often fail at executing multi-step attacks on Industrial Control Systems (ICS). This project implements a LangGraph-based multi-agent system specifically tailored for testing energy hardware OT devices. 

It provides an Infrastructure-as-Code (IaC) testbed that dynamically loads attack scenarios against standard base images (using physical hardware and custom software emulations).

**Important:** This project is designed for **OpenStack** environments and utilizes the [**CAVE**](https://gitlab.opencode.de/BSI-Bund/cave) infrastructure for deployment.

**Note:** This is a research project. Detailed documentation, including Architectural Decision Records (ADRs) and the project proposal, can be found in the `docs/` folder.

## Project Structure

* **`.github/`**: GitHub Actions workflows for CI/CD.
* **`config/`**: Configuration files for the cave deployment.
* **`docs/`**: Project documentation.
  * **`adrs/`**: Architecture Decision Records.
* **`images/`**: Packer configurations to build the VM images for the ICS testbed (inspired by `cave-infrastructure-docker`).
  * **`attacker/`**: Attacker image — installs Kali Linux with VNC, noVNC, MCP server, AI agent tooling, and scenario-specific attack tools. Must be built for the attacker VM.
* **`src/`**: Source code for the AI agents and knowledge graph.
  * **`agents/`**: LangGraph orchestration, Recon Agent, and Execution Agent.
  * **`kg/`**: Knowledge Graph integration and schema definitions.
* **`tests/`**: Unit and integration tests for agents and emulators.

## Getting Started

Deployment is managed using the [CAVE Infrastructure Docker Wrapper](https://github.com/FelixHertweck/cave-infrastructure-docker). Ensure you have a running OpenStack environment and the necessary credentials. For more details see [README of CAVE Infrastructure Docker](https://github.com/FelixHertweck/cave-infrastructure-docker/blob/main/README.md).

### 1. Prepare Environment
Ensure you have a running OpenStack environment (e.g., by installing MicroStack). 
For full details on these steps, see the [CAVE Infrastructure Docker README](https://github.com/FelixHertweck/cave-infrastructure-docker/blob/main/README.md).

```bash
git clone https://github.com/FelixHertweck/cave-infrastructure-docker.git
cd cave-infrastructure-docker
cp .env.sample .env
# /!\ Configure .env and place your SSH keys in ./ssh-keys/ before continuing /!\

# Start the docker container in the background
docker compose up -d

# Run the host initialization script (sets up NAT, flavors, VPN users, etc.)
sudo ./scripts/post-openstack-init.sh

# Run the pre-build setup (downloads base images and sets up security groups)
docker compose run --rm cave /cave/pre-build-images.sh
```

### 2. Build the Base Images
Build the Aegis base images using Packer by providing this repository's URL. Make sure to build **all** required images during this interactive step.

```bash
docker compose run --rm cave /cave/build-images.sh https://github.com/FelixHertweck/aegis-grid.git
```

### 3. Deploy Infrastructure

For deployment guides see the specific scenario documentation:

- [Phase 0 — Decepticon vs. Aloha Water Treatment](config/phase-0/README.md)
