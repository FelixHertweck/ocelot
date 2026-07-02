# OCELOT Eval-Harness

Automated evaluator for OCELOT scenarios. Deploys a scenario with CAVE, runs an OpenHands agent against each knowledge-gradient prompt configuration, collects all artifacts, and generates a structured evaluation document using an LLM.

```
CAVE Deploy → [per-prompt: OpenHands run → collect artifacts → reset] → LLM evaluation → evaluation.md → CAVE Teardown
```

---

## Prerequisites

- Docker with Compose plugin (`docker compose`)
- The `cave-infrastructure-docker` repository checked out on the host
- An API key for an OpenAI-compatible LLM

---

## Quick Start

```bash
cd eval-harness/docker

# 1. Configure environment
cp .env.example .env
$EDITOR .env                    # set EVAL_LLM_API_KEY, CAVE_WRAPPER_DIR

# 2. Add your prompts
cp ../../docs/prompts/Phase-2a.md config/prompts/

# 3. (optional) Customize the run config
cp config/config.yml config/config-myrun.yml
$EDITOR config/config-myrun.yml

# 4. Run
docker compose run --rm eval
CONFIG=config-myrun.yml docker compose run --rm eval

# 5. Skip deploy (already-running lab)
docker compose run --rm eval run.sh --skip-deploy

# 6. Keep lab running after the eval
docker compose run --rm eval run.sh --keep-deployment

# 7. Resume an interrupted run (skips already-completed prompts)
docker compose run --rm eval run.sh --resume

# 8. Re-run only the evaluation step on existing results
docker compose run --rm eval python3 evaluate.py \
  --config /app/config/config.yml \
  --run-dir /app/results/<lab_prefix>
```

---

## run.sh Flags

| Flag | Description |
|---|---|
| `--config FILE` | Explicit config file path (overrides `$CONFIG` env var) |
| `--skip-deploy` | Skip CAVE deploy and VPN setup; use with an already-running lab. Also skips teardown. |
| `--keep-deployment` | Run as normal but do not tear down the lab after the eval completes. |
| `--resume` | Skip prompt runs that already have a `status.json` with status `stopped` or `finished`. |

Flags can be combined, e.g. `run.sh --skip-deploy --resume` to continue a partially-run eval on an existing lab.

---

## evaluate.py Flags

Runs the LLM evaluation step standalone on an existing results directory, without re-deploying or re-running OpenHands. Per-prompt `eval_block.json` files are cached — only missing ones trigger a new LLM call.

| Flag | Description |
|---|---|
| `--config FILE` | Path to the run config YAML (required) |
| `--run-dir DIR` | Results directory containing `prompt-N/` subdirectories (required) |
| `--extraction-prompt FILE` | Override the extraction prompt file |
| `--template FILE` | Override the evaluation template file |

```bash
docker compose run --rm eval python3 evaluate.py \
  --config /app/config/config.yml \
  --run-dir /app/results/phase-2a-1530
```

---

## Configuration (`config/config.yml`)

All paths inside `config.yml` are **container-internal paths**. Select a non-default config with `CONFIG=filename.yml docker compose run --rm eval`. Multiple config files can coexist in `config/`.

| Section | Key | Default | Description |
|---|---|---|---|
| `scenario` | `cave_config_name` | — | CAVE config name; also used to locate scenario scripts |
| `scenario` | `cave_wrapper_dir` | `/cave-wrapper` | CAVE wrapper dir (mounted from `$CAVE_WRAPPER_DIR` in `.env`) |
| `scenario` | `configs_subpath` | `backend/configs` | Subpath within `cave_wrapper_dir` where scenario configs live |
| `deploy` | `wait_time` | `600` | Seconds to wait after CAVE deploy completes |
| `deploy` | `lab_prefix` | `auto` | Lab name prefix; `auto` generates `<scenario>-<YYYYMMDD>-<HHMM>` |
| `deploy` | `public_vpn_port` | `auto` | VPN port; `auto` picks the first free port from `port_pool` |
| `deploy` | `port_pool` | `51820-51920` | Port range for auto VPN port selection |
| `openhands` | `base_url` | `http://10.1.1.20:3000` | OpenHands URL (reachable via VPN) |
| `openhands` | `poll_interval` | `15` | Seconds between conversation status polls |
| `openhands` | `run_timeout` | `3600` | Max seconds per run before the conversation is force-stopped |
| `prompts` | `source` | — | Prompt file (relative to `config/prompts/` or absolute) |
| `prompts` | `mode` | `cumulative` | `cumulative`: each run appends the next hint; `individual`: each hint runs alone |
| `context_script` | `cmd` | `bash eval.sh` | Command run after each OpenHands conversation; stdout → `context.txt` |
| `cleanup_script` | `cmd` | `bash reset.sh` | Command run between prompt runs to reset device state |
| `evaluation` | `extraction_prompt` | built-in | Path to the per-run extraction prompt file |
| `evaluation` | `template` | built-in | Path to the evaluation document template |
| `evaluation.llm` | `model` | `gpt-4o` | LLM model used for evaluation |
| `evaluation.llm` | `api_key` | — | LLM API key (or set `EVAL_LLM_API_KEY` in `.env`) |
| `evaluation.llm` | `base_url` | — | LLM base URL for non-OpenAI providers |

