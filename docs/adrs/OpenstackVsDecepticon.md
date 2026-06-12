# ADR: OpenStack over Decepticon from Phase 1 onwards

**Date:** 2026-06-05
**Status:** Proposed (Under Review)
**Context:** Selection of AI coding platform for the OCELOT project

---

## Context

During Phase 0, two AI-assisted coding agent platforms were evaluated: **OpenHands (OpenStack)** and **Decepticon**. The goal was to identify a platform capable of autonomously solving OT security tasks (e.g. Modbus TCP implementations) based on a base prompt alone.

---

## Decision

From Phase 1 onwards, only **OpenHands (OpenStack)** will be used. A formal Phase 0 evaluation for Decepticon will not be conducted.

Decepticon will remain in the repository for now so that other users can try it for themselves.

---

## Rationale

### OpenHands (OpenStack) — Strengths

- Solved the Phase 0 task using only the base prompt, with no additional guidance.
- Delivered a complete, working result in under 10 minutes.
- Consumed significantly fewer tokens in comparison.
- Stable and usable interface.

### Decepticon — Reasons for Exclusion

1. **Unstable UI:** The interface is heavily buggy and severely hampers usability.
2. **Slow execution:** Tasks take an unreasonably long time to start and run.
3. **Unreliable results:** Even after extended runtimes, the platform frequently fails to produce a usable result. In Phase 0, Decepticon was terminated after more than 30 minutes with no output.

### Direct Comparison — Phase 0

| Criterion | OpenHands | Decepticon |
|---|---|---|
| Result | Complete, working | No result (aborted) |
| Runtime | < 10 minutes | > 30 minutes |
| Guidance required | Base prompt only | All available hints |
| Token consumption | Low | High |
| UI stability | Stable | Heavily buggy |

---

## Consequences

- Phase 0 evaluation for Decepticon will not be carried out.
- All subsequent phases (1+) are built exclusively on OpenHands.
- Decepticon configuration and any existing artifacts remain in the repository for reference and for use by third parties.
