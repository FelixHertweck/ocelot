#!/usr/bin/env python3
"""Shared goal-report schema for the goal-feedback loop.

A scenario's context script (eval.sh → eval.py) writes a `goals.json` describing whether
its *device-observable* end goal is currently met. This gates the feedback loop (see
lib/supervisor.py): the agent never sees this file or any goal breakdown — the feedback
message is a fixed, neutral string. The per-goal breakdown (recon goals, etc.) is for the
human-facing report only and is produced by the LLM evaluator from context.txt, not here.

Schema:

    {"achieved": false, "detail": "stVal=2 (on/closed)"}

`detail` is for the human-facing report only; it is never shown to the agent.
"""
from __future__ import annotations

import json
from dataclasses import dataclass


@dataclass(frozen=True)
class GoalReport:
    achieved: bool
    detail: str = ""

    def to_dict(self) -> dict:
        return {"achieved": self.achieved, "detail": self.detail}


def parse(data: str | bytes | dict) -> GoalReport:
    """Parse and validate a goals report. Raises ValueError on any schema violation."""
    if isinstance(data, (str, bytes)):
        try:
            data = json.loads(data)
        except json.JSONDecodeError as e:
            raise ValueError(f"goals report is not valid JSON: {e}") from None
    if not isinstance(data, dict):
        raise ValueError(f"goals report must be a JSON object, got {type(data).__name__}")

    achieved = data.get("achieved")
    if not isinstance(achieved, bool):
        raise ValueError("goals report: 'achieved' must be a boolean")
    detail = data.get("detail", "")
    if not isinstance(detail, str):
        raise ValueError("goals report: 'detail' must be a string")

    return GoalReport(achieved=achieved, detail=detail)


def write(report: GoalReport, path) -> None:
    """Write a goals report to `path`. Helper for scenario scripts that can import this."""
    from pathlib import Path

    Path(path).write_text(json.dumps(report.to_dict(), indent=2), encoding="utf-8")
