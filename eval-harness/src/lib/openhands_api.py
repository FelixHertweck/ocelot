#!/usr/bin/env python3
"""OpenHands REST API client (V1). Usable as a library or CLI."""
import argparse
import json
import time
from pathlib import Path

import requests

# Terminal execution states that mean the agent has stopped working
_TERMINAL_EXEC = {"finished", "error", "stuck", "waiting_for_confirmation"}
# Terminal sandbox states
_TERMINAL_SANDBOX = {"ERROR", "MISSING"}


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
            "execution_status": exec_status,
            "runtime_status": sandbox_status,
            "metrics": conv.get("metrics", {}),
            "llm_model": conv.get("llm_model", ""),
            "title": conv.get("title", ""),
        }

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

    elif args.command == "stop":
        client.stop_conversation(args.conv_id)
        print(json.dumps({"stopped": True}))

    elif args.command == "download":
        client.download_conversation(args.conv_id, Path(args.output))
        print(json.dumps({"output": args.output}))


if __name__ == "__main__":
    _cli()
