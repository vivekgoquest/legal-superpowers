---
name: legal-test-driven-work
description: Use when drafting, revising, reviewing, or redlining a contract, clause, or other legal document; when responding to the other side's markup or negotiating a term; when building, testing, or attacking a legal argument or position against a rule; when asked whether a document or clause works for a party, is acceptable, or is ready to sign; or when asked to fix, tighten, or rewrite a clause, including when told to skip the analysis and just give the text.
---

# Legal Test-Driven Work

## Overview

Write the tests first. Run them on the current text and watch it fail. Draft the smallest complete change that passes. Run the scenarios. Harmonize.

**Core principle:** If you did not watch the current text fail a scenario, you do not know what your drafting fixes, or whether it fixes anything.

**Violating the letter of the rules is violating the spirit of the rules.**

## When to Use

| Work | Under test | Tests | Fixtures | Drafting |
|---|---|---|---|---|
| Drafting | New text | The law, our objective, their reading | Deal facts and scenarios | GREEN, REFACTOR |
| Review | Existing text | Same | Scenarios that stress each mechanism | None: the failing rows after RED are the findings |
| Redline | Their draft (their comments: `receiving-legal-review`), then our changes | Same, plus our objective against each of their changes | Same | GREEN, REFACTOR |
| Argument | The argument (writing-legal-tests.md, Arguments) | Elements of the governing rule, our objective, their best answer to each element | Facts in the record | GREEN, REFACTOR |

## The Iron Law

```
NO NEW TEXT WITHOUT A FAILING TEST FIRST
NO FINDING OR VERDICT THAT IS NOT A ROW IN THE TEST TABLE
```

Drafted the clause before the test? Set it aside. Write the test and run it on the text as it stood before the change. That is the RED. If the old text already passes, do not draft. If it fails, derive the change from the failure, not from the early draft. An early draft adapted into the answer passes the tests you write around it.

## The Test Card

| Field | Meaning |
|---|---|
| Source | Whose test it is: **the law** (valid, enforceable, compliant), **our objective** (the client gets the outcome it needs), or **their reading** (writing-legal-tests.md, The Three Sources) |
| Rule or objective | What must hold |
| Scenario | The facts or event that trigger it |
| Expected result | The outcome the text must produce |
| Evidence | Document text, instruction, fact, or verified authority |
| Failure consequence | What goes wrong if it fails |
| Result | Pass, Fail, Partial, or Blocked, with the text or authority behind it |

**The test table** is one row per card, with these fields as columns and an ID. When several crafts work, prefix the ID with the owning craft (TAX-2). The table is the matter's single record. Findings are its failing rows. Every report, summary, and verdict is read off it. Do not keep a separate issues list, ledger, or memo that restates it.

**Fail or Blocked.**

- **Fail:** the text in the file gives the wrong answer or none: an absent mechanism, an undefined term, no choice of governing law in the file, or a document the text relies on that is Not supplied. Write "the file lacks [item]"; describe the item only by what the text citing it says; never state its contents or say it does not exist; write a consequence it could change as "unless [item] sets it". An absence claim names the documents read and the items Not supplied. Drafting the term or getting the document fixes it; a bracketed proposal, fallback or precedence clause for the missing content does not.
- **Partial:** part of the mechanism works and a named material gap remains.
- **Blocked:** only what drafting cannot supply: unverified law (every law row resting on a missing choice of law included), an unconfirmed fact, a client decision (a bracketed value the outcome turns on reads "Blocked: client decision", never Partial), or the judgment of a craft that never ran ("Blocked: craft not dispatched", adding "(user direction)" when the user dropped it; a row the text alone decides keeps its Pass or Fail). Name what unblocks it. A row with a part of each (a missing exhibit and a bracketed value; a gap in the text and the default law that would fill it) is split, and the text part gets its fix. No assumption turns Blocked into Pass or Partial.
- **Text, not law.** Every line you write (rows, Failure consequences, verdict lines, replies, summaries, the Wittgenstein version) states what the text provides and stops there: "the text states X; [effect] Blocked ([ID])". Anything beyond it is a law row, Blocked until verified: a right, remedy, or "only"/"only if" route the law adds or removes; enforceability; what is owed, owned, paid or protected where no clause states it, or after a contractual duty ends; and whether an unsigned document, a redline or an amendment binds, unless the text sets the formality (quote it). Unchosen law is undetermined, not absent. Where a clause could settle the point on the text (no waiver, survival, a window), the row is a drafting row with options (step 3); only what the law does with that clause is Blocked.

