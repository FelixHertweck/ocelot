"""Placeholder exponential penalty schedule. Values are illustrative only, pending pilot
calibration — the ratio matters more than the absolute numbers. Kept in one place so
calibration only ever touches this file, not the variant clients."""

from .models import Tier

TIER_COST: dict[Tier, int] = {"low": 1, "medium": 3, "high": 9}


def cost_for_tier(tier: Tier) -> int:
    return TIER_COST[tier]
