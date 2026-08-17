# Oracle

An on-demand, three-tier hint service for the attacker LLM (VM0/OpenHands). Runs as its own
service on VM9, outside the scenario subnets, reachable only via MCP. Every consultation is
logged and penalized, feeding a score that measures how autonomously the agent completes a kill
chain versus how much it leaned on Oracle.

This README documents the service that lives in this directory; it does not itself define a
scenario's actual hint content or deployment config — see "Configuration" below for what's
authored here versus authored per-run.

## Both variants, one image

Oracle has two backends, and they expose genuinely **different tool surfaces** — not the same
signature with an ignored argument:

| | **Variant A — Deterministic** | **Variant B — LLM-based** |
|---|---|---|
| Mechanism | CTFd-backed fixed hint cells, auto-escalating tier by request count | An LLM reads a natural-language solution guide and improvises + self-labels each hint |
| LLM in the loop | No | Yes |
| Reproducibility | Exact | Lowest |
| Tools exposed | `list_hint_categories()`, `ask_oracle(category, context)` | `ask_oracle(context)` only |

**Both variants' code always ships in this one container image and in the one VM9 Packer
image (`images/oracle/`).** Which one an actual deployment runs is a single environment
variable, `ORACLE_VARIANT=A|B`, read once at process startup (`src/config.py`) — there is no
"Variant A image" vs. "Variant B image" to build or maintain separately.

## MCP interface

**Variant A** exposes two tools:

```
list_hint_categories() -> string[]

ask_oracle(category: str, context: str) -> {
  category: str,
  tier: "low" | "medium" | "high",
  hint: str,
  requests_used_this_category: int
}
```

`category` is **not a fixed taxonomy** — categories are whatever CTFd challenges are loaded for
the active scenario (one per host, one for the physical relay, whatever the scenario author set
up), and can change between runs. `list_hint_categories` is how the agent discovers the current
list before calling `ask_oracle`; `category` must be one of the values it returns.

**Variant B** exposes one tool, with no category parameter at all:

```
ask_oracle(context: str) -> {
  tier: "low" | "medium" | "high",
  hint: str
}
```

The oracle LLM infers everything from `context` and the solution guide — there's nothing for the
caller to enumerate or pick from.

Both: `context` is free text — what the agent already tried and why it believes it's stuck.

### Transport: Streamable HTTP

Oracle is exposed over **Streamable HTTP**, not stdio — unlike every stdio-based MCP entry
already in this repo's `config/phase-*/mcp-servers.json` (e.g. the `neo4j` server, launched
locally via `uvx`), Oracle runs on a separate VM and must be reached over the network.
Streamable HTTP is OpenHands' current, non-deprecated transport for networked MCP servers (SSE
is the older, deprecated one).

Register it in a scenario's `mcp-servers.json` using the same `mcpServers` JSON convention
already used for the stdio entries, just with a `url` instead of `command`/`args`:

```json
{
  "mcpServers": {
    "oracle": {
      "url": "http://10.1.0.11:8080/mcp"
    }
  }
}
```

`10.1.0.11` is VM9's address on the management network; VM0 reaches it, the scenario subnets
never do.

**Not yet smoke-tested against the pinned OpenHands version** — do this once, early, before
relying on it for a real run.

## Configuration

Everything below is an environment variable read at process startup (`src/config.py`) — the
same convention as `ot-proxy.env` / `openhands.env` elsewhere in this repo. **The actual per-run
values for a real scenario deployment are authored separately** — this README documents the
schema, not the values.

| Variable | Applies to | Meaning |
|---|---|---|
| `ORACLE_VARIANT` | both | `A` or `B` — which backend this instance runs |
| `ORACLE_RUN_ID` | both | Identifies this experiment run; names the structured log file (`<run_id>.jsonl`) and scopes tier/idempotency tracking |
| `ORACLE_SCENARIO` | both | Which scenario's content to load (`scenario-3.1` / `-3.2` / `-3.3`) |
| `ORACLE_HOST` / `ORACLE_PORT` | both | Bind address for the MCP server (default `0.0.0.0:8080`) |
| `ORACLE_LOG_DIR` | both | Where the structured JSONL log is written (default `/var/log/oracle`) |
| `ORACLE_CONTENT_DIR` | B | Where `solution-guides/<scenario>.md` is mounted (default `/app/content`) — Variant A reads its content from CTFd directly, not from this directory |
| `CTFD_URL` | A | Base URL of the co-located CTFd instance (default `http://127.0.0.1:8000`) |
| `CTFD_USERNAME` / `CTFD_PASSWORD` | A | Login for the CTFd account the wrapper acts as. **A session login, not an API token** — see "CTFd auth" below |
| `ORACLE_LLM_MODEL` / `ORACLE_LLM_API_KEY` / `ORACLE_LLM_BASE_URL` | B | The oracle LLM's own credentials — deliberately a *different* model/account than the attacker LLM's |

