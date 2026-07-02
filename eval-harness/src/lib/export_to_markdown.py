#!/usr/bin/env python3
"""Convert OpenHands events to Markdown. Supports both ZIP exports and REST API event lists."""

import argparse
import json
import re
import sys
import zipfile
from pathlib import Path

HERE = Path(__file__).parent


def extract_text(content) -> str:
    if isinstance(content, str):
        return content
    if isinstance(content, list):
        parts = []
        for block in content:
            if isinstance(block, dict):
                if block.get("type") == "text":
                    parts.append(block.get("text", ""))
                elif "text" in block:
                    parts.append(block["text"])
        return "\n".join(p for p in parts if p)
    if isinstance(content, dict):
        return content.get("text", "")
    return ""


def fence(text: str, lang: str = "") -> str:
    ticks = "````" if "```" in text else "```"
    return f"{ticks}{lang}\n{text.rstrip()}\n{ticks}"


def render_event(ev: dict) -> str | None:
    """Return a Markdown string for one event, or None to skip."""
    kind = ev.get("kind", "")
    source = ev.get("source", "")

    if kind == "MessageEvent" and source == "user":
        msg = ev.get("llm_message", {})
        text = extract_text(msg.get("content", ""))
        if not text.strip():
            return None
        return f"## User\n\n{text.strip()}"

    if kind == "SystemPromptEvent" and source == "agent":
        text = extract_text(ev.get("system_prompt", ""))
        if not text.strip():
            return None
        return (
            f"## System Prompt\n\n"
            f"<details>\n<summary>System prompt (click to expand)</summary>\n\n"
            f"{fence(text)}\n\n</details>"
        )

    if kind == "ActionEvent" and source == "agent":
        action = ev.get("action") or {}
        ak = action.get("kind", "")
        ts = ev.get("timestamp", "")[:19].replace("T", " ")
        thought = action.get("thought", "")
        if isinstance(thought, list):
            thought = " ".join(thought)

        if ak == "TerminalAction":
            cmd = action.get("command", "").strip()
            parts = [f"### Agent – Terminal `{ts}`"]
            if thought:
                parts.append(f"*{thought.strip()}*\n")
            parts.append(fence(cmd, "bash"))
            return "\n\n".join(parts)

        if ak == "ThinkAction":
            text = thought or action.get("thought", "")
            if not text.strip():
                return None
            return f"### Agent – Think `{ts}`\n\n> {text.strip().replace(chr(10), chr(10) + '> ')}"

        if ak == "FinishAction":
            msg = action.get("message", "").strip()
            parts = [f"## Agent – Final Answer `{ts}`"]
            if thought:
                parts.append(f"*{thought.strip()}*\n")
            if msg:
                parts.append(msg)
            return "\n\n".join(parts)

        return f"### Agent – {ak} `{ts}`\n\n{fence(json.dumps(action, indent=2, ensure_ascii=False), 'json')}"

    if kind == "ObservationEvent" and source == "environment":
        obs = ev.get("observation", {})
        content = extract_text(obs.get("content", ""))
        if not content.strip():
            return None
        exit_code = obs.get("exit_code")
        is_error = obs.get("is_error", False)
        label = "Output"
        if is_error or (exit_code is not None and exit_code != 0):
            label = f"Output (exit {exit_code})"
        ts = ev.get("timestamp", "")[:19].replace("T", " ")
        return f"#### {label} `{ts}`\n\n{fence(content)}"

    if kind == "ConversationStateUpdateEvent" and ev.get("key") == "stats":
        val = ev.get("value", {})
        usage = val.get("usage_to_metrics", {}).get("agent", {})
        cost = usage.get("accumulated_cost")
        tok = usage.get("accumulated_token_usage", {})
        if cost is not None:
            prompt = tok.get("prompt_tokens", 0)
            completion = tok.get("completion_tokens", 0)
            model = tok.get("model", "?")
            return (
                f"---\n*Stats — model: `{model}` | "
                f"prompt tokens: {prompt:,} | completion tokens: {completion:,} | "
                f"cost: ${cost:.4f}*"
            )

    return None


# ── ZIP loader (original) ─────────────────────────────────────────────────────

def load_events(zip_path: Path) -> list[dict]:
    """Load and sort all non-empty JSON events from a ZIP."""
    events = []
    with zipfile.ZipFile(zip_path) as zf:
        for name in zf.namelist():
            if not name.endswith(".json"):
                continue
            data = zf.read(name)
            if not data.strip():
                continue
            try:
                ev = json.loads(data)
            except json.JSONDecodeError:
                continue
            m = re.match(r"(?:.*/)?event_(\d+)_", name)
            seq = int(m.group(1)) if m else 0
            ev["_seq"] = seq
            events.append(ev)
    events.sort(key=lambda e: e["_seq"])
    return events


def convert(zip_path: Path) -> str:
    """Convert a single OpenHands ZIP to a Markdown string."""
    events = load_events(zip_path)
    sections = [f"# Conversation: {zip_path.stem}\n"]
    prev_blank = True
    for ev in events:
        rendered = render_event(ev)
        if rendered is None:
            continue
        if not prev_blank:
            sections.append("")
        sections.append(rendered)
        prev_blank = False
    return "\n".join(sections) + "\n"


# ── REST API loader (new) ─────────────────────────────────────────────────────

def load_events_from_json(events_list: list[dict]) -> list[dict]:
    """Sort REST API event list by id (same kind-schema as ZIP events)."""
    return sorted(events_list, key=lambda e: e.get("id", 0))


def convert_events(events: list[dict], title: str = "Conversation") -> str:
    """Convert a list of event dicts to a Markdown string."""
    sections = [f"# {title}\n"]
    prev_blank = True
    for ev in events:
        rendered = render_event(ev)
        if rendered is None:
            continue
        if not prev_blank:
            sections.append("")
        sections.append(rendered)
        prev_blank = False
    return "\n".join(sections) + "\n"


# ── CLI (ZIP mode, backwards-compatible) ─────────────────────────────────────

def main():
    parser = argparse.ArgumentParser(description="Export OpenHands conversation ZIPs to Markdown.")
    parser.add_argument("inputs", nargs="*", type=Path, help="ZIP files or directories (default: input/)")
    parser.add_argument("-o", "--output-dir", type=Path, default=HERE / "output")
    args = parser.parse_args()

    inputs: list[Path] = []
    sources = args.inputs or [HERE / "input"]
    for src in sources:
        if src.is_dir():
            inputs.extend(sorted(src.glob("*.zip")))
        elif src.suffix == ".zip" and src.exists():
            inputs.append(src)
        else:
            print(f"Warning: {src} not found or not a ZIP — skipping", file=sys.stderr)

    if not inputs:
        print("No ZIP files found.", file=sys.stderr)
        sys.exit(1)

    args.output_dir.mkdir(parents=True, exist_ok=True)
    for zip_path in inputs:
        md = convert(zip_path)
        out_path = args.output_dir / (zip_path.stem + ".md")
        out_path.write_text(md, encoding="utf-8")
        print(f"Wrote {out_path}")


if __name__ == "__main__":
    main()