The scenario scripts (`eval.sh`, `reset.sh`) are looked up at:
`{cave_wrapper_dir}/{configs_subpath}/{cave_config_name}/`

---

## Prompt File Format

Prompt files (`config/prompts/*.md`) use this structure:

```markdown
# Phase X – Title (optional, skipped by parser)

# Hint Overview (optional, skipped)

# Base Prompt
<base prompt text — sent alone in run 0>

# Hint 1:
<hint 1 text — appended to base in run 1>

# Hint 2:
<hint 2 text — appended in run 2>
```

In `cumulative` mode, run N receives `Base + Hint 1 + … + Hint N`. In `individual` mode, each section is sent alone.

---

## Scenario Scripts

Each scenario must provide `eval.sh` and `reset.sh` in its config directory. See [`config/README.md`](../config/README.md) for the full contract. In brief:

- **`eval.sh`** — queries the device for ground-truth state after a run; stdout/stderr → `context.txt`. VPN is active when it runs.
- **`reset.sh`** — restores the device to its initial state between prompt runs. Called between consecutive runs, not after the last.

---

## Customising the Evaluation Prompt

The default extraction prompt (`src/prompts/extraction.md`) is generic. For scenario-specific evaluation, provide a custom prompt and enable it in `config.yml`:

```yaml
evaluation:
  extraction_prompt: /app/config/evaluation-prompt.md
  template: /app/config/evaluation-template.md
```

An example for Phase 2a (IEC 61850 / SIPROTEC 5) is included at `docker/config/evaluation-prompt.md`.

---

## Building the Image Locally

```bash
cd eval-harness/docker
docker compose build
```

Or pull the published image from GHCR (built automatically on push to `main` when `src/` or `Dockerfile` changes):

```
ghcr.io/felixhertweck/ocelot-eval-harness:main
```

---

## Directory Structure

```
eval-harness/
  Dockerfile              ← builds the harness container (all deps baked in)
  src/                    ← source code copied into the image
    run.sh                ← main orchestration (deploy → run loop → evaluation → teardown)
    evaluate.py           ← standalone evaluation step (reads existing results)
    lib/                  ← Python libraries
    prompts/              ← default evaluation template and extraction prompt
  docker/                 ← deployment directory — work from here
    docker-compose.yml
    .env.example          ← copy to .env and fill in
    config/               ← your scenario configs (mounted read-only into container)
      config.yml          ← example run configuration
      evaluation-prompt.md ← example LLM evaluation prompt (scenario-specific)
      evaluation-template.md ← evaluation document template
      prompts/            ← place your prompt .md files here
        Phase-2a.md       ← example
    results/              ← run output (gitignored, created by the harness)
      <lab_prefix>/       ← one folder per run
        evaluation.md     ← final evaluation document
        run.log
        meta.json
        prompt-0/         ← base prompt run
          prompt.txt, conversation.md, metrics.json, context.txt, status.json
        prompt-1/         ← base + hint 1 run
          ...
```

---

## Troubleshooting

| Symptom | Likely cause |
|---|---|
| `Set EVAL_LLM_API_KEY` error | `.env` file missing or `EVAL_LLM_API_KEY` not exported |
| VPN route never appears | `/dev/net/tun` not mounted or `NET_ADMIN` cap missing |
| OpenHands unreachable | VPN tunnel failed or wrong `base_url` |
| `No prompt-N directories` in evaluate | Wrong `--run-dir` path |
| CAVE deploy fails | `CAVE_WRAPPER_DIR` wrong or docker socket not mounted |
| Teardown fails | CAVE container not running; check `docker compose ps` in `CAVE_WRAPPER_DIR` |
