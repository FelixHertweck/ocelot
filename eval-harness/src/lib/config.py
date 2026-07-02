#!/usr/bin/env python3
"""YAML config loader. Run as CLI to export shell variables: config.py export <file>"""
import os
import sys
import yaml


DEFAULTS: dict = {
    "scenario": {
        "cave_config_name": "",
        # Default from the CAVE_WRAPPER_DIR env var so the docker-compose mount
        # (source==target host path) and the harness agree without editing config.
        "cave_wrapper_dir": os.environ.get("CAVE_WRAPPER_DIR", "/cave-wrapper"),
        "configs_subpath": "backend/configs",
    },
    "deploy": {
        "wait_time": 600,
        "lab_prefix": "auto",
        "public_vpn_port": "auto",
        "port_pool": "51820-51920",
    },
    "openhands": {
        "base_url": "http://10.1.1.20:3000",
        "poll_interval": 15,
        "run_timeout": 3600,
    },
    "prompts": {
        "source": "",
        "mode": "cumulative",
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


def _flatten(cfg: dict) -> dict[str, str]:
    s = cfg["scenario"]
    d = cfg["deploy"]
    o = cfg["openhands"]
    p = cfg["prompts"]
    cs = cfg.get("context_script", {})
    cl = cfg.get("cleanup_script", {})
    e = cfg["evaluation"]
    lm = e.get("llm", {})
    return {
        "CAVE_CONFIG_NAME": str(s.get("cave_config_name", "")),
        "CAVE_WRAPPER_DIR": str(s.get("cave_wrapper_dir", "/cave-wrapper")),
        "SCENARIO_CONFIG_DIR": "/".join([
            str(s.get("cave_wrapper_dir", "/cave-wrapper")).rstrip("/"),
            str(s.get("configs_subpath", "backend/configs")).strip("/"),
            str(s.get("cave_config_name", "")),
        ]),
        "DEPLOY_WAIT_TIME": str(d.get("wait_time", 600)),
        "LAB_PREFIX_CONFIG": str(d.get("lab_prefix", "auto")),
        "VPN_PORT_CONFIG": str(d.get("public_vpn_port", "auto")),
        "PORT_POOL": str(d.get("port_pool", "51820-51920")),
        "OH_BASE_URL": str(o.get("base_url", "http://10.1.1.20:3000")),
        "OH_POLL_INTERVAL": str(o.get("poll_interval", 15)),
        "OH_RUN_TIMEOUT": str(o.get("run_timeout", 3600)),
        "PROMPTS_SOURCE": str(p.get("source", "")) if str(p.get("source", "")).startswith("/") else f"/app/config/prompts/{p.get('source', '')}",
        "PROMPTS_MODE": str(p.get("mode", "cumulative")),
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
