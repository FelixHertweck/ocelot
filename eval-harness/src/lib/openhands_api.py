#!/usr/bin/env python3
"""OpenHands REST API client (V1). Usable as a library or CLI.

Pure mechanism: no budget/recovery policy lives here — that is lib/supervisor.py, reached
through lib/openhands_backend.py (the AgentBackend adapter around this client).
"""
import argparse
import json
import sys
import time
from pathlib import Path
from urllib.parse import urlparse, urlunparse

import requests

# Terminal states: the agent has stopped working (exec) or the sandbox is gone (sandbox).
_TERMINAL_EXEC = {"finished", "error", "stuck", "waiting_for_confirmation"}
_TERMINAL_SANDBOX = {"ERROR", "MISSING"}


def accumulated_tokens(status: dict) -> int:
    """Total tokens (prompt + completion) accumulated so far in a conversation.

    Reads the same `metrics.accumulated_token_usage` block that extract_metrics.py
    uses. These accumulate across a conversation's runs, so for the goal-feedback
    loop (multiple `continue` rounds in one conversation) this is already the
    cumulative total — no per-round bookkeeping needed. Returns 0 when metrics
    are absent (e.g. before the first LLM call).
    """
    tok = (status.get("metrics") or {}).get("accumulated_token_usage") or {}
    return int(tok.get("prompt_tokens", 0)) + int(tok.get("completion_tokens", 0))


def classify_end(exec_status: str, sandbox_status: str) -> str:
    """Why a STOPPED conversation stopped: finished | error | stuck | waiting_for_confirmation |
    sandbox_error | sandbox_missing."""
    if sandbox_status == "ERROR":
        return "sandbox_error"
    if sandbox_status == "MISSING":
        return "sandbox_missing"
    return exec_status or "unknown"


# Event kinds that carry a human-readable error, and the field each one uses for it.
# AgentErrorEvent.error = tool/scaffold failure (conversation can go on); ConversationErrorEvent
# .detail = conversation-level failure (not sent back to the LLM — usually *the* reason
# execution_status flips to "error"). https://docs.openhands.dev/sdk/guides/agent-server/api-reference/events/
_ERROR_EVENT_FIELDS = {"AgentErrorEvent": "error", "ConversationErrorEvent": "detail"}


def _resolve_conversation_url(conversation_url: str, api_base_url: str) -> str:
    """The API reports `conversation_url` relative to its own host (often literally
    `localhost:<port>` — the sandbox's agent-server port on the machine OpenHands itself runs
    on), not to whatever host a remote client used to reach `api_base_url`. Swap in the host we
    actually used for `api_base_url`, keeping the sandbox-specific port and path as reported.
    """
    conv = urlparse(conversation_url)
    api = urlparse(api_base_url)
    netloc = api.hostname or conv.hostname
    if conv.port:
        netloc = f"{netloc}:{conv.port}"
    return urlunparse(conv._replace(scheme=api.scheme or conv.scheme, netloc=netloc))


