#!/usr/bin/env python3
"""OpenHands REST API client (V1). Usable as a library or CLI."""
import argparse
import json
import sys
import time
from pathlib import Path
from urllib.parse import urlparse, urlunparse

import requests

# Terminal execution states that mean the agent has stopped working
_TERMINAL_EXEC = {"finished", "error", "stuck", "waiting_for_confirmation"}
# Terminal sandbox states
_TERMINAL_SANDBOX = {"ERROR", "MISSING"}
# End reasons a "continue" message can plausibly recover from (the sandbox is still alive)
_RECOVERABLE = {"error", "stuck"}

CONTINUE_MESSAGE = "Please continue with the task."
MAX_CONSECUTIVE_API_FAILURES = 5


def _log(msg: str) -> None:
    print(f"[{time.strftime('%H:%M:%S')}] {msg}", file=sys.stderr, flush=True)


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

    def continue_conversation(self, conversation_id: str, message: str = CONTINUE_MESSAGE) -> None:
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

    def wait_for_end(
        self,
        conversation_id: str,
        timeout: int,
        poll_interval: int,
        initial_wait: int,
        max_continues: int,
    ) -> dict:
        """Poll until the conversation ends and report *how*, trying "continue" on recoverable errors.

        Returns {final_status: finished | error | timeout, end_reason, execution_status,
        sandbox_status, continue_attempts: [...], error_detail, elapsed_seconds, conv_info}.
        `error` means the run did not end cleanly and recovery failed or was not possible.
        """
        time.sleep(initial_wait)
        elapsed = initial_wait
        attempts: list[dict] = []
        api_failures = 0
        st: dict = {}

        def result(final: str, detail: str = "") -> dict:
            error_events: list[dict] = []
            if final != "finished" and st.get("conversation_url"):
                error_events = self.fetch_error_events(st["conversation_url"], st.get("session_api_key", ""))
            return {
                "final_status": final,
                "end_reason": st.get("end_reason") or final,
                "execution_status": st.get("execution_status", ""),
                "sandbox_status": st.get("runtime_status", ""),
                "continue_attempts": attempts,
                "error_detail": detail,
                "error_events": error_events,
                "elapsed_seconds": elapsed,
                "conv_info": {k: v for k, v in st.items() if k != "session_api_key"},
            }

        while True:
            try:
                st = self.get_status(conversation_id)
                api_failures = 0
            except (requests.RequestException, ValueError) as e:
                api_failures += 1
                _log(f"  status poll failed ({api_failures}/{MAX_CONSECUTIVE_API_FAILURES}): {e}")
                if api_failures >= MAX_CONSECUTIVE_API_FAILURES:
                    return result("error", f"OpenHands API unreachable: {e}")
                time.sleep(poll_interval)
                elapsed += poll_interval
                continue

            _log(f"  [{elapsed} s] {st['status']} ({st['execution_status']}, sandbox {st['runtime_status']})")

            if st["status"] == "STOPPED":
                reason = st["end_reason"]
                if reason == "finished":
                    return result("finished")
                if reason in _RECOVERABLE and len(attempts) < max_continues:
                    attempt = {"after_reason": reason, "at_seconds": elapsed}
                    attempts.append(attempt)
                    _log(f"  ended with '{reason}' — sending continue ({len(attempts)}/{max_continues})")
                    try:
                        self.continue_conversation(conversation_id)
                        attempt["sent"] = True
                    except Exception as e:  # any failure = recovery impossible, give up
                        attempt.update(sent=False, error=str(e))
                        return result("error", f"continue failed after '{reason}': {e}")
                    time.sleep(poll_interval)  # let the status flip back to running
                    elapsed += poll_interval
                    continue
                return result("error", f"conversation ended with '{reason}'" + (
                    f" after {len(attempts)} continue attempt(s)" if attempts else ""))

            if elapsed >= timeout:
                _log("  Timeout — stopping conversation...")
                self.stop_conversation(conversation_id)
                return result("timeout", f"no end within {timeout}s")

            time.sleep(poll_interval)
            elapsed += poll_interval

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

    p = sub.add_parser("wait")
    p.add_argument("--conv-id", required=True)
    p.add_argument("--timeout", type=int, required=True)
    p.add_argument("--poll-interval", type=int, default=15)
    p.add_argument("--initial-wait", type=int, default=15)
    p.add_argument("--max-continues", type=int, default=2)

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

    elif args.command == "wait":
        result = client.wait_for_end(
            args.conv_id, args.timeout, args.poll_interval, args.initial_wait, args.max_continues
        )
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
