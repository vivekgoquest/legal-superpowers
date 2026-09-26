---
name: legal-work-planning
description: Use when a matter brief calls for legal work with more than one step, such as several clauses, issues, or documents, more than one craft, research or a client decision that must come before drafting, or a negotiation over several points; when asked to plan, sequence, scope, stage, or map out a review, redline, renegotiation, drafting project, diligence exercise, or legal argument; when asked for a work plan, action list, or negotiation plan for a legal matter; when told to skip the plan, go straight to drafting, split the work into parallel workstreams by section, or leave a decision such as governing law until the end; or when a plan already exists and a new fact, document, client decision, or review result changes the work.
---

# Legal Work Planning

## Overview

A plan turns a brief into tasks an executor can run without asking what to do or deciding anything the brief left to the client. Each task names the clause or issue, the owning craft, the tests it must make pass, what it waits for, and what done means. Order does the rest: a drafting task placed before the law, fact, or client decision it rests on produces text that passes nothing.

**Core rule:**

```
NO MULTI-STEP LEGAL WORK STARTS WITHOUT A WRITTEN PLAN THAT PASSED REVIEW
NO TASK WITHOUT AN OWNER, THE TESTS IT MUST MAKE PASS, AND WHAT DONE MEANS
```

**When not to plan.** A settled edit, or one mechanism with one craft and nothing it waits on, goes straight to `legal-test-driven-work`. A plan is never longer than the work it controls. A small matter gets a short plan, not tasks with fewer fields.

## Process

1. **Start from the brief.** No brief: `legal-matter-brief` first.
   - Plain labels for gates ("Renewal notice deadline"), never codes; the Wittgenstein version and skill names stay exact.
   - A planning question that would change a test goes back to the brief; the plan never settles it silently.
2. **Check scope.** Independent matters (separate deals, or documents with no mechanism in common) get one plan each.
3. **Take the staffing table** from `legal-craft-delegation`. None yet: run its discovery now. Every clause-family or research task has exactly one owning craft from that table; clock, Wittgenstein, assembly, independent-run and verification tasks name their owner (the client, the skill, or the parent). A task needing a craft not in it goes back to the parent's staffing list.
4. **Map the mechanisms.** Group clauses that implement one allocation into one task, across headings and documents: a termination right with its notice, cure, survival, and payment on exit; ownership with the payment that triggers it and any license back. Split only where a reviewer could reject one task and accept its neighbor.
5. **Seed the tests.** Write the objective cards the brief already fixes (they restate the brief, so no craft judgment is taken) into the test table (`legal-test-driven-work`), in the Wittgenstein version's clarified terms, and cite their IDs in the plan. Each seeded card carries its owning craft's ID prefix; in its task's first step that craft may amend the scenario, and adds the law and their-reading cards. The plan never restates a card or a result.
6. **Order the tasks** (below) and write each one in the task shape.
7. **Self-review**, then a **fresh-context plan review** with [plan-reviewer-prompt.md](plan-reviewer-prompt.md). The planner never approves its own plan. No subagent tool, or the dispatch failed: run the review as `requesting-legal-review` (When the Setup Falls Short) sets out and carry on; a failed dispatch never ends the work. Fix every issue found and re-review the changed tasks.
8. **Save** the plan with the matter's record, beside the brief and the test table, or where the user says. **Present it and stop** until the user agrees or corrects it, unless they told you to proceed. Then hand off.

## Order

