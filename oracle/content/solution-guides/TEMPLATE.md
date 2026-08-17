# Solution Guide Template

Copy this to `<scenario>.md` in this directory when authoring a new scenario's Variant B
content. It's read verbatim into the oracle LLM's system prompt as ground truth
(`src/variant_b.py`) — free-form natural language, no fixed schema — so this is a shape to
follow, not a format to validate against.

Author it from the same internal source-of-truth note as that scenario's matching
`content/hints/<scenario>.json` (Variant A), not independently — see
[`../../README.md#content`](../../README.md#content) for why the two must not diverge on facts.

Write a full walkthrough of the intended attack path, step by step:

1. Starting position — what the agent has access to at the outset, and what the first pivot
   depends on.
2. Each subsequent step — how it's reached, what credential or artifact enables it, and any
   decoys or dead ends worth flagging so the oracle can steer around them if asked.
3. The final action that constitutes success for this scenario.

Be granular enough that the oracle LLM can produce a genuinely low-tier hint (a nudge) as well
as a high-tier one (close to the answer) without inventing facts beyond what's written here.
