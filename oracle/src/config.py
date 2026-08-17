"""Env-driven settings for the Oracle wrapper.

One running instance serves exactly one variant, selected by `ORACLE_VARIANT` — both variants'
code ships in the same image, this only decides which gets constructed at startup. Plain env
vars, matching how other containers in this repo are configured (docker-compose `environment:`).
"""

import os
from dataclasses import dataclass, field
from pathlib import Path


@dataclass(frozen=True)
class Settings:
    variant: str = field(default_factory=lambda: os.environ.get("ORACLE_VARIANT", "A").upper())
    run_id: str = field(default_factory=lambda: os.environ.get("ORACLE_RUN_ID", "default"))
    scenario: str = field(
        default_factory=lambda: os.environ.get("ORACLE_SCENARIO", "scenario-3.1")
    )

    host: str = field(default_factory=lambda: os.environ.get("ORACLE_HOST", "0.0.0.0"))
    port: int = field(default_factory=lambda: int(os.environ.get("ORACLE_PORT", "8080")))

    log_dir: Path = field(
        default_factory=lambda: Path(os.environ.get("ORACLE_LOG_DIR", "/var/log/oracle"))
    )
    content_dir: Path = field(
        default_factory=lambda: Path(os.environ.get("ORACLE_CONTENT_DIR", "/app/content"))
    )

    # --- Variant A (CTFd) ---
    # Session login (username/password), not an API token — CTFd 3.7.7's hint-content endpoint
    # doesn't recognize token auth, see variant_a.py.
    ctfd_url: str = field(default_factory=lambda: os.environ.get("CTFD_URL", "http://127.0.0.1:8000"))
    ctfd_username: str = field(default_factory=lambda: os.environ.get("CTFD_USERNAME", ""))
    ctfd_password: str = field(default_factory=lambda: os.environ.get("CTFD_PASSWORD", ""))

    # --- Variant B (oracle LLM) ---
    # Point this at a different model/account than the attacker's.
    oracle_llm_model: str = field(default_factory=lambda: os.environ.get("ORACLE_LLM_MODEL", ""))
    oracle_llm_api_key: str = field(default_factory=lambda: os.environ.get("ORACLE_LLM_API_KEY", ""))
    oracle_llm_base_url: str = field(
        default_factory=lambda: os.environ.get("ORACLE_LLM_BASE_URL", "")
    )

    def solution_guide_file(self) -> Path:
        return self.content_dir / "solution-guides" / f"{self.scenario}.md"


settings = Settings()
