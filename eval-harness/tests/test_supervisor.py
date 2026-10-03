"""Supervisor policy against a fake AgentBackend — proves it depends only on the interface.

Run: python -m unittest discover tests
"""
import sys
import tempfile
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent.parent / "src"))

from lib.agent_backend import AgentBackend, AgentStatus, AgentUnavailable
from lib.goal_source import GoalSource, ScriptGoalSource
from lib.goals import GoalReport
from lib.supervisor import supervise


def running(tokens=0):
    return AgentStatus(True, None, tokens)


def ended(reason="finished", tokens=0):
    return AgentStatus(False, reason, tokens)


class FakeBackend(AgentBackend):
    """Plays back a script of statuses (the last repeats); records stops/messages."""
    name = "fake"

    def __init__(self, statuses, send_error=None):
        self._statuses = list(statuses)
        self.stopped = 0
        self.messages = []
        self.send_error = send_error

    def wait_until_ready(self, timeout): pass
    def start(self, prompt): return "s1"

    def status(self, session_id):
        s = self._statuses.pop(0) if len(self._statuses) > 1 else self._statuses[0]
        if isinstance(s, Exception):
            raise s
        return s

    def send_message(self, session_id, message):
        if self.send_error:
            raise self.send_error
        self.messages.append(message)

    def stop(self, session_id): self.stopped += 1
    def error_details(self, session_id): return []
    def collect(self, session_id, out_dir, status): pass


class FakeGoals(GoalSource):
    def __init__(self, *achieved):  # one bool|None per check; the last repeats
        self._seq = list(achieved)

    def check(self):
        a = self._seq.pop(0) if len(self._seq) > 1 else self._seq[0]
        return None if a is None else GoalReport(a)


def run(backend, **kw):
    kw.setdefault("timeout", 10_000)
    kw.setdefault("check_interval", 10)
    return supervise(backend, "s1", sleep=lambda s: None, **kw)


class TokenBudgetTests(unittest.TestCase):
    def test_stops_running_session_at_budget(self):
        b = FakeBackend([running(100), running(5000)])
        end = run(b, max_tokens=4000)
        self.assertEqual(end["final_status"], "token_limit")
        self.assertEqual(end["total_tokens"], 5000)
        self.assertEqual(b.stopped, 1)

    def test_budget_is_polled_every_interval(self):
        b = FakeBackend([running(1), running(2), running(3), running(9999)])
        end = run(b, max_tokens=1000, check_interval=15)
        self.assertEqual(end["elapsed_seconds"], 45)  # 3 intervals passed before the 4th check

    def test_clean_finish_wins_over_budget(self):
        end = run(FakeBackend([ended("finished", 9999)]), max_tokens=1)
        self.assertEqual(end["final_status"], "finished")

    def test_no_limit(self):
        b = FakeBackend([running(10**9)])
        self.assertEqual(run(b, timeout=30)["final_status"], "timeout")


class RecoveryTests(unittest.TestCase):
    def test_continue_on_error_then_finish(self):
        b = FakeBackend([ended("error"), ended("finished")])
        end = run(b, max_continues=2)
        self.assertEqual(end["final_status"], "finished")
        self.assertEqual(len(end["continue_attempts"]), 1)
        self.assertEqual(len(b.messages), 1)

    def test_gives_up_after_max_continues(self):
        end = run(FakeBackend([ended("error")]), max_continues=2)
        self.assertEqual(end["final_status"], "error")
        self.assertEqual(len(end["continue_attempts"]), 2)

    def test_unrecoverable_reason(self):
        end = run(FakeBackend([ended("sandbox_error")]), max_continues=2)
        self.assertEqual(end["final_status"], "error")
        self.assertEqual(end["continue_attempts"], [])

    def test_backend_unreachable(self):
        end = run(FakeBackend([AgentUnavailable("down")]))
        self.assertEqual(end["final_status"], "error")


