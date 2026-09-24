"""Cumulative knowledge-gradient instrument: an additive sweep Base, Base+Hint1, ..."""
from pathlib import Path

from ..base import Condition, Instrument
from ..prompt_file import parse_prompt_file


class Cumulative(Instrument):
    name = "cumulative"
    fragments_dir = Path(__file__).parent

    def plan(self, source: str) -> list[Condition]:
        base_text, hints = parse_prompt_file(source)
        conditions = [Condition("base", base_text)]
        for i in range(len(hints)):
            name = "base+" + "+".join(f"hint{j + 1}" for j in range(i + 1))
            text = base_text + "\n\n" + "\n\n".join(hints[: i + 1])
            conditions.append(Condition(name, text))
        return conditions

    def annotate(self, blocks: list[dict]) -> None:
        """Adds `_new_text_this_dose` — the text newly added relative to the previous block in
        the sweep, computed deterministically (string-suffix diff), not by the LLM. Each
        cumulative prompt configuration is base+hint1+...+hintN, so dose N's text is always
        dose N-1's text plus one appended hint — a straight prefix removal.

        Also adds `_new_text_status` (`"base" | "ok" | "diff_failed"`) so downstream consumers
        never have to guess *why* `_new_text_this_dose` is null — "no previous dose to diff
        against" (the first block) and "the diff failed" (an unexpected, non-additive prompt
        structure) would otherwise collapse to the same `None`.
        """
        super().annotate(blocks)
        if not blocks:
            return
        blocks[0]["_new_text_this_dose"] = None
        blocks[0]["_new_text_status"] = "base"
        for prev, cur in zip(blocks, blocks[1:]):
            prev_text = prev.get("_prompt_text", "")
            cur_text = cur.get("_prompt_text", "")
            if cur_text.startswith(prev_text):
                cur["_new_text_this_dose"] = cur_text[len(prev_text):].strip()
                cur["_new_text_status"] = "ok"
            else:
                # Not a clean prefix extension (unexpected prompt structure) — leave for the
                # synthesis LLM to infer from the full texts rather than guessing a wrong diff.
                cur["_new_text_this_dose"] = None
                cur["_new_text_status"] = "diff_failed"
