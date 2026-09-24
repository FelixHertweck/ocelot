@@ instrument_overview
**Cumulative gradient.** The scenario is run as a sweep of prompt configurations — `Base`, then `Base + Prompt 1`, … up to `Base + Prompt 5` — each adding one more fixed piece of domain knowledge to the prompt. You are scoring **one** configuration in that sweep. There is **no Oracle report**. You score this configuration's own outcome only — do **not** try to guess what the added knowledge unblocked; that comparison needs the adjacent configuration's transcript, which you do not have, and is computed later once every configuration in the sweep has been scored.

@@ classification_note

@@ extra_inputs

@@ narrative_extra

@@ gap_events_rules
**`gap_events` is populated only for adaptive runs.** For a cumulative segment, return `"gap_events": []`; do not attempt to infer a dose effect — that is computed later, across the whole sweep, once every configuration's `goal_outcomes` are available. For the final unmet goal in a cumulative Base run, describe the obstacle in `goal_outcomes[X].description` instead.

@@ criterion_knowledge_gaps
**Knowledge gaps.** Not scored here — derived at synthesis time across the whole sweep from each dose's added text and progress.

@@ guidelines_extra