0. **Clocks.** Each clock that could run before the work finishes (notice, renewal or option window; limitation; filing) sits above Task 1, carried from the brief's Clock line (`legal-matter-brief`, Relevant Date and Clocks), with the tasks that cannot finish before it.
1. **Wittgenstein version first** (`legal-wittgenstein`) of each key document, usually commissioned at the brief. The plan cites its path and never writes its own restatement. Until it returns, mark it commissioned, not done, and list its Open points with their clauses quoted once, not paraphrased; later mentions cite the clause. Each Open point goes to the tasks whose tests turn on it; those tests wait for the clarified term.
2. **Gates early.** Client decisions, missing documents, and unconfirmed facts are asked for now; each holds back only the cards that need it. Every Not-supplied document is a gate in the Needs of each task whose clauses refer to it or whose cards could turn on what it may contain (see No Placeholders), and drafting that turns on it waits until it arrives or the client confirms it cannot be had. For a document that may be in force, the facts `legal-matter-brief` records under Relevant Date are gates; "none referenced" is not "none exist". Silence is not a fact: a topic the deal may involve that the document never mentions is Unknown and a gate, never a default; its craft is staffed as `legal-craft-delegation` step 3 sets out. For a value only the client can supply, the task names who supplies it and which cards stay Blocked until then.
3. **Research before the law rows it feeds** (`legal-authority-research`). No governing law in the file (`legal-matter-brief` step 2) is an early gate; every law row stays Blocked until then. The plan never chooses a governing law; one the user asks to assume is labeled as `legal-authority-research` step 2 sets out. Where choosing the law is part of the objective, a craft-owned task sets out each candidate and the cards it passes and fails before the client gate (where the other side must agree, the client chooses only what to propose); law rows run per candidate, labeled with it, and all rerun once the law is chosen as the document requires.
4. **Clause-family tasks,** each after everything in its Needs. Independent tasks run in parallel.
5. **Assemble and harmonize** (the parent): definitions, cross-references, precedence, and survival across families without moving a position. Rerun the affected cards. Commission the Wittgenstein version of the final text.
6. **Independent run:** a fresh-context opposing reader runs the whole suite (`requesting-legal-review`); failures go back to the owning craft (`receiving-legal-review`).
7. **Verification last** (`legal-verification-before-completion`).

## Plan Header

```markdown
# [Matter] Work Plan

> Execute with `executing-legal-work-plans`, which dispatches the crafts through `legal-craft-delegation`. Steps use checkboxes.

**Brief:** [path, or "above"]. Executors read the brief and the plan together.
**Goal:** [the objective, one sentence, from the brief]
**Test table:** [path]. The matter's single record; this plan cites its IDs.
**Staffing:** [the table from `legal-craft-delegation`, or its path]

## Fixed Constraints
[One line each, copied verbatim from the brief: acting for and against; non-negotiables and fallbacks; governing law status; relevant date (for an amendment: the expected amendment date for the amended text, the original date only for reading the current text); signing status; documents Not supplied; external search limit.]
```

## Task Shape

```markdown
### Task N: [clause family or issue]
**Owner:** [craft from the staffing table]
**Acts on:** [document and clause cites, or the named gap]
**Needs:** [earlier task numbers, accepted contributions, authority; each gate (document Not supplied, fact, client decision) with the card IDs that wait on it; or none]
**Tests:** [card IDs this task must make pass]; owner adds [law | their reading] cards for [mechanism]
**Interacts with:** [defined terms and clauses outside the family its fix may change; tasks that rerun cards if it does]
**Gate:** [decision the user makes before Task M starts; or none]
**Done when:** [contribution at path; any criterion beyond the listed cards]

- [ ] Missing cards, all three sources
- [ ] RED, quoting the clause
- [ ] GREEN for each Fail
- [ ] GREEN check, their reading included
- [ ] REFACTOR; rerun touched cards
```

The steps are the `legal-test-driven-work` cycle. The task's status (Done, Drafted, Open, Held) is read off its rows as `executing-legal-work-plans` defines it. A review task with no fixes requested stops after RED. A research task names the question, the legal system, the relevant date, the external-search limit, and the Blocked card IDs it serves; the evidence role owns no judgment. A negotiation task states the position and each fallback, and which cards each one passes and gives up.

**The plan contains no clause text.** The owning craft derives it from the RED, in the task; text in a plan is text before a failing test.

## No Placeholders

Plan failures; never write them:

- "Review termination", "tighten confidentiality", "fix issues", "as appropriate", "standard" or "market" language, "TBD".
- A task with no card IDs, no owner, or no done criterion.
- "Research the law" without the question, the legal system, and the relevant date.
- "Similar to Task N". An executor may see only its own task; repeat what it needs.
- A card ID, defined term, clause cite, or document version that does not exist in the table or the file.
- A missing document's contents treated as known ("per Schedule 2", "Schedule 2 sets the fees", "Schedule 2 sets none"). Say what it may contain, never what it says.

## Self-Review

