#!/usr/bin/env python3
"""Parse OCELOT prompt .md files into an additive cumulative prompt sweep."""
import json
import re
import sys
from pathlib import Path


def _parse_file(source: str) -> tuple[str, list[str]]:
    """Split a prompt file into base text and a list of hint texts."""
    content = Path(source).read_text(encoding="utf-8")
    # Split on top-level headings
    parts = re.split(r"^(# .+)$", content, flags=re.MULTILINE)

    base_text: str | None = None
    hints: list[str] = []

    i = 1
    while i < len(parts):
        heading = parts[i].strip()
        body = parts[i + 1].strip() if i + 1 < len(parts) else ""
        i += 2

        # Skip overview / title sections
        if re.match(r"^# (Hint Overview|Table of Contents|Overview|\S.+ –)", heading, re.IGNORECASE):
            continue
        if re.match(r"^# Base Prompt", heading, re.IGNORECASE):
            base_text = body
        elif re.match(r"^# Hint \d+", heading, re.IGNORECASE):
            hints.append(body)

    if base_text is None:
        raise ValueError(f"No '# Base Prompt' section found in {source!r}")
    return base_text, hints


def load_prompts(source: str) -> list[dict]:
    """Return a list of {"name": str, "text": str} prompt configurations.

    Always sweeps additively: base, base+hint1, base+hint1+hint2, ... An
    adaptive-hinting source file has no "# Hint N" sections at all, so this
    naturally collapses to a single "base" configuration for those runs.
    """
    base_text, hints = _parse_file(source)

    configs = [{"name": "base", "text": base_text}]
    for i in range(len(hints)):
        name = "base+" + "+".join(f"hint{j + 1}" for j in range(i + 1))
        text = base_text + "\n\n" + "\n\n".join(hints[: i + 1])
        configs.append({"name": name, "text": text})
    return configs


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: prompt_parser.py <source_file>", file=sys.stderr)
        sys.exit(1)
    print(json.dumps(load_prompts(sys.argv[1]), ensure_ascii=False, indent=2))
