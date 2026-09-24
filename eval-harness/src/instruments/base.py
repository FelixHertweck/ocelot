"""Instrument interface: everything that differs between evaluation methods.

The harness core (deploy, OpenHands runs, reset, extract -> synthesize -> combine)
is instrument-agnostic. An instrument supplies only:

  * which conditions (prompt configurations) make up a run          -> plan()
  * config validation                                               -> validate()
  * extra LLM inputs per condition                                  -> extraction_context()
  * deterministic post-processing of the extracted blocks           -> annotate()
  * prompt fragments filling the slots of the shared core prompts   -> render()

Every instrument must emit the shared artifact: per-condition blocks whose
`gap_events` use the common six-class axis (see prompts/extraction.md).
"""
import re
from abc import ABC, abstractmethod
from dataclasses import dataclass
from pathlib import Path

_SLOT_HEADER = re.compile(r"^@@ (\w+)[ \t]*$", re.MULTILINE)
_PLACEHOLDER = re.compile(r"\{\{(\w+)\}\}")


@dataclass(frozen=True)
class Condition:
    """One measured configuration: a name and the exact prompt sent to the agent."""
    name: str
    text: str

    def to_dict(self) -> dict:
        return {"name": self.name, "text": self.text}


def parse_fragments(text: str) -> dict[str, str]:
    """Parse a fragment file: `@@ slot_name` lines start a slot, its body runs to the next one."""
    parts = _SLOT_HEADER.split(text)
    # parts = [preamble, name1, body1, name2, body2, ...]
    return {parts[i]: parts[i + 1].strip() for i in range(1, len(parts), 2)}


class Instrument(ABC):
    name: str
    #: whether the harness resets/records the Oracle hint service for this instrument
    uses_oracle: bool = False
    #: directory holding this instrument's fragment files (<core prompt filename>)
    fragments_dir: Path

    def validate(self, cfg: dict) -> tuple[list[str], list[str]]:
        """Return (errors, warnings) for the loaded config. Errors abort the run."""
        return [], []

    @abstractmethod
    def plan(self, source: str) -> list[Condition]:
        """Conditions to run, in order, from the prompt source file."""

    def extraction_context(self, cond_dir: Path) -> str:
        """Extra sections appended to the per-condition extraction user message."""
        return ""

    def annotate(self, blocks: list[dict]) -> None:
        """Deterministic in-place post-processing of a run's blocks before synthesis."""
        for b in blocks:
            b["instrument"] = self.name

    def render(self, core_text: str, kind: str) -> str:
        """Fill `{{slot}}` placeholders in a core prompt from this instrument's fragment file.

        `kind` is the core prompt's filename (e.g. "extraction.md"). Text without
        placeholders (e.g. a fully custom override) is returned unchanged; a placeholder
        with no matching slot is an error, so a new instrument fails fast when incomplete.
        """
        wanted = set(_PLACEHOLDER.findall(core_text))
        if not wanted:
            return core_text
        path = self.fragments_dir / kind
        slots = parse_fragments(path.read_text(encoding="utf-8")) if path.exists() else {}
        missing = sorted(wanted - slots.keys())
        if missing:
            raise KeyError(
                f"Instrument '{self.name}': fragment file {path} lacks slot(s) {missing} "
                f"required by the {kind} prompt"
            )
        out = _PLACEHOLDER.sub(lambda m: slots[m.group(1)], core_text)
        return re.sub(r"\n{3,}", "\n\n", out)
