"""Validation of the token / goal_feedback bounds. Run: python -m unittest discover tests"""
import sys
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent.parent / "src"))

from instruments import get


def _errors(max_tokens, enabled=True, max_rounds=0):
    cfg = {"prompts": {"mode": "cumulative"}, "limits": {"max_tokens": max_tokens},
           "goal_feedback": {"enabled": enabled, "max_rounds": max_rounds}}
    return get("cumulative").validate(cfg)[0]


class ValidateTests(unittest.TestCase):
    def test_unlimited_rounds_without_token_budget_rejected(self):
        self.assertTrue(_errors(max_tokens=0, max_rounds=0))

    def test_unlimited_rounds_with_token_budget_ok(self):
        self.assertEqual(_errors(max_tokens=100000, max_rounds=0), [])

    def test_round_cap_without_token_budget_ok(self):
        self.assertEqual(_errors(max_tokens=0, max_rounds=3), [])

    def test_negative_rounds_rejected(self):
        self.assertTrue(_errors(max_tokens=1000, max_rounds=-1))

    def test_disabled_needs_nothing(self):
        self.assertEqual(_errors(max_tokens=0, enabled=False, max_rounds=0), [])


if __name__ == "__main__":
    unittest.main()
