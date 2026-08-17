"""Append-only structured log — the audit trail every `ask_oracle` call feeds. Both variants
write through this same store; it's also what Variant A's tier/idempotency logic reads instead
of round-tripping CTFd's own unlock state.

One JSONL file per run_id under ORACLE_LOG_DIR, so concurrent runs never interleave.
"""

import threading
from pathlib import Path

from .models import OracleLogEntry


class OracleLogStore:
    def __init__(self, log_dir: Path):
        self._log_dir = log_dir
        self._lock = threading.Lock()

    def _path(self, run_id: str) -> Path:
        self._log_dir.mkdir(parents=True, exist_ok=True)
        return self._log_dir / f"{run_id}.jsonl"

    def append(self, entry: OracleLogEntry) -> None:
        with self._lock:
            with self._path(entry.run_id).open("a", encoding="utf-8") as f:
                f.write(entry.model_dump_json() + "\n")

    def entries_for_category(self, run_id: str, category: str) -> list[OracleLogEntry]:
        path = self._path(run_id)
        if not path.exists():
            return []
        entries = []
        with path.open(encoding="utf-8") as f:
            for line in f:
                line = line.strip()
                if not line:
                    continue
                entry = OracleLogEntry.model_validate_json(line)
                if entry.category == category:
                    entries.append(entry)
        return entries

    def count_calls(self, run_id: str, category: str) -> int:
        return len(self.entries_for_category(run_id, category))