**Dependent rows.** Before any table leaves your hands (to the independent run or to the user), check every Pass row mechanically: list each defined term, bracketed value, exhibit, and notice or payment route its Scenario, Expected result, or Evidence runs through (a right exercised by notice, ownership that passes on payment, a deadline in a bracket or in an exhibit the file lacks). If the row governing any of them is Fail, Partial, or Blocked, the row reads "Partial, dependent on [ID]" or "Blocked on [ID]", never Pass. No row governs one yet? Write that row first. A row that turns on what an open item says takes that item's result; a row that only runs through it reads "Partial, dependent on [ID]" (item Fail or Partial) or "Blocked on [ID]" (item Blocked).

## The Cycle

### 0. Brief, terms, crafts

- A test needs a side. Take the brief from `legal-matter-brief`, whose gate decides when one exists.
- Tests are written in the clarified terms of the document's Wittgenstein version from `legal-wittgenstein`. If none exists yet, produce it now. A test whose expected result turns on an open-ended word ("material", "reasonable", "notice", "delivery", "late") goes to `legal-wittgenstein` first. Until the word is tied to the document's own uses, the test cannot be decided.
- Crafts (tax, data protection, finance, IP, service levels), even one: `legal-craft-delegation` staffs and runs them; each craft writes and runs the rows for its area. Rows for a craft that never ran are Blocked as above. A settled edit (`legal-matter-brief`) skips the fan-out.

### 1. Write the tests

Read [writing-legal-tests.md](writing-legal-tests.md) first. For each mechanism the brief puts in play, write tests from each source that bears on it; every suite has at least one row from their reading. Walk every family in its "Where Tests Hide". Before keeping a test, name the reading or event that would make it fail. If you cannot, it is not a test.

Law rows rest on authority verified through `legal-authority-research` for a confirmed jurisdiction at the relevant date; otherwise the row is Blocked, naming the real blocker. Different issues can have different laws, and a law the user asks you to assume is labeled: both as `legal-authority-research` step 2 sets out.

### 2. RED: run the tests on the current text

For each test, quote the clause with its cite, run the scenario, and state the outcome the text actually produces.

- A Fail shows the scenario and why the quoted text gives the wrong or no outcome. "Could be clearer" is not a Fail.
- New document: the RED is the absent mechanism.
- Already passes? Keep the text. Do not rewrite to show activity.
- Cannot explain why it fails, or one fix did not flip it? `legal-issue-tracing`, before changing the test or the text.

### 3. GREEN: the smallest complete change

Draft only what makes the failing tests pass, but make the mechanism complete: actor, trigger, act, standard, deadline, notice, evidence, exception, consequence, and interaction with termination, survival, money already paid, and ownership.

- A value only the client or the deal can supply goes in brackets ("[Delivery Date]"). Brackets mark a value still to be supplied, never a reference the document already makes. Never invent it. If the test's outcome turns on that value, the row stays Blocked until it is supplied.
- Completing the mechanism the instruction names is drafted: how the right is exercised and when it takes effect, and payment, refund, ownership and work in progress on exit. Where the brief's side and objective fix an element, draft it as our proposal (the other side must still accept it). Otherwise never read a position into the instruction ("walk away" is not "owe nothing for work done"): give labeled options ("[Option A: ...] / [Option B: ...]"), run each through step 4, and mark the row "Blocked: client decision", never Pass or Partial on an assumed objective; never pick one provisionally and draft on it. The same for a change that moves a negotiated allocation. Under a plan, the task's mechanism is the boundary; a new trigger, standard or allocation outside it is a held question with options, never drafted in.
- Add nothing no test asked for. Words that reach past the instruction ("under Section 2 or otherwise"), or a carve-out or condition that narrows our side's right, are a new position: offer it as an option or leave it out.

### 4. GREEN check: run the scenarios (drafter)

Apply the new text to ordinary performance; the scenario that failed in RED; the case most favorable to our side; their reading; exceptions and timing boundaries (dates as the Clock rule of `legal-matter-brief` sets out); linked definitions, clauses, schedules, and remedies; and verified law.

**Linked-clause rows are required.** Before any fix or finding is presented, add and run a row for every clause whose money, ownership or survival outcome it changes; every route it is exercised through (notice, acceptance, payment) and every route around it either side keeps; every cap, exclusion or exclusive remedy that limits it; every blank or bracket its outcome turns on; and every date it sets, run against the term end, expiry and each Clock date. Their reading of each word it keeps or adds, brackets and options included, gets a row, and so does each reference in new text ("this Section", a defined term): number new provisions and cite them by number.

Still fails? **Trace it (`legal-issue-tracing`) before any redraft. Never weaken an accepted test to make it pass.** Change a test only when it rested on a wrong fact or authority, or the client changes its objective, and state the reason in its row.

