"""Timestamped stderr logging shared across the harness runtime modules."""
from __future__ import annotations

import sys
import time


def log(msg: str) -> None:
    print(f"[{time.strftime('%H:%M:%S')}] {msg}", file=sys.stderr, flush=True)