class GoalFeedbackTests(unittest.TestCase):
    def test_achieved_no_nudge(self):
        b = FakeBackend([ended()])
        end = run(b, goal_source=FakeGoals(True))
        self.assertEqual(b.messages, [])
        self.assertEqual(end["feedback_rounds"][0]["stopped_by"], "goal_achieved")

    def test_nudge_message_is_neutral_and_configured(self):
        b = FakeBackend([ended(), ended()])
        run(b, goal_source=FakeGoals(False, True), feedback_message="keep going")
        self.assertEqual(b.messages, ["keep going"])

    def test_unlimited_rounds_until_goals_met(self):
        b = FakeBackend([ended()])
        end = run(b, goal_source=FakeGoals(*([False] * 10 + [True])), max_rounds=0)
        self.assertEqual(len(b.messages), 10)
        self.assertTrue(end["goals"]["achieved"])

    def test_max_rounds_caps_nudges(self):
        b = FakeBackend([ended()])
        end = run(b, goal_source=FakeGoals(False), max_rounds=2)
        self.assertEqual(len(b.messages), 2)
        self.assertEqual(end["feedback_rounds"][-1]["stopped_by"], "max_rounds")

    def test_token_budget_ends_unlimited_loop_via_running_check(self):
        # Unlimited rounds: nudge, agent runs and burns tokens, budget check stops it.
        b = FakeBackend([ended(tokens=100), running(100), running(5000)])
        end = run(b, goal_source=FakeGoals(False), max_rounds=0, max_tokens=4000)
        self.assertEqual(end["final_status"], "token_limit")
        self.assertEqual(len(b.messages), 1)
        self.assertEqual(b.stopped, 1)

    def test_no_nudge_when_budget_already_used(self):
        b = FakeBackend([ended(tokens=5000)])
        end = run(b, goal_source=FakeGoals(False), max_tokens=4000)
        self.assertEqual(b.messages, [])
        self.assertEqual(end["feedback_rounds"][0]["stopped_by"], "token_budget")

    def test_timeout_is_cumulative(self):
        b = FakeBackend([ended()])
        end = run(b, goal_source=FakeGoals(False), timeout=25, check_interval=10)
        self.assertEqual(end["feedback_rounds"][-1]["stopped_by"], "timeout")
        self.assertEqual(len(b.messages), 3)  # checks at 0, 10, 20 s nudge; 30 s is over the 25 s budget

    def test_indeterminate_goals_do_not_nudge(self):
        b = FakeBackend([ended()])
        end = run(b, goal_source=FakeGoals(None))
        self.assertEqual(b.messages, [])
        self.assertEqual(end["feedback_rounds"][0]["stopped_by"], "goal_indeterminate")

    def test_send_failure_ends_loop(self):
        b = FakeBackend([ended()], send_error=RuntimeError("down"))
        end = run(b, goal_source=FakeGoals(False))
        self.assertEqual(end["final_status"], "finished")
        self.assertEqual(end["feedback_rounds"][0]["stopped_by"], "send_failed")

    def test_error_during_feedback_is_not_a_goal_check(self):
        b = FakeBackend([ended("error")])
        end = run(b, goal_source=FakeGoals(False), max_continues=0)
        self.assertEqual(end["final_status"], "error")
        self.assertEqual(end["feedback_rounds"], [])


class ScriptGoalSourceTests(unittest.TestCase):
    def _check(self, body):
        with tempfile.TemporaryDirectory() as d:
            gf = Path(d) / "g.json"
            return ScriptGoalSource(body.replace("$F", str(gf)), d, gf).check()

    def test_reads_report(self):
        r = self._check("""echo '{"achieved": false, "detail": "not yet"}' > $F""")
        self.assertFalse(r.achieved)
        self.assertEqual(r.detail, "not yet")

    def test_achieved_true(self):
        r = self._check("""echo '{"achieved": true}' > $F""")
        self.assertTrue(r.achieved)

    def test_nothing_written_indeterminate(self):
        self.assertIsNone(self._check("true"))

    def test_malformed_indeterminate(self):
        self.assertIsNone(self._check("echo nope > $F"))


if __name__ == "__main__":
    unittest.main()
