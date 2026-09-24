"""Adaptive Oracle instrument: one run, hints delivered on demand by the Oracle service."""
from pathlib import Path

from ..base import Condition, Instrument
from ..prompt_file import parse_prompt_file


class Adaptive(Instrument):
    name = "adaptive"
    uses_oracle = True
    fragments_dir = Path(__file__).parent

    def validate(self, cfg: dict) -> tuple[list[str], list[str]]:
        errors = []
        if not cfg.get("oracle", {}).get("base_url"):
            errors.append("prompts.mode is 'adaptive' but oracle.base_url is not set in config.yml.")
        return errors, []

    def plan(self, source: str) -> list[Condition]:
        base_text, hints = parse_prompt_file(source)
        if hints:
            raise ValueError(
                f"{source!r} has '# Hint N' sections, but the adaptive instrument delivers hints "
                "via the Oracle — use a source file with a single '# Base Prompt'."
            )
        return [Condition("base", base_text)]

    def extraction_context(self, cond_dir: Path) -> str:
        path = cond_dir / "oracle_report.json"
        report = path.read_text(encoding="utf-8") if path.exists() else "(not available)"
        return f"""

## Oracle Hint-Service Report (ask_oracle usage this run)
```json
{report}
```"""
