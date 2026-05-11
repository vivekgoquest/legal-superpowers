---
name: strategy-confidence-loop
description: Use when the user asks whether a strategy is 100% confident, asks for loopholes, asks to loop until factually confident, or when a high-stakes plan, review, legal analysis, architecture, or verification claim needs adversarial validation
---

# Strategy Confidence Loop

## Trigger Phrase

Preserve this user phrase exactly:

```text
Are you 100% confident in this strategy? If not, find all possible loopholes,
  suggest proper fixes and run this loop until you are factually 100% confident
  in the  startegy
```

## Overview

Use this skill to turn confidence into evidence. Factually 100% confident means bounded by evidence: every known loophole in the stated scope has either a verified fix, a passing check, or an explicit residual boundary.

Do not claim 100% confidence for open-ended strategy, legal advice, future behavior, external systems, or facts that cannot be fully verified. State the bounded confidence instead.

## Required Workflow

1. **Name the strategy:** State the exact strategy, claim, plan, or recommendation being tested.
2. **Set the confidence boundary:** Identify what can be verified and what cannot.
3. **Build a loophole ledger:** List failure modes, missing evidence, unstated assumptions, edge cases, dependencies, and adversarial pressures.
4. **Suggest fixes:** For each loophole, add a concrete fix, test, guardrail, source check, or owner.
5. **Run the checks:** Execute available tests or inspections. For non-executable risks, mark the evidence needed.
6. **Fix-And-Recheck Loop:** Apply fixes, rerun the relevant checks, and repeat until no known in-scope loopholes remain.
7. **Report confidence honestly:** Say which parts are factually verified, which are bounded assumptions, and which remain impossible to prove.

## Output Shape

- Strategy tested.
- Loophole ledger.
- Fixes applied or proposed.
- Verification evidence.
- Remaining confidence boundary.
- Final recommendation.

## Red Flags

- Saying "100% confident" without defining scope.
- Treating no known issues as proof there are no issues.
- Using optimism instead of verification.
- Ignoring external dependencies, legal/currentness limits, unavailable tools, or future behavior.
- Stopping after one review pass when new loopholes appeared.
