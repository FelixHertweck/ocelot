"""OpenHands adapter mapping, config defaults, and the supervisor CLI end to end (stubbed)."""
import contextlib
import io
import json
import sys
import tempfile
import unittest
from pathlib import Path
from unittest import mock

sys.path.insert(0, str(Path(__file__).resolve().parent.parent / "src"))

import yaml

from lib import agent_backend, supervisor
from lib.agent_backend import AgentUnavailable
from lib.config import load
from lib.openhands_backend import OpenHandsBackend


def _oh_status(stopped, reason=None, prompt=60, completion=40):
    return {"status": "STOPPED" if stopped else "RUNNING", "end_reason": reason,
            "session_api_key": "SECRET", "conversation_url": "", "llm_model": "m",
            "metrics": {"accumulated_token_usage": {"prompt_tokens": prompt, "completion_tokens": completion}}}


class AdapterTests(unittest.TestCase):
    def setUp(self):
        self.b = OpenHandsBackend("http://x", initial_wait=0)

    def test_status_mapping_and_no_secret_leak(self):
        self.b.client.get_status = lambda sid: _oh_status(True, "finished")
        st = self.b.status("c")
        self.assertFalse(st.running)
        self.assertEqual((st.end_reason, st.total_tokens), ("finished", 100))
        self.assertNotIn("session_api_key", st.info)

    def test_transient_failure_becomes_agent_unavailable(self):
        import requests

        def boom(sid):
            raise requests.ConnectionError("down")
        self.b.client.get_status = boom
        with self.assertRaises(AgentUnavailable):
            self.b.status("c")

    def test_collect_writes_metrics_even_if_download_fails(self):
        def fail(*a):
            raise RuntimeError("no zip")
        self.b.client.download_conversation = fail
        with tempfile.TemporaryDirectory() as d:
            st = self.b.status.__self__  # noqa: F841
            self.b.client.get_status = lambda sid: _oh_status(True, "finished")
            self.b.collect("c", Path(d), self.b.status("c"))
            m = json.loads((Path(d) / "metrics.json").read_text())
            self.assertEqual(m["total_tokens"], 100)


class ConfigTests(unittest.TestCase):
    def _load(self, cfg):
        with tempfile.NamedTemporaryFile("w", suffix=".yml", delete=False) as f:
            yaml.safe_dump(cfg, f)
        with contextlib.redirect_stderr(io.StringIO()) as err:
            return load(f.name), err.getvalue()

    def test_defaults(self):
        cfg, _ = self._load({})
        self.assertEqual(cfg["limits"]["check_interval"], 15)
        self.assertEqual(cfg["limits"]["max_tokens"], 0)
        self.assertEqual(cfg["agent"]["backend"], "openhands")

    def test_unknown_backend(self):
        with self.assertRaises(ValueError):
            agent_backend.create({"agent": {"backend": "nope"}})


class CliTests(unittest.TestCase):
    def test_run_writes_artifacts_and_prints_end_record(self):
        from tests.test_supervisor import FakeBackend, ended  # same dir on path via discover
        backend = FakeBackend([ended("finished", 77)])
        with tempfile.TemporaryDirectory() as d:
            cfg = Path(d) / "c.yml"
            cfg.write_text(yaml.safe_dump({"limits": {"check_interval": 1}}))
            prompt = Path(d) / "p.txt"
            prompt.write_text("hi")
            out = Path(d) / "out"
            argv = ["supervisor.py", "--config", str(cfg), "run", "--prompt-file", str(prompt), "--out-dir", str(out)]
            buf = io.StringIO()
            with mock.patch.object(sys, "argv", argv), \
                 mock.patch.object(agent_backend, "create", return_value=backend), \
                 mock.patch.object(supervisor.time, "sleep"), \
                 contextlib.redirect_stdout(buf), contextlib.redirect_stderr(io.StringIO()):
                supervisor._cli()
            end = json.loads(buf.getvalue())
            self.assertEqual(end["final_status"], "finished")
            self.assertEqual(end["session_id"], "s1")
            self.assertEqual(json.loads((out / "end_state.json").read_text())["total_tokens"], 77)
            self.assertTrue((out / "conv_info.json").exists())


if __name__ == "__main__":
    unittest.main()
