# Decepticon

Builds an Ubuntu 24.04 image with [Decepticon](https://github.com/PurpleAILAB/Decepticon) installed — an AI-driven autonomous red team agent that executes complete attack chains via Docker-orchestrated microservices.

## Configuration

All configuration lives in a single file: `config/decepticon.env` in this repository. Copy it to the deployed VM, fill in your values, and everything runs non-interactively.

```bash
scp config/decepticon.env ubuntu@<VM_IP>:~/.decepticon/.env
ssh ubuntu@<VM_IP>
nano ~/.decepticon/.env
```

The file contains three sections:

| Section | What to configure |
|---|---|
| LLM providers | API keys for at least one provider |
| Engagement | Target subnet/IP ranges, threat profile, scope |
| Databases | Change `POSTGRES_PASSWORD` and `NEO4J_PASSWORD` |

## Starting Decepticon

```bash
decepticon-start
```

This wrapper script:
1. Sources `~/.decepticon/.env`
2. If `DECEPTICON_ENGAGEMENT_NAME` is set, generates the workspace files (`roe.md`, `conops.md`) from the engagement variables in the config — the interactive Soundwave dialog is skipped
3. Starts `decepticon`

The interactive onboarding wizard (credentials) is also **automatically skipped** because `~/.decepticon/.env` already exists.

The web dashboard is then available at `http://<VM_IP>:3000`.

To force reconfiguration of credentials:

```bash
decepticon onboard --reset
```

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