### 5. REFACTOR: harmonize without moving positions

Align definitions, cross-references, terminology, precedence, and survival. Every term the new text brings in ("business days", "accepted") is defined or tied to an existing one. Remove contradictions and duplication. Harmonizing must not shift risk or bring in a new position under the label of clarity. Rerun every test the change touches.

### 6. Independent run

Whoever drafted a clause never grades it. Use `requesting-legal-review`: a fresh-context opposing reader runs the whole suite against the final text, and only its result closes a row. Weigh its results with `receiving-legal-review` and send each failure back to the owning craft. No subagent tool, dispatch failed, or the user directs no run: `requesting-legal-review` (When the Setup Falls Short), in the same turn, with its run labels; only a direction someone actually gave counts.

### 7. Complete

Run the dependent-rows check (The Test Card) on every Pass row, then `legal-verification-before-completion`. Every step still runs and every row is written, linked-clause rows included, whatever the user asked to see. Deliver as `legal-matter-brief` sets out (Delivery order).

## Readiness Verdicts

Asked whether a document is ready, acceptable, or ready to sign for a party? The verdict line answers, read off the table, and heads the record; a reply gives it as `legal-matter-brief` (Delivery order) sets out:

    Ready for [step]: [Yes | Not yet | No]; open: [n] Fail, [n] Partial, [n] Blocked, [n] open Pass; deciding rows: [ID] ([result]): [what turns it to Pass]; ...

- **Yes:** every row Pass on the independent run. **Not yet:** every row passes but some Pass still carries a run label; name the run state. **No:** any Fail, Partial or Blocked row. Never label a No provisional, hedge it into "it depends", or decline it; the counts show whether it rests on Fail rows or only on Blocked rows.
- **Deciding rows:** every Fail, Partial and Blocked row except those only dependent on a listed row; most serious consequence first, and within that, defects in the text, then rows open only because the file lacks an item, then other Blocked rows, then rows on an assumed objective. One short clause each on what turns it to Pass, keeping its condition; do not re-explain the row.
- Objective not stated? Rest the verdict first on rows that hold whatever the objective: the law, and their reading, which includes the document set (a missing exhibit or signature page). List the objective rows you had to assume by ID only, labeled "assumed", and name the objective as what the client must supply.

A client that accepts a risk changes its objective: rewrite that row openly, with the reason, and rerun it.

## Red Flags: STOP and Return to RED

- Clause drafted before the tests, or tests written to match a finished draft
- "Just give me the clause" read as permission to skip the tests
- A Fail with no quoted text or no scenario
- An expected result softened so the draft passes, or a law row marked Pass on unverified or assumed law
- Governing law, exhibit content, a deadline, a fact, or a client position the brief never gave, filled in because it "must" say that
- No row from their reading
- A test on "material", "reasonable", or "notice" run before the term is clarified
- New text with no row for the clauses whose money, ownership, or survival outcome it changes, or that it is exercised through; a carve-out, condition, or reach past the instruction ("or otherwise") no test asked for; or a new term with no their-reading row
- The drafter grading its own clause; a bare Pass before the independent run returns, or a run label that is not true; a Pass on a row whose dependency is open; an open Pass left out of the open rows
- "Harmonizing" that moves a position
- A verdict that does not trace to rows, or a memo or ledger that restates the table

**All of these mean: stop, go back to RED, and run the tests on the text.**

## Common Rationalizations

| Excuse | Reality |
|---|---|
| "The user said skip the tests" | The tests still run and every row is written; only the reply is short (`legal-matter-brief`, Delivery order). |
| "'Walk away' obviously means they get nothing" | That is a position the client never gave. Bracket it or give options; the row is Blocked: client decision. |
| "It's a simple clause" | Simple clauses fail on one undefined word. The test takes one line. |
| "I'll write the tests after drafting" | Tests written after the draft describe the draft and pass by construction. |
| "They'd never argue that" | Their reading is the test. Counterparties and courts read adversarially when money turns on it. |
| "Soften the test, it's an edge case" | Correct the drafting. A test changes only when its basis was wrong or the client changed its objective, and the row says so. |
| "The exhibit probably says X" | The file does not say X. The row fails until the exhibit is produced or drafted. |
| "A yes/no question needs no table" | The yes or no comes from the table, which must exist; whether it is shown follows the request. |
| "I wrote it, I know it works" | The drafter never grades. Run it fresh-context through `requesting-legal-review`. |
| "Harmonizing is just cleanup" | Cleanup that shifts risk is a new position. Rerun the affected tests. |
| "The argument works if we assume a few facts" | A fixture not in the record does not exist. The element fails until the fact is found. |
