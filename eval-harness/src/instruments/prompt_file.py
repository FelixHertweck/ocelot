"""Parse OCELOT prompt .md files into a base text and an ordered list of hint texts."""
import re
from pathlib import Path


def parse_prompt_file(source: str) -> tuple[str, list[str]]:
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
