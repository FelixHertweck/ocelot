"""AgentBackend adapter around the OpenHands V1 REST client."""
from __future__ import annotations

import json
import time
from pathlib import Path

import requests

from lib.agent_backend import AgentBackend, AgentStatus, AgentUnavailable
from lib.extract_metrics import extract_from_conv_info
from lib.log import log as _log
from lib.openhands_api import OpenHandsClient, accumulated_tokens


class OpenHandsBackend(AgentBackend):
    name = "openhands"

    def __init__(self, base_url: str, initial_wait: int = 15):
        self.client = OpenHandsClient(base_url)
        self.base_url = base_url
        # OpenHands can report a stale status right after a conversation starts; let it settle
        # before the supervisor's first check.
        self.initial_wait = initial_wait

    @classmethod
    def from_config(cls, cfg: dict) -> "OpenHandsBackend":
        oh = cfg["openhands"]
        return cls(oh["base_url"], int(oh.get("initial_wait", 15)))

    def wait_until_ready(self, timeout: int) -> None:
        deadline = time.monotonic() + timeout
        while True:
            try:
                if requests.get(f"{self.base_url.rstrip('/')}/", timeout=10).ok:
                    return
            except requests.RequestException:
                pass
            if time.monotonic() >= deadline:
                raise TimeoutError(f"OpenHands at {self.base_url} not reachable after {timeout}s")
            time.sleep(10)

    def start(self, prompt: str) -> str:
        conv = self.client.create_conversation(prompt)
        time.sleep(self.initial_wait)
        return conv["conversation_id"]

    def status(self, session_id: str) -> AgentStatus:
        try:
            st = self.client.get_status(session_id)
        except (requests.RequestException, ValueError) as e:
            raise AgentUnavailable(str(e)) from e
        return AgentStatus(
            running=st["status"] != "STOPPED",
            end_reason=st["end_reason"],
            total_tokens=accumulated_tokens(st),
            info={k: v for k, v in st.items() if k != "session_api_key"},
        )

    def send_message(self, session_id: str, message: str) -> None:
        self.client.continue_conversation(session_id, message)

    def stop(self, session_id: str) -> None:
        self.client.stop_conversation(session_id)

    def error_details(self, session_id: str) -> list[dict]:
        try:
            st = self.client.get_status(session_id)
        except Exception as e:  # noqa: BLE001 — best-effort
            return [{"kind": "fetch_failed", "message": str(e)}]
        if not st.get("conversation_url"):
            return []
        return self.client.fetch_error_events(st["conversation_url"], st.get("session_api_key", ""))

    def collect(self, session_id: str, out_dir: Path, status: AgentStatus) -> None:
        from lib.export_to_markdown import convert

        zip_path = out_dir / "conversation.zip"
        try:
            self.client.download_conversation(session_id, zip_path)
            if zip_path.stat().st_size > 0:
                (out_dir / "conversation.md").write_text(convert(zip_path))
        except Exception as e:  # noqa: BLE001 — a missing transcript must not fail the run
            _log(f"  WARNING: conversation download/convert failed: {e}")
        metrics = extract_from_conv_info(status.info) or {
            "model": None, "prompt_tokens": 0, "completion_tokens": 0, "total_tokens": 0, "cost": None}
        (out_dir / "metrics.json").write_text(json.dumps(metrics, indent=2))
