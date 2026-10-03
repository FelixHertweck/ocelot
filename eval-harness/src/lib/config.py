#!/usr/bin/env python3
"""YAML config loader. Run as CLI to export shell variables: config.py export <file>"""
import os
import sys
from pathlib import Path

import yaml

#: Neutral "keep going" nudge for the goal-feedback loop; the single source of truth
#: (DEFAULTS below and lib/supervisor.py both reference it).
DEFAULT_FEEDBACK_MESSAGE = "Not all objectives have been achieved yet. Please continue working on the task."


def _default_port_registry_dir() -> str:
    """Registry must live somewhere multiple run.sh invocations actually share.

    Inside the eval container that's the docker-compose bind mount at
    /app/port-registry; run.sh can also be invoked directly on a host with no
    Docker involved at all, where /app doesn't exist — fall back to a path
    next to this file, which concurrent direct invocations from the same
    checkout share just fine since it's a real path on the real host fs.
    """
    env = os.environ.get("PORT_REGISTRY_DIR")
    if env:
        return env
    if Path("/.dockerenv").exists():
        return "/app/port-registry"
    return str(Path(__file__).resolve().parent.parent / ".port-registry")


DEFAULTS: dict = {
    "scenario": {
        # .json5 basename passed to deploy-wrapper.sh
        "cave_config_name": "",
        "cave_wrapper_dir": os.environ.get("CAVE_WRAPPER_DIR", "/cave-wrapper"),
        # The scenario's own directory (relative to cave_wrapper_dir)
        "configs_subpath": "backend/configs",
    },
    "deploy": {
        "wait_time": 600,
        "lab_prefix": "auto",
        "public_vpn_port": "auto",
        "port_pool": "51820-51920",
        "port_registry_dir": _default_port_registry_dir(),
    },
    # Agent backend (see lib/agent_backend.py); its own settings live in its own block.
    "agent": {"backend": "openhands"},
    "openhands": {
        "base_url": "http://10.1.1.20:3000",
        "initial_wait": 15,
    },
    # Harness-side limits and supervision (backend-agnostic, see lib/supervisor.py).
    "limits": {
        "run_timeout": 7200,
        "check_interval": 15,
        "max_continues": 2,
        "max_tokens": 0,  # 0 = no limit; cumulative over goal-feedback rounds
    },
    # Harness-side loop: nudge the agent while the scenario's goal is unmet. Opt-in.
    "goal_feedback": {
        "enabled": False,
        "max_rounds": 0,  # 0 = unlimited (until max_tokens/run_timeout)
        "message": DEFAULT_FEEDBACK_MESSAGE,
    },
    "prompts": {
        "source": "",
        # Name of the evaluation instrument (see instruments/). Drives whether the
        # harness records Oracle usage (no separate oracle.enabled flag, so the
        # instrument used for scoring can never drift out of sync with it) and how
        # the prompt file is turned into conditions.
        "mode": "cumulative",
    },
    "runs": {
        "count": 1,
    },
    "oracle": {
        "base_url": "",
    },
    "context_script": {"cmd": "bash eval.sh"},
    "cleanup_script": {"cmd": "bash reset.sh"},
    "evaluation": {
        "template": "/app/prompts/template.md",
        "extraction_prompt": "/app/prompts/extraction.md",
        "output_dir": "/app/results",
        "output_name": "{scenario}_{model}_{date}.md",
        "llm": {
            "base_url_env": "EVAL_LLM_BASE_URL",
            "api_key_env": "EVAL_LLM_API_KEY",
            "model": "gpt-4o",
        },
    },
}


def _deep_merge(base: dict, override: dict) -> dict:
    result = base.copy()
    for k, v in override.items():
        if k in result and isinstance(result[k], dict) and isinstance(v, dict):
            result[k] = _deep_merge(result[k], v)
        else:
            result[k] = v
    return result


def load(config_file: str) -> dict:
    with open(config_file, encoding="utf-8") as f:
        user_cfg = yaml.safe_load(f) or {}
    return _deep_merge(DEFAULTS, user_cfg)


