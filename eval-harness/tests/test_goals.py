"""Tests for lib.goals schema parsing/validation. Run: python -m unittest discover tests"""
import sys
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent.parent / "src"))

from lib import goals


class ParseTests(unittest.TestCase):
    def test_achieved(self):
        r = goals.parse('{"achieved": true, "detail": "d"}')
        self.assertTrue(r.achieved)
        self.assertEqual(r.detail, "d")

    def test_not_achieved_detail_optional(self):
        r = goals.parse({"achieved": False})
        self.assertFalse(r.achieved)
        self.assertEqual(r.detail, "")

    def test_accepts_dict(self):
        r = goals.parse({"achieved": True, "detail": "x"})
        self.assertTrue(r.achieved)

    def test_bad_json(self):
        with self.assertRaises(ValueError):
            goals.parse("{not json")

    def test_not_an_object(self):
        with self.assertRaises(ValueError):
            goals.parse("[1, 2]")

    def test_missing_achieved(self):
        with self.assertRaises(ValueError):
            goals.parse({"detail": "x"})

    def test_non_bool_achieved(self):
        with self.assertRaises(ValueError):
            goals.parse({"achieved": "yes"})

    def test_non_str_detail(self):
        with self.assertRaises(ValueError):
            goals.parse({"achieved": True, "detail": 5})

    def test_roundtrip_write(self):
        import json
        import tempfile

        with tempfile.TemporaryDirectory() as d:
            p = Path(d) / "g.json"
            goals.write(goals.GoalReport(True, "x"), p)
            again = goals.parse(p.read_text())
            self.assertTrue(again.achieved)
            self.assertEqual(json.loads(p.read_text()), {"achieved": True, "detail": "x"})


if __name__ == "__main__":
    unittest.main()
