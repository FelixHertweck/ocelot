#!/usr/bin/env python3
"""Per-run CTFd provisioning for Oracle Variant A: complete the setup wizard, grant the acting
user a point balance, and import a scenario's hint content — the three manual steps
images/oracle/README.md's "Deploying a run" section used to describe. Idempotent: safe to
re-run against the same CTFd instance (skips the wizard if already done, tops up points instead
of re-granting them, skips challenges that already exist by name).

Stdlib only, no `requests`/`pydantic` — this runs on the bare VM9 host, not inside the wrapper's
Docker image, so it can't rely on that image's dependencies being installed.

Mirrors oracle/src/variant_a.py's CTFd calls (session login, CSRF nonce scraping from CTFd's
`csrfNonce` JS var) — see that module's docstring for why a session login is required over an
API token, and oracle/README.md#ctfd-auth-variant-a for the two provisioning requirements this
automates.
"""

import http.client
import http.cookiejar
import json
import os
import re
import sys
import time
import urllib.error
import urllib.parse
import urllib.request

POINTS_BALANCE = 1_000_000
NONCE_RE = re.compile(r"csrfNonce['\"]?\s*:\s*[\"']([0-9a-fA-F]+)[\"']")


class NoRedirect(urllib.request.HTTPErrorProcessor):
    """Surface 3xx responses instead of following them, so setup/login success (302) and an
    unauthenticated API call bouncing to /login (also 302) are both visible to callers."""

    def http_response(self, request, response):
        return response

    https_response = http_response


class CTFdAdmin:
    def __init__(self, base_url: str):
        self.base_url = base_url.rstrip("/")
        self.opener = urllib.request.build_opener(
            NoRedirect, urllib.request.HTTPCookieProcessor(http.cookiejar.CookieJar())
        )
        self.csrf_token = None

    def _request(self, method: str, path: str, data: dict | None = None, json_body: bool = False):
        headers = {}
        body = None
        if data is not None:
            if json_body:
                body = json.dumps(data).encode()
                headers["Content-Type"] = "application/json"
            else:
                body = urllib.parse.urlencode(data).encode()
        if self.csrf_token is not None:
            headers["CSRF-Token"] = self.csrf_token
        req = urllib.request.Request(f"{self.base_url}{path}", data=body, headers=headers, method=method)
        return self.opener.open(req)

    def get(self, path: str) -> tuple[int, str]:
        resp = self._request("GET", path)
        return resp.status, resp.read().decode()

    @staticmethod
    def _extract_nonce(html: str) -> str:
        match = NONCE_RE.search(html)
        if not match:
            raise RuntimeError("Could not find a CSRF nonce on the page")
        return match.group(1)

    def setup_already_done(self) -> bool:
        # CTFd redirects /setup away (302) once the wizard has already run; only a fresh
        # instance serves the wizard form itself (200).
        status, _ = self.get("/setup")
        return status != 200

    def complete_setup(self, ctf_name: str, username: str, email: str, password: str) -> None:
        status, html = self.get("/setup")
        if status != 200:
            raise RuntimeError(f"Expected the setup wizard at /setup, got HTTP {status}")
        resp = self._request(
            "POST",
            "/setup",
            {
                "ctf_name": ctf_name,
                "user_mode": "users",
                "name": username,
                "email": email,
                "password": password,
                "challenge_visibility": "private",
                "account_visibility": "public",
                "score_visibility": "public",
                "registration_visibility": "public",
                "verify_emails": "false",
                "ctf_theme": "core-beta",
                "nonce": self._extract_nonce(html),
            },
        )
        if resp.status != 302:
            raise RuntimeError(f"CTFd setup wizard submission failed (HTTP {resp.status})")

    def login(self, username: str, password: str) -> None:
        status, html = self.get("/login")
        resp = self._request(
            "POST", "/login", {"name": username, "password": password, "nonce": self._extract_nonce(html)}
        )
        if resp.status != 302:
            raise RuntimeError(f"CTFd login failed for user '{username}' (HTTP {resp.status})")

    def _ensure_csrf_token(self) -> None:
        if self.csrf_token is None:
            _, html = self.get("/challenges")
            self.csrf_token = self._extract_nonce(html)

    def api(self, method: str, path: str, data: dict | None = None):
        self._ensure_csrf_token()
        resp = self._request(method, f"/api/v1/{path}", data=data, json_body=True)
        if not 200 <= resp.status < 300:
            raise RuntimeError(f"CTFd API {method} {path} failed (HTTP {resp.status})")
        payload = json.loads(resp.read().decode())
        if not payload.get("success", True):
            raise RuntimeError(f"CTFd API {method} {path} failed: {payload}")
        return payload.get("data")

    def me(self) -> dict:
        return self.api("GET", "users/me")

    def ensure_points(self, user_id: int, target: int) -> None:
        current = self.me()["score"]
        if current >= target:
            return
        self.api("POST", "awards", {"user_id": user_id, "name": "oracle-provisioning", "value": target - current})

    def find_challenge_id(self, name: str) -> int | None:
        for challenge in self.api("GET", "challenges") or []:
            if challenge["name"] == name:
                return challenge["id"]
        return None

    def import_hints(self, hints_json_path: str) -> None:
        with open(hints_json_path, encoding="utf-8") as f:
            content = json.load(f)
        for challenge in content["challenges"]:
            name = challenge["name"]
            if self.find_challenge_id(name) is not None:
                print(f"  skip '{name}': challenge already exists")
                continue
            created = self.api(
                "POST",
                "challenges",
                {
                    "name": name,
                    "category": name,
                    "description": f"Oracle hints for {name}",
                    "value": 1,
                    "state": "visible",
                    "type": "standard",
                },
            )
            # Hints are unlocked strictly by creation order (Low->Medium->High), so this loop's
            # order is load-bearing, not cosmetic.
            for hint in challenge["hints"]:
                self.api(
                    "POST", "hints", {"challenge_id": created["id"], "content": hint["content"], "cost": hint["cost"]}
                )
            print(f"  imported '{name}' ({len(challenge['hints'])} hints)")


