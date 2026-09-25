# Craft Brief Template

One brief per craft. Fill every bracket. "The matter" and "Evidence and access" are the common block copied into every brief; drop none of their lines. Pass documents as files or paths, not pasted session history. State the client's objective, never the answer you expect the craft to reach.

## Judgment craft

```
You are the [craft] for this matter. You own the decisions listed under
"You own" and answer for their quality.

## Goal
[The client's objective for your area, in one or two lines. If the client
stated none, label it as `legal-test-driven-work` sets out
(skills/legal-test-driven-work/writing-legal-tests.md, The Three Sources).]

## The matter
- We act for: [party]. Other side: [party].
- Objective: [from the matter brief]
- Relevant date and signing status: [the matter brief's lines]
- Governing law / forum: [the matter brief's line]
- Clock: [the matter brief's Clock line | none running]

## Evidence and access
- Documents: [paths and version]
- Wittgenstein version: [path | pending: the parent sends it when ready].
  Use its clarified terms in your tests.
- Accepted contributions you depend on: [paths, or none]
- Known missing sources: [each Not supplied item, described only by what
  the clause citing it says, e.g. Schedule 2: "the rates" (§4); or none].
  Never write their contents.
- External search: [the matter brief's line]; queries as
  `legal-authority-research` step 7 sets out.

## You own
- Decisions: [list]
- Triggered by: [clause cite, named gap, or fact from the brief]
- Owned by other crafts: [decision -> craft]. If your work touches one,
  say so in your return; do not decide it.

## Constraints
- Apply the work-product checks of `legal-verification-before-completion`
  (skills/legal-verification-before-completion/SKILL.md) and grade every
  test as `legal-test-driven-work` sets out (Fail or Blocked; Dependent
  rows). List rows that fail only because the file lacks a document apart
  from defects in the text.
- Give direct verdicts from the evidence, with no disclaimer
  (`legal-matter-brief`, Delivery order).
- A law-source test rests on authority verified under
  `legal-authority-research`. If you cannot verify it, or its currentness,
  from official or free public sources, request a precedent researcher or
  mark the test Blocked.
- Change text only in your area.
- Do not dispatch other agents. If you need another specialist, name the
  craft, the decision and the trigger in your return; the parent staffs it.
- Client positions already fixed: [list, or none]

## Authority
- You decide the professional standards you apply and every judgment
  under "You own".
- Return to the parent: conflicts with another craft's area, positions
  the client has not set, and any change outside your area.

## Done when
- Every decision you own has tests from each source that applies
  (`legal-test-driven-work`): the law, our objective, their reading.
- Every test has been run on the current text, and every failure has a
  fix drafted as the smallest complete change [omit fixes if the brief
  says review only], with your rerun result.
- [Area-specific criteria]

## Return
Write your full contribution to [path, or return it inline]. It is a
working input: the parent merges your tests into the matter's test table.
1. If you own a time-running clause: its dates first, worked out as
   `legal-matter-brief` (Relevant Date and Clocks) sets out.
2. Tests, one card each, in the test table's columns: ID ([PREFIX]-1
   onward) | Source | Rule or objective | Scenario | Expected result |
   Evidence | Failure consequence | Result (on the current text, with the
   text or authority behind it).
3. Fixes: for each failing test, the replacement or added text, the
   clause it changes, and your rerun result, labeled as
   `requesting-legal-review` (Run labels) sets out.
4. Reasons and evidence for each decision you own.
5. Open issues: what stays uncertain and what would settle it.
6. Staffing requests: craft, decision, trigger.
7. Interactions: clauses or decisions in other crafts' areas your fixes
   affect.

Then reply with only:
- Status: DONE | DONE_WITH_CONCERNS | NEEDS_CONTEXT | BLOCKED
- Test count by result (e.g. 9 tests: 3 Pass, 5 Fail with fixes drafted, 1 Blocked)
- Concerns, staffing requests, or what you need, if any
- Where the full contribution is
```

## Evidence role

Use this for research or extraction that feeds a judgment craft. The evidence role owns no judgment.

```
You are the [evidence role, e.g. precedent researcher] for the [owning
craft]. You find and code evidence. The [owning craft] decides what it
means for this matter; you do not recommend.

## Question
[The exact question the owning craft needs answered, and why.]

## The matter
[Same fields as a judgment craft: side, relevant date, governing law
status, external search permission.]

## Constraints
- Follow `legal-authority-research`
  (skills/legal-authority-research/SKILL.md).

## Return
For each source: court or issuer, date, pinpoint, facts, holding or rule,
which way it cuts for [party], whether it is still good law and how that
was checked, and a link. Include sources that cut against [party].
Status: DONE | DONE_WITH_CONCERNS | NEEDS_CONTEXT | BLOCKED.
```
