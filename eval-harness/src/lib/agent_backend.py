"""Agent-backend interface: everything the harness needs from the tool that runs the agent.

The harness (lib/supervisor.py) owns all *policy* — token budget, run timeout, recovery
from errors, goal feedback. A backend only supplies *mechanism*: start a session, report
its status and token usage, accept a follow-up message, stop it, and hand over artifacts.
To swap OpenHands for another agent runner, implement `AgentBackend` and register it in
`create()` below, then set `agent.backend` in the config.

Normalized end reasons (`AgentStatus.end_reason`, None while running):
  finished                  the agent ended cleanly
  error | stuck             failed, but the session is alive — a follow-up message may recover it
  anything else             unrecoverable (e.g. waiting_for_confirmation, sandbox_error, sandbox_missing)
"""
from __future__ import annotations

from abc import ABC, abstractmethod
from dataclasses import dataclass, field
from pathlib import Path


class AgentUnavailable(Exception):
    """A transient failure talking to the backend (unreachable API, bad response).

    `AgentBackend.status` raises this so the supervisor can retry a few times before giving up.
    """


@dataclass(frozen=True)
class AgentStatus:
    running: bool
    end_reason: str | None
    #: prompt + completion tokens accumulated over the whole session (all follow-up messages included)
    total_tokens: int
    #: backend-specific details, persisted as conv_info.json — must not contain secrets
    info: dict = field(default_factory=dict)


class AgentBackend(ABC):
    name: str

    @abstractmethod
    def wait_until_ready(self, timeout: int) -> None:
        """Block until the backend accepts sessions; raise TimeoutError otherwise."""

    @abstractmethod
    def start(self, prompt: str) -> str:
        """Start a session with `prompt` and return its id."""

    @abstractmethod
    def status(self, session_id: str) -> AgentStatus:
        """Current status; raises AgentUnavailable on a transient failure."""

    @abstractmethod
    def send_message(self, session_id: str, message: str) -> None:
        """Send a follow-up user message and make the agent run again. Raises on failure."""

    @abstractmethod
    def stop(self, session_id: str) -> None:
        """Best-effort: stop a running session. Never raises."""

    @abstractmethod
    def error_details(self, session_id: str) -> list[dict]:
        """Best-effort: recent backend-reported errors for a failed session. Never raises."""

    @abstractmethod
    def collect(self, session_id: str, out_dir: Path, status: AgentStatus) -> None:
        """Write the run artifacts into `out_dir`: `conversation.md` (transcript) and
        `metrics.json` ({model, prompt_tokens, completion_tokens, total_tokens, cost}).
        Best-effort per artifact; must not raise."""


def create(cfg: dict) -> AgentBackend:
    """Build the backend named by `agent.backend`."""
    name = cfg.get("agent", {}).get("backend", "openhands")
    if name == "openhands":
        from lib.openhands_backend import OpenHandsBackend

        return OpenHandsBackend.from_config(cfg)
    raise ValueError(f"Unknown agent.backend {name!r}; available: openhands")