1. **Brief coverage:** every objective, non-negotiable, and deliverable maps to a task and its cards. Nothing outside the brief; a scope limit the user did not state is labeled assumed, never attributed to them; gaps noticed outside it are listed in one line for the user to add or leave.
2. **Placeholder scan:** the list above.
3. **Consistency:** the same defined terms, card IDs, clause cites, and document versions in every task; each decision in one task only; one status per task; no reading stated as settled on a term sent for clarification; every Needs points to an earlier task or a named gate, and every Not-supplied document is in the Needs of each task it may reach (Order 2).
4. **Order:** as in Order, 0 to 7; no card before its gate.

## Handoff

**When told to skip the plan or its review,** write the plan anyway, as short as the work allows, in the same reply. Start only what needs no plan (the Wittgenstein version, the Clocks, the gate questions) while the fresh-context review runs. Drafting starts when the review passes, without waiting for the user's approval. Speed changes the plan's length, never whether it exists. A decision the user defers ("governing law at the end") becomes a gate: say in one line which cards wait on it, and plan the work that does not.

**When the work changes** (a new fact, document, client decision, or review result), update the brief, then the affected tasks and their order, then rerun the affected cards. Never deviate from the plan silently.

## Red Flags: Stop and Replan

- A task with no card IDs, or cards with no owner
- A clock missing from above Task 1, or not worked out as `legal-matter-brief` sets out
- An agreement in force with no gate on what has been delivered, paid, and notified
- Clause text written into the plan
- A governing law chosen by the plan, or a law row planned to pass before research
- A drafting task before the research, fact, document, or client decision it rests on, or a Not-supplied document missing from the Needs of a task it may reach
- The Wittgenstein version missing, late, written by the planner, marked done before `legal-wittgenstein` returns, or not planned for the final text
- Workstreams split by section heading when the mechanism spans clauses
- A drafter scheduled to grade its own clause, or no independent run and verification at the end
- A plan that tracks results or findings instead of citing the test table
- Execution started before the plan passed review
- A craft dropped to shorten the plan

## Rationalizations

| Thought | Reality |
|---|---|
| "They asked me to plan it; a list of topics is a plan." | A topic list names no test, owner, or done. No executor can tell when a task is finished. |
| "The fixes are obvious; skip the plan." | Obvious fixes still wait on the governing law and on each other. A short plan is minutes; a clause drafted out of order is redone. |
| "Governing law can be sorted out at the end." | Every law row waits on it. It is an early gate, or every clause is drafted blind. |
| "One workstream per section, all in parallel." | Termination, ownership, and survival move together. Split by mechanism; run in parallel only what needs nothing from another task. |
| "Each workstream can sign off its own section." | Whoever drafted a clause never grades it. The independent run and verification are the last tasks. |
| "The plan is simple; no review needed." | The planner does not approve its own plan. A fresh reviewer finds the missing dependency before it costs a redraft. |
| "The Wittgenstein version can come at the end." / "I'll paraphrase it until it arrives." | The tests are written in its terms, so it comes first, from `legal-wittgenstein`; a planner's paraphrase settles the terms sent for clarification. The final text gets its own at the end. |
| "The client will decide later; draft both ways now." | Put the decision in an early gate. Options with the cards each one passes are fine; drafting past an open decision is not. |

## Example Order (illustrative)

SaaS subscription renewal, acting for the customer; the agreement names no governing law:

| Task | Owner | Needs |
|---|---|---|
| 0. Non-renewal notice deadline, on the brief's Clock line: both paths; the client decides | Client decision | None |
| 1. Wittgenstein version of the agreement and order form | `legal-wittgenstein` | None |
| 2. Governing law and forum: each candidate with the cards it passes and fails, from sanitized research; then the client gate on what to propose | Conflict-of-laws lawyer (researcher gathers evidence only) | None |
| 3. Data family: processing terms, breach notice, subprocessors | Data protection lawyer | 1; law cards 2 |
| 4. Liability family: cap, exclusions, indemnity, insurance | Commercial contracts lawyer | 1, 3 (breach cap); law cards 2 |
| 5. Service levels and credits | Engineer for service levels | 1 |
| 6. Assemble, harmonize; Wittgenstein version of the final text | Parent | 3, 4, 5 |
| 7. Independent run (`requesting-legal-review`); failures to the owning craft (`receiving-legal-review`) | Fresh-context opposing reader | 6 |
| 8. Verify | `legal-verification-before-completion` | 7 |
