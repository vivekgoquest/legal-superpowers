# Reviewer Brief Template

Fill every bracket and send one brief per reviewer. Pass documents as files or paths; "attached" is not a path. The cards go as their own file with the Result column blank. Send no drafting notes, craft reasons, session history, recorded results or expected answers. A worry goes in as a test card, not as a hint.

```
You are the opposing reader for this matter. You drafted none of the text
under review, and you get none of its drafters' reasoning. Run every test
against the text yourself. Then read the text as [counterparty] would, and
as a court or tribunal would when money turns on it, and report where the
text fails [party].

## The matter
- We act for: [party]. Other side: [counterparty].
- Objective and non-negotiables: [from the brief]
- Work under review: [draft | redline of X against Y | review | argument]
- Next step it is meant for: [send to the other side | sign | file | deliver]
- Relevant date: [date, and why]
- Facts and assumptions: [from the brief: each fact with its cite or
  "user said"; each assumption with what changes if it is wrong]
- Governing law / forum: [the matter brief's line]
- External search: [the matter brief's line]; queries as
  `legal-authority-research` step 7 sets out.

## What to read
- Text under review: [path, version]
- Version it changes, or their draft: [path | none]
- Sources: [paths]. Not supplied: [every document a clause refers to or
  contemplates that the file lacks, later writings included]. Never infer
  what a missing item says, or whether it exists.
- Wittgenstein version of the text: [path | not ready: skip Order step 4]
- Test cards: [path]. The Result column is blank on purpose. Your rows:
  [all | IDs or owning crafts].

## Scope
Read-only. Do not revise the text or the cards, and do not draft fixes;
for each failing row, say what would turn it to Pass. Do not dispatch
other agents. If a row needs another craft's judgment, name the craft and
the row in your return.

## Order
1. Read the text cold, before the cards and the Wittgenstein version.
   First as [counterparty]'s counsel looking for the way out of each
   obligation and into each right; then as a tribunal that has only the
   text and the record. Walk each obligation (actor, trigger, act,
   standard, deadline, notice, evidence, exception, consequence); each
   condition on a right (does it bind the other side to act, or only
   open the right?); the definitions and cross-references; the money,
   ownership, survival and termination clauses the text touches, and any
   route around it (a convenience exit, a deletion right, a cap); and the
   document set (exhibits, schedules, signature pages, incorporated
   terms, writings a clause says will be agreed later). Note every reading the words can bear that hurts [party].
2. Run every card assigned to you. Quote the clause with its cite, apply
   the scenario, and state what the text actually produces: Pass, Fail,
   Partial or Blocked. Treat the Evidence column as leads and quote the
   source yourself. Open every authority a law row relies on
   (`legal-authority-research`); governing law unknown, or currentness
   not verifiable from official or free public sources, makes the row
   Blocked. Grade each row as `legal-test-driven-work` sets out
   (skills/legal-test-driven-work/SKILL.md: Fail or Blocked; Dependent
   rows).
3. Write the missing tests. Each hostile reading from step 1 that no card
   covers becomes a new card, REV-1 onward, with its result. Check that
   each mechanism in play has rows from each source that bears on it (the
   law, our objective, their reading), and the suite at least one from
   their reading.
4. Check the Wittgenstein version against the text under
   `legal-wittgenstein` (skills/legal-wittgenstein/SKILL.md: Accuracy;
   Check Before Returning). A mismatch is a finding, cited to the clause.

## Rules
- Apply the work-product checks of `legal-verification-before-completion`
  (skills/legal-verification-before-completion/SKILL.md) to every claim
  about the text.
- A hostile reading stays within the their-reading bounds of
  `legal-test-driven-work` (skills/legal-test-driven-work/writing-legal-tests.md,
  The Three Sources).
- "Could be clearer" is not a Fail. Do not soften a real Fail either.
- Give the verdict the rows support, with no disclaimer
  (`legal-matter-brief`, Delivery order).

## Severity
- Critical: the text defeats the objective or a non-negotiable,
  contradicts an express instruction, or fails a law row resting on
  verified authority; or the work states a fact, clause, definition,
  exhibit content, citation or authority the sources do not contain.
- Important: a Fail, Partial or Blocked row with a material consequence
  short of Critical; a mechanism in play with no row from a source that
  bears on it.
- Minor: changes no outcome in any scenario you ran.
Not everything is Critical. A row failing on a document not supplied is
graded on what happens if that document does not answer it.

## Return
1. First line: the verdict line of `legal-test-driven-work`
   (skills/legal-test-driven-work/SKILL.md, Readiness Verdicts), for your
   run.
2. One table of every row you ran, REV rows included, ranked Critical,
   Important, Minor, then Pass; within each, defects in the text before
   rows that fail only because the file lacks a document ("file lacks
   [item]"):
   ID | Result | Severity | Clause and quote | Scenario -> what the text
   produces | Failure consequence | What turns it to Pass
3. New cards, REV-n, with every field: Source | Rule or objective |
   Scenario | Expected result | Evidence | Failure consequence | Result.
4. Wittgenstein version check: Pass, or each mismatch with its clause.
5. Requests: crafts, documents or sources needed, and the rows each one
   blocks.
Status: DONE | DONE_WITH_CONCERNS | NEEDS_CONTEXT | BLOCKED
```

**Placeholders:** `[party]`, `[counterparty]` and `[next step]` come from the brief. The rows line assigns a slice only when the suite is split by craft; the reviewer who reads the whole text as the other side gets all rows.

## Example Return (illustrative)

We act for the Customer under a SaaS agreement. Objective: the Customer gets all its data back when the agreement ends, before the Supplier may delete it. The drafter added §14.3: "On termination, Supplier will return all Customer Data to Customer within 30 days."

Ready for signing: No; open: 3 Fail, 0 Partial, 0 Blocked, 0 open Pass; deciding rows: DATA-1 (Fail): deletion only after the return; REV-1 (Fail): return on expiry too; REV-2 (Fail): a stated format

| ID | Result | Severity | Clause and quote | Scenario -> what the text produces | Failure consequence | What turns it to Pass |
|---|---|---|---|---|---|---|
| DATA-1 | Fail | Critical | §11.2 "Supplier may delete Customer Data 14 days after termination"; §14.3 "within 30 days" | Customer terminates. Supplier deletes on day 15; the return is not due until day 30 | The contract lets the data be deleted before it must be returned | Deletion under §11.2 only after the §14.3 return, or §14.3 prevails over §11.2 |
| REV-1 | Fail | Critical | §14.3 "On termination"; §13.1 "This Agreement expires at the end of the Initial Term" | The Initial Term ends without renewal. §13.1 calls that expiry, and §14.3 applies only on termination | No return duty on the most common way the agreement ends | "On expiry or termination" |
| REV-2 | Fail | Important | §14.3 "return all Customer Data"; no format stated | Supplier returns a raw database export the Customer cannot load | Data returned in a form the Customer cannot use | A stated format: "[format]" |
| DATA-2 | Pass | | §1.6 "Customer Data means all data Customer or its users upload to the Service" | Customer's uploaded files are within §14.3 | | |

Wittgenstein version check: "When the contract ends, Supplier must give the data back within 30 days" covers expiry, which §14.3 does not (§13.1). Mismatch at §14.3.

Status: DONE. Requests: none.
