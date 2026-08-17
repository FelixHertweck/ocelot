"""Variant A: deterministic, CTFd-backed hint lookup.

Hint categories are not a fixed taxonomy — they're whatever CTFd challenges exist for the
active scenario (e.g. one per host, one for the physical relay), discovered live via
`list_categories()` / the `list_hint_categories` MCP tool, not hardcoded here. Content schema:
one CTFd "challenge" per category, with up to 3 hints ordered Low→Medium→High.

Tier progression and idempotent re-requests are tracked from the wrapper's own structured log,
not by round-tripping CTFd's per-team unlock state — CTFd is used purely as the
fixed-content-per-cell store.

Authenticated with a logged-in session (username/password), not an API token — confirmed
against a real CTFd 3.7.7 instance that `GET /api/v1/hints/<id>` (the call that actually
retrieves unlocked hint content) only recognizes Flask session auth; API-token auth gets a
403 "You must login" there even though the same token works fine for every other endpoint used
here. Using one session consistently avoids relying on two different auth mechanisms.

The acting CTFd user must also hold enough score to "afford" a hint's cost — CTFd's unlock
model deducts real points, and a fresh user has none. Provisioning (see
images/oracle/README.md) must grant a large one-off award via `POST /api/v1/awards` before a
run starts, or every unlock fails with "You do not have enough points" regardless of auth.
"""

import re

import requests

from .logging_store import OracleLogStore
from .models import AskOracleResponse, OracleLogEntry, Tier
from .util import now_iso

TIERS: list[Tier] = ["low", "medium", "high"]

_NONCE_RE = re.compile(r"csrfNonce['\"]?\s*:\s*[\"']([0-9a-fA-F]+)[\"']")


class CTFdError(RuntimeError):
    pass


class CTFdClient:
    def __init__(self, base_url: str, username: str, password: str):
        self._base_url = base_url.rstrip("/")
        self._session = requests.Session()
        self._login(username, password)
        self._csrf_token = self._scrape_nonce(self._session.get(f"{self._base_url}/challenges"))

    def _scrape_nonce(self, response: requests.Response) -> str:
        match = _NONCE_RE.search(response.text)
        if not match:
            raise CTFdError("Could not find a CSRF nonce in the CTFd page")
        return match.group(1)

    def _login(self, username: str, password: str) -> None:
        login_page = self._session.get(f"{self._base_url}/login")
        nonce = self._scrape_nonce(login_page)
        r = self._session.post(
            f"{self._base_url}/login",
            data={"name": username, "password": password, "nonce": nonce},
            allow_redirects=False,
        )
        if r.status_code != 302:
            raise CTFdError(f"CTFd login failed for user '{username}'")

    def _get(self, path: str) -> dict:
        r = self._session.get(f"{self._base_url}/api/v1/{path}")
        r.raise_for_status()
        return r.json()

    def _post(self, path: str, payload: dict) -> dict:
        r = self._session.post(
            f"{self._base_url}/api/v1/{path}",
            json=payload,
            headers={"CSRF-Token": self._csrf_token},
        )
        r.raise_for_status()
        return r.json()

    def list_challenges(self) -> list[dict]:
        return self._get("challenges").get("data", [])

    def find_challenge_id(self, name: str) -> int | None:
        for c in self.list_challenges():
            if c["name"] == name:
                return c["id"]
        return None

    def hints_for_challenge(self, challenge_id: int) -> list[dict]:
        detail = self._get(f"challenges/{challenge_id}")
        return detail["data"].get("hints", [])

    def unlock_hint(self, hint_id: int) -> dict:
        try:
            self._post("unlocks", {"target": hint_id, "type": "hints"})
        except requests.HTTPError as e:
            # Already unlocked (e.g. log out of sync with CTFd) is fine; other errors are real.
            already_unlocked = (
                e.response is not None
                and e.response.status_code == 400
                and "already unlocked" in e.response.text.lower()
            )
            if not already_unlocked:
                raise
        return self._get(f"hints/{hint_id}")


class VariantA:
    def __init__(self, ctfd: CTFdClient, log_store: OracleLogStore, run_id: str):
        self._ctfd = ctfd
        self._log = log_store
        self._run_id = run_id

    def list_categories(self) -> list[str]:
        """Live from CTFd, not a fixed taxonomy — reflects whatever content is currently loaded
        for this run, so it can change without restarting the wrapper."""
        return [c["name"] for c in self._ctfd.list_challenges()]

    def handle(self, category: str, context: str) -> AskOracleResponse:
        if not category:
            raise ValueError("category is required — call list_hint_categories first")

        prior = self._log.entries_for_category(self._run_id, category)

        # Idempotent re-request at max tier: repeating after High re-returns the same hint
        # without re-charging.
        if len(prior) >= len(TIERS):
            last = prior[-1]
            self._log.append(
                OracleLogEntry(
                    run_id=self._run_id,
                    category=category,
                    category_source="attacker",
                    tier=last.tier,
                    tier_source="count_rule",
                    context=context,
                    hint=last.hint,
                    ctfd_hint_id=last.ctfd_hint_id,
                    cost_applied=0,
                    fresh_unlock=False,
                    timestamp=now_iso(),
                )
            )
            return AskOracleResponse(
                category=category,
                tier=last.tier,
                hint=last.hint,
                requests_used_this_category=len(prior) + 1,
            )

        tier_index = len(prior)
        tier: Tier = TIERS[tier_index]

        challenge_id = self._ctfd.find_challenge_id(category)
        if challenge_id is None:
            raise CTFdError(
                f"Unknown category '{category}' — call list_hint_categories for the current list"
            )

        hints = self._ctfd.hints_for_challenge(challenge_id)
        if tier_index >= len(hints):
            raise CTFdError(f"Category '{category}' has fewer than {tier_index + 1} hints")

        target_hint = hints[tier_index]
        unlocked = self._ctfd.unlock_hint(target_hint["id"])
        hint_text = unlocked["data"]["content"]
        cost = target_hint.get("cost", 0)

        self._log.append(
            OracleLogEntry(
                run_id=self._run_id,
                category=category,
                category_source="attacker",
                tier=tier,
                tier_source="count_rule",
                context=context,
                hint=hint_text,
                ctfd_hint_id=target_hint["id"],
                cost_applied=cost,
                fresh_unlock=True,
                timestamp=now_iso(),
            )
        )
        return AskOracleResponse(
            category=category,
            tier=tier,
            hint=hint_text,
            requests_used_this_category=len(prior) + 1,
        )