def validate_limits(cfg: dict) -> tuple[list[str], list[str]]:
    """Validate the backend-agnostic supervision bounds (limits + goal_feedback).

    Returns (errors, warnings); errors abort the run. Instruments call this from their own
    validate() and append instrument-specific checks on top.
    """
    errors: list[str] = []
    warnings: list[str] = []
    try:
        max_tokens = int((cfg.get("limits", {}) or {}).get("max_tokens", 0) or 0)
    except (TypeError, ValueError):
        errors.append("limits.max_tokens must be an integer.")
        max_tokens = 0
    fb = cfg.get("goal_feedback", {}) or {}
    if fb.get("enabled"):
        try:
            max_rounds = int(fb.get("max_rounds", 0) or 0)
        except (TypeError, ValueError):
            errors.append("goal_feedback.max_rounds must be an integer.")
            max_rounds = 0
        if max_rounds < 0:
            errors.append("goal_feedback.max_rounds must be >= 0 (0 = unlimited).")
        # max_rounds 0 = unlimited, so the token budget is then the only thing that ends a
        # never-satisfied goal set (run_timeout is a further backstop).
        if max_rounds == 0 and max_tokens < 1:
            errors.append(
                "goal_feedback.enabled with max_rounds 0 (unlimited) requires limits.max_tokens >= 1; "
                "otherwise set goal_feedback.max_rounds >= 1."
            )
    return errors, warnings


def _flatten(cfg: dict) -> dict[str, str]:
    s = cfg["scenario"]
    d = cfg["deploy"]
    p = cfg["prompts"]
    r = cfg.get("runs", {})
    orc = cfg.get("oracle", {})
    cs = cfg.get("context_script", {})
    cl = cfg.get("cleanup_script", {})
    e = cfg["evaluation"]
    lm = e.get("llm", {})
    return {
        "AGENT_BACKEND": str(cfg.get("agent", {}).get("backend", "openhands")),
        "CAVE_CONFIG_NAME": str(s.get("cave_config_name", "")),
        "CAVE_WRAPPER_DIR": str(s.get("cave_wrapper_dir", "/cave-wrapper")),
        "SCENARIO_CONFIG_DIR": "/".join([
            str(s.get("cave_wrapper_dir", "/cave-wrapper")).rstrip("/"),
            str(s.get("configs_subpath", "backend/configs")).strip("/"),
        ]),
        "DEPLOY_WAIT_TIME": str(d.get("wait_time", 600)),
        "LAB_PREFIX_CONFIG": str(d.get("lab_prefix", "auto")),
        "VPN_PORT_CONFIG": str(d.get("public_vpn_port", "auto")),
        "PORT_POOL": str(d.get("port_pool", "51820-51920")),
        "PORT_REGISTRY_DIR": str(d.get("port_registry_dir", _default_port_registry_dir())),
        "PROMPTS_SOURCE": str(p.get("source", "")) if str(p.get("source", "")).startswith("/") else f"/app/config/prompts/{p.get('source', '')}",
        "PROMPTS_MODE": str(p.get("mode", "cumulative")),
        "NUM_RUNS": str(r.get("count", 1)),
        "ORACLE_BASE_URL": str(orc.get("base_url", "")),
        "CONTEXT_CMD": str(cs.get("cmd", "bash eval.sh")),
        "CLEANUP_CMD": str(cl.get("cmd", "bash reset.sh")),
        "EVAL_TEMPLATE": str(e.get("template", "/app/prompts/template.md")),
        "EVAL_EXTRACTION_PROMPT": str(e.get("extraction_prompt", "/app/prompts/extraction.md")),
        "EVAL_OUTPUT_DIR": str(e.get("output_dir", "/app/results")),
        "EVAL_OUTPUT_NAME": str(e.get("output_name", "{scenario}_{model}_{date}.md")),
        "EVAL_LLM_MODEL": str(lm.get("model", "")),
        "EVAL_LLM_API_KEY": str(lm.get("api_key", "")),
        "EVAL_LLM_API_KEY_ENV": str(lm.get("api_key_env", "EVAL_LLM_API_KEY")),
        "EVAL_LLM_BASE_URL": str(lm.get("base_url", "")),
        "EVAL_LLM_BASE_URL_ENV": str(lm.get("base_url_env", "EVAL_LLM_BASE_URL")),
    }


if __name__ == "__main__":
    if len(sys.argv) < 3 or sys.argv[1] != "export":
        print("Usage: config.py export <config_file>", file=sys.stderr)
        sys.exit(1)
    flat = _flatten(load(sys.argv[2]))
    for key, value in flat.items():
        escaped = value.replace("'", "'\\''")
        print(f"export {key}='{escaped}'")
