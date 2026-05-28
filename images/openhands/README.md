# OpenHands

Builds an Ubuntu 24.04 image with the [OpenHands](https://github.com/All-Hands-AI/OpenHands) CLI installed — an AI-driven autonomous software engineering agent that executes tasks headlessly.

## Configuration

All configuration lives in a single file: `config/phase-0-openhands/openhands.env` in this repository. Copy it to the deployed VM, fill in your values, and everything runs non-interactively.

```bash
scp config/phase-0-openhands/openhands.env ubuntu@<VM_IP>:~/.openhands/.env
ssh ubuntu@<VM_IP>
nano ~/.openhands/.env
```

| Variable | Description |
|---|---|
| `LLM_MODEL` | Model in provider-prefix format (e.g. `anthropic/claude-opus-4-7`) |
| `LLM_API_KEY` | API key for the LLM provider |
| `LLM_BASE_URL` | Optional custom LLM endpoint |
| `OPENHANDS_TASK` | Prompt executed headlessly on VM start |

## Running a Task

```bash
openhands-run "Write a Packer HCL configuration for OpenStack..."
```

The wrapper sources `~/.openhands/.env` and launches the agent as a background daemon:

```bash
nohup openhands --headless --override-with-envs -t "<task>" </dev/null >~/.openhands/run.log 2>&1 &
```

If no argument is given, `OPENHANDS_TASK` from the env file is used. The wrapper returns immediately after spawning; tail `~/.openhands/run.log` to follow progress.
