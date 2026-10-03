#!/usr/bin/env python3
"""Run one agent session under the harness's own supervision. Backend-agnostic.

Every `check_interval` seconds the supervisor asks the backend for the session status and
its token count, and decides:

  running   → stop it when `max_tokens` is reached (final_status `token_limit`) or the
              cumulative `timeout` is used up (`timeout`)
  finished  → with goal feedback on: check the scenario's single device-observable goal;
              while unmet and the budgets allow, send one neutral message and keep going
  error/stuck → send a "continue" message, up to `max_continues` times, else give up (`error`)

Feedback is neutral and fixed — the agent is never told what the goal is, only that it should
keep going; the agent has no notion of "sub-goals" at all. `max_rounds` 0 = unlimited: the loop
then runs until the goal is met or the token/time budget ends the session.
"""
from __future__ import annotations

import argparse
import json
import sys
import time
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent.parent))

from lib import agent_backend
from lib.agent_backend import AgentBackend, AgentStatus, AgentUnavailable
from lib.config import DEFAULT_FEEDBACK_MESSAGE
from lib.goal_source import GoalSource, ScriptGoalSource
from lib.log import log as _log

CONTINUE_MESSAGE = "Please continue with the task."
RECOVERABLE = {"error", "stuck"}
MAX_CONSECUTIVE_API_FAILURES = 5


def supervise(
    backend: AgentBackend,
    session_id: str,
    *,
    timeout: int,
    check_interval: int,
    max_continues: int = 0,
    max_tokens: int = 0,
    goal_source: GoalSource | None = None,
    max_rounds: int = 0,
    feedback_message: str = DEFAULT_FEEDBACK_MESSAGE,
    sleep=time.sleep,
) -> dict:
    """Supervise `session_id` until it ends. Returns the end record:

    {final_status: finished | error | timeout | token_limit, end_reason, error_detail,
     total_tokens, elapsed_seconds, continue_attempts, feedback_rounds, goals, error_events,
     status_info}
    `error` = did not end cleanly and recovery failed or was not possible. `token_limit` and
    `timeout` are scored like normal ends, not errors. A clean finish seen in the same check
    wins over the budgets.
    """
    elapsed = 0
    nudges = 0
    attempts: list[dict] = []
    rounds: list[dict] = []
    last_report = None
    api_failures = 0
    st: AgentStatus | None = None

    def result(final: str, detail: str = "") -> dict:
        return {
            "session_id": session_id,
            "final_status": final,
            "end_reason": (st.end_reason if st and st.end_reason else final),
            "error_detail": detail,
            "total_tokens": st.total_tokens if st else 0,
            "elapsed_seconds": elapsed,
            "continue_attempts": attempts,
            "feedback_rounds": rounds,
            "goals": last_report.to_dict() if last_report else None,
            "error_events": backend.error_details(session_id) if final != "finished" else [],
            "status_info": st.info if st else {},
        }

    while True:
        try:
            st = backend.status(session_id)
            api_failures = 0
        except AgentUnavailable as e:
            api_failures += 1
            _log(f"  status check failed ({api_failures}/{MAX_CONSECUTIVE_API_FAILURES}): {e}")
            if api_failures >= MAX_CONSECUTIVE_API_FAILURES:
                return result("error", f"agent backend unreachable: {e}")
            sleep(check_interval)
            elapsed += check_interval
            continue

        budget = f", tokens {st.total_tokens}/{max_tokens}" if max_tokens else f", tokens {st.total_tokens}"
        _log(f"  [{elapsed} s] {'running' if st.running else 'ended: ' + str(st.end_reason)}{budget}")

        if st.running:
            if max_tokens and st.total_tokens >= max_tokens:
                _log(f"  Token budget reached ({st.total_tokens} >= {max_tokens}) — stopping session")
                backend.stop(session_id)
                return result("token_limit", f"token budget {max_tokens} reached ({st.total_tokens} tokens)")
            if elapsed >= timeout:
                _log("  Timeout — stopping session")
                backend.stop(session_id)
                return result("timeout", f"no end within {timeout}s")

        elif st.end_reason == "finished":
            if goal_source is None:
                return result("finished")
            report = goal_source.check()
            last_report = report or last_report
            rec = {
                "round": len(rounds) + 1,
                "at_seconds": elapsed,
                "total_tokens": st.total_tokens,
                "goal_achieved": report.achieved if report else None,
                "nudged": False,
            }
            # Budgets are checked *before* nudging: an agent that already used up its tokens
            # or time is not sent one more message only to be stopped at the next check.
            if report is None:
                stop = "goal_indeterminate"
            elif report.achieved:
                stop = "goal_achieved"
            elif max_tokens and st.total_tokens >= max_tokens:
                stop = "token_budget"
            elif elapsed >= timeout:
                stop = "timeout"
            elif max_rounds and nudges >= max_rounds:
                stop = "max_rounds"
            else:
                stop = None
            if stop:
                _log(f"  feedback loop ends: {stop}")
                rec["stopped_by"] = stop
                rounds.append(rec)
                return result("finished")
            limit = f"/{max_rounds}" if max_rounds else ""
            _log(f"  goal not yet achieved; sending feedback ({nudges + 1}{limit})")
            try:
                backend.send_message(session_id, feedback_message)
            except Exception as e:  # noqa: BLE001 — any failure ends the loop cleanly
                _log(f"  feedback message failed to send: {e}")
                rec["stopped_by"] = "send_failed"
                rounds.append(rec)
                return result("finished")
            nudges += 1
            rec["nudged"] = True
            rounds.append(rec)

        else:
            reason = st.end_reason
            if reason in RECOVERABLE and len(attempts) < max_continues:
                attempt = {"after_reason": reason, "at_seconds": elapsed}
                attempts.append(attempt)
                _log(f"  ended with '{reason}' — sending continue ({len(attempts)}/{max_continues})")
                try:
                    backend.send_message(session_id, CONTINUE_MESSAGE)
                    attempt["sent"] = True
                except Exception as e:  # noqa: BLE001 — any failure = recovery impossible
                    attempt.update(sent=False, error=str(e))
                    return result("error", f"continue failed after '{reason}': {e}")
            else:
                return result("error", f"session ended with '{reason}'" + (
                    f" after {len(attempts)} continue attempt(s)" if attempts else ""))

        sleep(check_interval)  # also lets the status flip back to running after a message
        elapsed += check_interval


