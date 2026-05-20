# Decepticon

Builds an Ubuntu 24.04 image with [Decepticon](https://github.com/PurpleAILAB/Decepticon) installed — an AI-driven autonomous red team agent that executes complete attack chains via Docker-orchestrated microservices.

## Configuration

Decepticon reads its configuration from `~/.decepticon/.env` on the deployed VM. This file is **not** baked into the image and must be provided after deployment.

Use `config/decepticon.env.example` from this repository as a template:

```bash
# Copy the example config to the deployed VM
scp config/decepticon.env.example ubuntu@<VM_IP>:~/.decepticon/.env

# SSH into the VM and fill in your API keys and passwords
ssh ubuntu@<VM_IP>
nano ~/.decepticon/.env
```

At minimum, set one LLM API key (e.g. `ANTHROPIC_API_KEY`) and change the default database passwords (`POSTGRES_PASSWORD`, `NEO4J_PASSWORD`).

## Starting Decepticon

After placing the configuration file, start Decepticon with:

```bash
decepticon
```

The web dashboard is then available at `http://<VM_IP>:3000`.

## Services

Decepticon orchestrates the following Docker containers:

| Service    | Port       | Purpose                      |
|------------|------------|------------------------------|
| Web UI     | 3000       | Next.js dashboard            |
| LangGraph  | 2024       | Agent orchestration API      |
| LiteLLM    | 4000       | LLM proxy and routing        |
| PostgreSQL | 5432       | Relational database          |
| Neo4j      | 7474, 7687 | Attack chain knowledge graph |
| Sandbox    | —          | Isolated Kali execution env  |
