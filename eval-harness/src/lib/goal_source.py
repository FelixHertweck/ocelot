"""Where the supervisor gets goal verdicts from — independent of any agent backend."""
from __future__ import annotations

import os
import subprocess
from abc import ABC, abstractmethod
from pathlib import Path

from lib import goals as goals_mod
from lib.goals import GoalReport
from lib.log import log as _log


class GoalSource(ABC):
    @abstractmethod
    def check(self) -> GoalReport | None:
        """Current goal state, or None if it could not be determined this round."""


class ScriptGoalSource(GoalSource):
    """Runs the scenario context script, which writes the report to $OCELOT_GOALS_FILE.

    Best-effort: a non-zero exit, a missing file, or a malformed report all yield None
    (logged), so a broken check never crashes the run — the supervisor just stops sending
    feedback and the run is scored on what was collected.
    """

    def __init__(self, cmd: str, cwd: str, goals_file: Path, env: dict | None = None):
        self.cmd = cmd
        self.cwd = cwd
        self.goals_file = Path(goals_file)
        self.env = env

    def check(self) -> GoalReport | None:
        run_env = dict(os.environ if self.env is None else self.env)
        run_env["OCELOT_GOALS_FILE"] = str(self.goals_file)
        try:
            self.goals_file.unlink(missing_ok=True)  # never read a stale report from a prior round
        except OSError:
            pass
        try:
            proc = subprocess.run(
                self.cmd, shell=True, cwd=self.cwd, env=run_env,
                capture_output=True, text=True, timeout=600,
            )
        except (subprocess.SubprocessError, OSError) as e:
            _log(f"  goal check: context script failed to run: {e}")
            return None
        if proc.returncode != 0:
            _log(f"  goal check: context script exited {proc.returncode}")
        if not self.goals_file.exists():
            _log(f"  goal check: {self.goals_file.name} not written — cannot verify goals")
            return None
        try:
            return goals_mod.parse(self.goals_file.read_text(encoding="utf-8"))
        except ValueError as e:
            _log(f"  goal check: {e}")
            return None