See [`.env.example`](.env.example) for a filled-in local-dev shape of this table.

### CTFd auth (Variant A) — two things provisioning must do

Found by testing against a real CTFd 3.7.7 instance, not documented by CTFd itself. Both are
automated by [`provision.py`](../images/oracle/assets/provision.py) — see
[`images/oracle/README.md#deploying-a-run`](../images/oracle/README.md#deploying-a-run):

1. **The wrapper logs in as a normal user (`CTFD_USERNAME`/`CTFD_PASSWORD`), not an API
   token.** `GET /api/v1/hints/<id>` — the call that actually returns hint content —
   only recognizes a logged-in session; it 403s ("You must login to unlock this hint") for
   token-authenticated requests even though the token works fine for every other endpoint
   `variant_a.py` uses (listing challenges, unlocking). Use `user_mode: users` when running
   CTFd's setup wizard, not `teams` — a plain user avoids needing a team on top.
2. **That user needs a large point balance before any hint is affordable.** CTFd's hint-unlock
   model deducts real score, and a freshly created user has none — every unlock fails with
   "You do not have enough points" otherwise. Grant one via
   `POST /api/v1/awards {"user_id": <id>, "name": "...", "value": 1000000}` (admin session) as
   part of provisioning, before importing content or starting the wrapper.

## Content

Not baked into the image — mounted/injected at deploy time. Authored here as the source of
truth:

- `content/hints/<scenario>.json` — Variant A source content, imported into CTFd by
  [`../images/oracle/assets/provision.py`](../images/oracle/assets/provision.py) (not read by
  the wrapper at runtime — the wrapper always talks to CTFd live, see "MCP interface" above).
  Schema: `{"challenges": [{"name": <category>, "hints": [{"content": ..., "cost": ...}, ...]}]}`,
  one "challenge" per category — a category can be anything scenario-appropriate (a specific
  host, the physical relay, ...), not a fixed enum — hints ordered Low→Medium→High.
- `content/solution-guides/<scenario>.md` — Variant B. A single natural-language walkthrough
  of the full intended attack path for that scenario.

**Author both from one shared internal source-of-truth note per scenario**, not independently —
they encode the same ground truth in two representations, and a robustness comparison between
variants is only meaningful if the two don't silently diverge on facts.

## Local development

```bash
cp .env.example .env
docker compose up --build
```

This runs only the wrapper (Variant A needs a CTFd instance reachable at `CTFD_URL` — point it
at any CTFd 3.7.7 instance you have locally, or switch to `ORACLE_VARIANT=B` and set
`ORACLE_LLM_*` instead). It is **not** how VM9 is actually deployed — see
[`../images/oracle/README.md`](../images/oracle/README.md) for that.

## Structured log

Every `ask_oracle` call, from either variant, appends one line to
`$ORACLE_LOG_DIR/<run_id>.jsonl` (`src/logging_store.py`, schema in `src/models.py:
OracleLogEntry`) — `run_id, category, category_source, tier, tier_source, context, hint,
ctfd_hint_id, cost_applied, fresh_unlock, timestamp`. `category`/`category_source` are set for
Variant A and `null` for Variant B, which has no category concept. This log, plus a run's scenario success
score, is the input to hint-penalty scoring, which lives outside this service since it's a
cross-referencing consumer of the log rather than something Oracle needs to compute about
itself.

## Status

MCP plumbing, both variants' request/response logic, and the structured log are implemented.
**Not yet done:** scenario content, external scoring, and pilot calibration of the penalty
schedule and tier rules. The CTFd REST API calls in `src/variant_a.py` follow CTFd's documented
conventions but haven't been executed against a running instance yet — verify before a real
pilot run.
