#!/usr/bin/env python3
"""Extract token usage and cost from a conv_info.json (V1) or events.json (V0)."""
import argparse
import json
from pathlib import Path


def extract_from_conv_info(conv_info: dict) -> dict | None:
    """Extract metrics from a V1 conversation info dict (from get_status)."""
    m = conv_info.get("metrics")
    if not m:
        return None
    tok = m.get("accumulated_token_usage", {})
    return {
        "model": conv_info.get("llm_model") or m.get("model_name") or tok.get("model"),
        "prompt_tokens": tok.get("prompt_tokens", 0),
        "completion_tokens": tok.get("completion_tokens", 0),
        "total_tokens": tok.get("prompt_tokens", 0) + tok.get("completion_tokens", 0),
        "cost": m.get("accumulated_cost"),
    }


def extract_from_events(events: list[dict]) -> dict:
    """Extract metrics from a V0 events list."""
    metrics = {"model": None, "prompt_tokens": 0, "completion_tokens": 0, "total_tokens": 0, "cost": None}

    for ev in reversed(events):
        if ev.get("kind") == "ConversationStateUpdateEvent" and ev.get("key") == "stats":
            usage = ev.get("value", {}).get("usage_to_metrics", {}).get("agent", {})
            tok = usage.get("accumulated_token_usage", {})
            if tok:
                metrics["model"] = tok.get("model")
                metrics["prompt_tokens"] = tok.get("prompt_tokens", 0)
                metrics["completion_tokens"] = tok.get("completion_tokens", 0)
                metrics["total_tokens"] = tok.get("prompt_tokens", 0) + tok.get("completion_tokens", 0)
                metrics["cost"] = usage.get("accumulated_cost")
                return metrics

    for ev in reversed(events):
        if ev.get("kind") == "LLMLogEvent":
            try:
                log_data = json.loads(ev.get("log_data", "{}"))
                usage = log_data.get("usage", {})
                if usage:
                    metrics["model"] = log_data.get("model")
                    metrics["prompt_tokens"] = usage.get("prompt_tokens", 0)
                    metrics["completion_tokens"] = usage.get("completion_tokens", 0)
                    metrics["total_tokens"] = usage.get("prompt_tokens", 0) + usage.get("completion_tokens", 0)
                    metrics["cost"] = log_data.get("cost")
                    return metrics
            except (json.JSONDecodeError, AttributeError):
                continue

    return metrics


def _cli() -> None:
    parser = argparse.ArgumentParser(description="Extract metrics from conv_info or events")
    parser.add_argument("--conv-info", help="Path to conv_info.json (V1 status response)")
    parser.add_argument("--events", help="Path to events.json (V0 fallback)")
    parser.add_argument("--output", required=True)
    args = parser.parse_args()

    metrics = None

    if args.conv_info:
        data = json.loads(Path(args.conv_info).read_text())
        metrics = extract_from_conv_info(data)

    if metrics is None and args.events:
        events = json.loads(Path(args.events).read_text())
        metrics = extract_from_events(events)

    if metrics is None:
        metrics = {"model": None, "prompt_tokens": 0, "completion_tokens": 0, "total_tokens": 0, "cost": None}

    Path(args.output).write_text(json.dumps(metrics, indent=2))
    print(json.dumps(metrics))


if __name__ == "__main__":
    _cli()