def _cli() -> None:
    from lib.config import load as load_config

    parser = argparse.ArgumentParser(description="Backend-agnostic agent session runner")
    parser.add_argument("--config", required=True)
    sub = parser.add_subparsers(dest="command", required=True)

    sub.add_parser("ready", help="wait until the configured backend accepts sessions")

    p = sub.add_parser("run", help="start a session, supervise it, collect artifacts")
    p.add_argument("--prompt-file", required=True)
    p.add_argument("--out-dir", required=True, help="run artifacts go here (end_state.json, conv_info.json, ...)")
    p.add_argument("--goals-file", help="where the context script writes goals.json")
    p.add_argument("--goal-cmd", help="context script command (for goal feedback)")
    p.add_argument("--goal-cwd", help="working dir for the context script")
    args = parser.parse_args()

    cfg = load_config(args.config)
    backend = agent_backend.create(cfg)

    if args.command == "ready":
        backend.wait_until_ready(300)
        return

    limits, gf = cfg["limits"], cfg["goal_feedback"]
    out_dir = Path(args.out_dir)
    out_dir.mkdir(parents=True, exist_ok=True)
    session_id = backend.start(Path(args.prompt_file).read_text(encoding="utf-8"))
    _log(f"  Session: {session_id}")

    source = None
    if gf.get("enabled") and args.goal_cmd and args.goal_cwd and args.goals_file:
        source = ScriptGoalSource(args.goal_cmd, args.goal_cwd, Path(args.goals_file))
    elif gf.get("enabled"):
        _log("  WARNING: goal_feedback.enabled but no scenario context script — running without feedback")

    _log(f"  Supervising (timeout {limits['run_timeout']}s, check every {limits['check_interval']}s, "
         f"max tokens {limits['max_tokens'] or 'none'}, goal feedback "
         f"{'on, max rounds ' + (str(gf['max_rounds']) if gf['max_rounds'] else 'unlimited') if source else 'off'})")
    end = supervise(
        backend, session_id,
        timeout=int(limits["run_timeout"]),
        check_interval=int(limits["check_interval"]),
        max_continues=int(limits["max_continues"]),
        max_tokens=int(limits["max_tokens"] or 0),
        goal_source=source,
        max_rounds=int(gf.get("max_rounds") or 0),
        feedback_message=gf.get("message") or DEFAULT_FEEDBACK_MESSAGE,
    )

    info = end.pop("status_info")
    (out_dir / "conv_info.json").write_text(json.dumps(info))
    (out_dir / "end_state.json").write_text(json.dumps(end, indent=2))
    # status for collect(): rebuild minimal view from the final record
    backend.collect(session_id, out_dir, AgentStatus(
        running=False, end_reason=end["end_reason"], total_tokens=end["total_tokens"], info=info))
    print(json.dumps(end))


if __name__ == "__main__":
    _cli()