def load_env_file(path: str) -> None:
    if not os.path.isfile(path):
        return
    with open(path, encoding="utf-8") as f:
        for line in f:
            line = line.strip()
            if not line or line.startswith("#") or "=" not in line:
                continue
            key, _, value = line.partition("=")
            os.environ.setdefault(key.strip(), value.strip())


def wait_for_ctfd(base_url: str, timeout: int = 120) -> None:
    deadline = time.time() + timeout
    while time.time() < deadline:
        try:
            urllib.request.urlopen(f"{base_url}/setup", timeout=5)
            return
        except (urllib.error.URLError, http.client.HTTPException):
            time.sleep(2)
    raise RuntimeError(f"CTFd at {base_url} did not become reachable within {timeout}s")


def main() -> int:
    if len(sys.argv) != 2:
        print(f"Usage: {sys.argv[0]} <path-to-hints.json>", file=sys.stderr)
        return 2

    load_env_file(os.path.expanduser("~/.env"))

    if os.environ.get("ORACLE_VARIANT", "A") != "A":
        print("ORACLE_VARIANT is not 'A' - this run doesn't use CTFd, nothing to provision.")
        return 0

    try:
        username = os.environ["CTFD_USERNAME"]
        password = os.environ["CTFD_PASSWORD"]
    except KeyError as e:
        print(f"{e.args[0]} must be set (see ~/.env)", file=sys.stderr)
        return 2

    base_url = os.environ.get("CTFD_URL", "http://127.0.0.1:8000")
    scenario = os.environ.get("ORACLE_SCENARIO", "oracle")
    hints_path = sys.argv[1]
    if not os.path.isfile(hints_path):
        print(f"No such file: {hints_path}", file=sys.stderr)
        return 2

    print(f"Waiting for CTFd at {base_url} ...")
    wait_for_ctfd(base_url)

    client = CTFdAdmin(base_url)
    if client.setup_already_done():
        print("CTFd setup wizard already completed, logging in ...")
        client.login(username, password)
    else:
        print(f"Completing CTFd setup wizard as user '{username}' (user_mode=users) ...")
        client.complete_setup(f"Oracle ({scenario})", username, f"{username}@oracle.local", password)

    me = client.me()
    print(f"Logged in as '{me['name']}' (id={me['id']}, score={me['score']})")

    print(f"Ensuring a {POINTS_BALANCE}-point balance ...")
    client.ensure_points(me["id"], POINTS_BALANCE)

    print(f"Importing hint content from {hints_path} ...")
    client.import_hints(hints_path)

    print(
        "Done. If the oracle wrapper container was already running, it logged in before CTFd "
        "was ready and is crash-looping — either wait for its restart backoff or run "
        "`docker compose restart oracle` now."
    )
    return 0


if __name__ == "__main__":
    sys.exit(main())