class OpenHandsClient:
    def __init__(self, base_url: str, timeout: int = 30):
        self.base_url = base_url.rstrip("/")
        self.timeout = timeout

    def create_conversation(self, prompt: str) -> dict:
        """Create a conversation and wait until the sandbox is ready."""
        resp = requests.post(
            f"{self.base_url}/api/v1/app-conversations",
            json={"initial_message": {"content": [{"type": "text", "text": prompt}]}},
            timeout=self.timeout,
        )
        resp.raise_for_status()
        task = resp.json()
        task_id = task["id"]
        app_conv_id = task.get("app_conversation_id")
        sandbox_id = task.get("sandbox_id", "")

        # Poll start-tasks until READY (up to 5 minutes)
        for _ in range(60):
            if app_conv_id:
                break
            time.sleep(5)
            t = requests.get(
                f"{self.base_url}/api/v1/app-conversations/start-tasks",
                params={"ids": task_id},
                timeout=self.timeout,
            )
            t.raise_for_status()
            data = t.json()
            entry = data[0] if isinstance(data, list) and data else {}
            if entry.get("status") == "ERROR":
                raise RuntimeError(f"Start task failed: {entry}")
            if entry.get("status") == "READY":
                app_conv_id = entry.get("app_conversation_id")
                sandbox_id = entry.get("sandbox_id", sandbox_id)

        if not app_conv_id:
            raise RuntimeError(f"Start task {task_id} never became READY after 5 minutes")

        return {"conversation_id": app_conv_id, "sandbox_id": sandbox_id, "task_id": task_id}

    def get_status(self, conversation_id: str) -> dict:
        """Return normalized status plus metrics from the V1 conversation info."""
        resp = requests.get(
            f"{self.base_url}/api/v1/app-conversations",
            params={"ids": conversation_id},
            timeout=self.timeout,
        )
        resp.raise_for_status()
        data = resp.json()
        if not data:
            raise ValueError(f"No conversation found for {conversation_id}")
        conv = data[0] if isinstance(data, list) else data

        exec_status = conv.get("execution_status", "")
        sandbox_status = conv.get("sandbox_status", "")

        if exec_status in _TERMINAL_EXEC or sandbox_status in _TERMINAL_SANDBOX:
            normalized = "STOPPED"
        else:
            normalized = "RUNNING"

        return {
            "status": normalized,
            "end_reason": classify_end(exec_status, sandbox_status) if normalized == "STOPPED" else None,
            "execution_status": exec_status,
            "runtime_status": sandbox_status,
            "sandbox_id": conv.get("sandbox_id", ""),
            "conversation_url": conv.get("conversation_url", ""),
            "session_api_key": conv.get("session_api_key", ""),
            "metrics": conv.get("metrics", {}),
            "llm_model": conv.get("llm_model", ""),
            "title": conv.get("title", ""),
        }

    def continue_conversation(self, conversation_id: str, message: str) -> None:
        """Send a follow-up user message to the agent server and start a run.

        Resumes a paused sandbox first. Talks to the agent server directly
        (`<conversation_url>/events`, authenticated with the conversation's session key).
        `conversation_url` as reported by the API is host-relative to OpenHands itself (often
        literally `localhost:<port>`), so it's resolved against `base_url` first — see
        `_resolve_conversation_url`. Raises on any failure so the caller can give up cleanly.
        """
        st = self.get_status(conversation_id)
        if st["runtime_status"] == "PAUSED" and st["sandbox_id"]:
            requests.post(
                f"{self.base_url}/api/v1/sandboxes/{st['sandbox_id']}/resume", timeout=self.timeout
            ).raise_for_status()
        if not st["conversation_url"]:
            raise RuntimeError("conversation info has no conversation_url — cannot send a message")
        events_url = _resolve_conversation_url(st["conversation_url"], self.base_url).rstrip("/") + "/events"
        headers = {"X-Session-API-Key": st["session_api_key"]} if st["session_api_key"] else {}
        requests.post(
            events_url,
            headers=headers,
            json={"role": "user", "content": [{"type": "text", "text": message}], "run": True},
            timeout=self.timeout,
        ).raise_for_status()

    def search_events(
        self,
        conversation_url: str,
        session_api_key: str = "",
        sort_order: str = "TIMESTAMP_DESC",
        limit: int = 20,
        kind: str | None = None,
    ) -> list[dict]:
        """Raw event search against the agent server: `GET {conversation_url}/events/search`.

        `conversation_url` is resolved against `base_url` first (see `_resolve_conversation_url`).
        Raises on failure — callers that want best-effort behavior should catch.
        """
        if not conversation_url:
            raise RuntimeError("no conversation_url to search events on")
        resolved = _resolve_conversation_url(conversation_url, self.base_url)
        headers = {"X-Session-API-Key": session_api_key} if session_api_key else {}
        params: dict = {"sort_order": sort_order, "limit": limit}
        if kind:
            params["kind"] = kind
        resp = requests.get(
            f"{resolved.rstrip('/')}/events/search", headers=headers, params=params, timeout=self.timeout
        )
        resp.raise_for_status()
        return resp.json().get("items", [])

    def fetch_error_events(
        self, conversation_url: str, session_api_key: str = "", limit: int = 20
    ) -> list[dict]:
        """Best-effort: the most recent AgentErrorEvent/ConversationErrorEvent entries, newest
        first, with their error text normalized under `message`. Never raises — on any failure
        (agent server unreachable, endpoint shape mismatch, ...) returns a single entry recording
        why, so the caller always gets *something* to look at instead of a silent gap.
        """
        try:
            items = self.search_events(conversation_url, session_api_key, limit=limit)
        except Exception as e:
            return [{"kind": "fetch_failed", "message": str(e)}]
        errors = []
        for ev in items:
            kind = ev.get("kind")
            field = _ERROR_EVENT_FIELDS.get(kind)
            if not field:
                continue
            errors.append({
                "kind": kind,
                "message": ev.get(field),
                "tool_name": ev.get("tool_name"),
                "timestamp": ev.get("timestamp"),
            })
        return errors

    def stop_conversation(self, conversation_id: str) -> None:
        """Best-effort stop via V1 sandbox pause."""
        try:
            resp = requests.get(
                f"{self.base_url}/api/v1/app-conversations",
                params={"ids": conversation_id},
                timeout=self.timeout,
            )
            resp.raise_for_status()
            data = resp.json()
            conv = data[0] if isinstance(data, list) and data else {}
            sandbox_id = conv.get("sandbox_id")
            if sandbox_id:
                requests.post(
                    f"{self.base_url}/api/v1/sandboxes/{sandbox_id}/pause",
                    timeout=self.timeout,
                ).raise_for_status()
        except Exception:
            pass  # stop is best-effort on timeout

    def download_conversation(self, conversation_id: str, output_path: Path) -> None:
        """Download the full conversation as a ZIP archive."""
        resp = requests.get(
            f"{self.base_url}/api/v1/app-conversations/{conversation_id}/download",
            timeout=120,
            stream=True,
        )
        resp.raise_for_status()
        output_path.parent.mkdir(parents=True, exist_ok=True)
        with open(output_path, "wb") as f:
            for chunk in resp.iter_content(chunk_size=8192):
                f.write(chunk)


