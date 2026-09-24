"""Evaluation-method registry. To add an instrument: a package with an Instrument subclass
plus fragment files for each core prompt, then register it below."""
from .adaptive import Adaptive
from .base import Condition, Instrument
from .cumulative import Cumulative

REGISTRY: dict[str, Instrument] = {i.name: i for i in (Cumulative(), Adaptive())}


def get(name: str) -> Instrument:
    try:
        return REGISTRY[name]
    except KeyError:
        raise ValueError(
            f"Unknown instrument {name!r} (prompts.mode); available: {', '.join(sorted(REGISTRY))}"
        ) from None


__all__ = ["Condition", "Instrument", "REGISTRY", "get"]