def _cli() -> None:
    parser = argparse.ArgumentParser(description="OpenHands API client")
    parser.add_argument("--base-url", required=True)
    sub = parser.add_subparsers(dest="command", required=True)

    p = sub.add_parser("create")
    p.add_argument("--prompt-file", required=True)

    p = sub.add_parser("status")
    p.add_argument("--conv-id", required=True)

    p = sub.add_parser("events")
    p.add_argument("--conv-id", required=True)
    p.add_argument("--limit", type=int, default=20)
    p.add_argument("--errors-only", action="store_true", help="only AgentErrorEvent/ConversationErrorEvent, normalized")

    p = sub.add_parser("stop")
    p.add_argument("--conv-id", required=True)

    p = sub.add_parser("download")
    p.add_argument("--conv-id", required=True)
    p.add_argument("--output", required=True)

    args = parser.parse_args()
    client = OpenHandsClient(args.base_url)

    if args.command == "create":
        prompt = Path(args.prompt_file).read_text(encoding="utf-8")
        result = client.create_conversation(prompt)
        print(json.dumps(result))

    elif args.command == "status":
        result = client.get_status(args.conv_id)
        print(json.dumps(result))

    elif args.command == "events":
        st = client.get_status(args.conv_id)
        if args.errors_only:
            result = client.fetch_error_events(st["conversation_url"], st.get("session_api_key", ""), limit=args.limit)
        else:
            result = client.search_events(st["conversation_url"], st.get("session_api_key", ""), limit=args.limit)
        print(json.dumps(result, indent=2))

    elif args.command == "stop":
        client.stop_conversation(args.conv_id)
        print(json.dumps({"stopped": True}))

    elif args.command == "download":
        client.download_conversation(args.conv_id, Path(args.output))
        print(json.dumps({"output": args.output}))


if __name__ == "__main__":
    _cli()
