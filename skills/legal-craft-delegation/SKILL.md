---
name: legal-craft-delegation
description: Use when legal work on a document, deal, or dispute calls for substantive judgment (reviewing, drafting, redlining, negotiating, researching, or taking a position) and it is not yet settled who owns each decision; when deciding which specialists, experts, or subagents a matter needs; when asked to staff, brief, or coordinate a team of reviewers; when told to use one generalist, fewer specialists, or no specialists to save time or cost, or to staff only for the clauses or topics the document mentions; when a clause, a missing topic, or a fact falls outside the current reviewer's expertise, including non-legal fields such as tax, accounting, engineering, or insurance; or when contributions from several specialists conflict or need assembling into one result.
---

# Legal Craft Delegation

## Overview

Legal work goes wrong where a decision was made by someone who would not answer for it: a generalist settling a tax point, a drafter grading its own clause, a researcher's case summary passed off as the conclusion.

**Core principle:** the profession that would answer for a decision owns it. The parent staffs, briefs, coordinates and assembles. It does not make a craft's judgment for it.

No list of experts is stored anywhere in this package. The document and the brief decide which crafts are needed, every time.

## The Core Rule

```
NO SUBSTANTIVE LEGAL JUDGMENT WITHOUT A NAMED CRAFT OWNER
```

Before forming an interpretation, evaluation, recommendation, position or draft, staff the craft that owns it. Extracting quotes, summarizing or checking citations does not fill that seat.

**Solo route.** A settled edit (`legal-matter-brief`) runs solo.

**No cap.** Staff every craft the document needs, even 20 or more. Cost, time and head-count never remove a needed craft. Save cost through model choice and by batching small same-shape work within one craft, never by dropping a craft. Equally, staff nothing that no clause, gap or fact triggers.

## Process

### 1. Start from the brief

Work from the matter brief (`legal-matter-brief`): whose side, the objective, the facts, the documents and their signing status, the relevant date, what is known about governing law, whether confidential facts may go into external searches, and the Wittgenstein version of the document (`legal-wittgenstein`). No brief: `legal-matter-brief` first. If the governing law is unknown, every craft is told so.

Put the brief's Clock line (`legal-matter-brief`) at the top of the staffing reply and in every craft brief.

### 2. Discover the crafts

Walk the document clause by clause, then topic by topic, and ask of each consequential decision: **which profession would answer for the quality of this decision if it went wrong?**

Triggers:

- **Presence:** a clause whose effect turns on a specialist's judgment (IP assignment, royalty withholding, service-level metrics, security interest).
- **Absence:** a topic the deal needs that the document omits, where you can name what the omission costs the client: no data clause in a data-heavy deal, no liability cap, no dispute forum, a missing exhibit that holds the scope.
- **Facts:** cross-border parties, a regulated sector, a listed company, a consumer on the other side.
- **Their reading:** where a counterparty or court would attack the text, the craft that would have to defend it.

Crafts can be non-legal: tax accountant, engineer for service levels, actuary, insurance broker, valuer, sector compliance specialist.

Keep interacting decisions together. One craft owns a clause family that moves together (cap, exclusions, indemnity), even across documents. A craft for a linked point (the insurance behind the indemnity) may be separate, but depends on the accepted allocation. A craft keeps every decision its profession routinely answers for in this kind of document. Staff a specialist only for a call that profession would not answer for, never merely because a specialism exists. Split by accountability, never by page range or heading.

### 3. Write the staffing table

Put it in the plan, when there is one; a reply about staffing shows the table; a delivery shows staffing as `legal-matter-brief` (Delivery order) sets out. Dispatch in the same turn unless the user asked to approve it first, directed fewer crafts (see below), the brief has an open question that changes the staffing, or the work needs a plan (`legal-work-planning`, When not to plan), whose executor dispatches the crafts.

| Craft | Decisions it owns | Finished contribution | Trigger (clause cite, named gap, or brief fact) | Needs from |
|---|---|---|---|---|

- Every row has a trigger: a clause cite, a named gap, or a fact from the brief. Label an inference as `legal-verification-before-completion` sets out. An inferred trigger staffs a craft only if its decisions are open whatever the fact turns out to be; otherwise list the craft under "Not staffed" with the fact that would trigger it. No trigger, no row.
- Every consequential decision sits in exactly one row, under whatever label ("use of the data" and "instructions for the data" are one decision). A decision in no row is unowned; a decision in two rows is contested. Fix both before dispatch. A choice only the client can make (which law to propose, what to concede) is no craft's: the craft sets out the options and their tests, and the parent puts the choice to the client.
- Evidence roles get their own rows and own no judgment. A precedent researcher (`legal-authority-research`) finds and codes cases (court, date, facts, holding, which way it cuts, whether it is still good law); the owning craft decides what they mean. Staff a researcher for a named legal system: the governing law, a law assumed at the user's request, or a candidate law a craft is testing. "Needs from" has no cycles: the researcher needs only the owning craft's question, written into its brief.
- This is the matter's single staffing list. Only the parent changes it.

### 4. Brief each craft

Use [craft-brief.md](craft-brief.md). Each brief carries the goal, the evidence or access to it, the constraints, the authority and the completion criteria, and asks for the craft's tests, their results and its fixes. One craft per brief. Pass documents as files or paths, not session history. State the client's objective, never the answer you expect, and no rule of law as settled unless verified under `legal-authority-research`: name the open question instead ("which tax rules reach the fee is open").

### 5. Dispatch

- Use the environment's subagent tool, one dispatch per craft. Send every independent craft in the same turn so they run in parallel.
- No subagent tool, or the user rules them out: run each craft as a separate labeled pass ("Pass: tax accountant") that starts from its brief alone and records its contribution before the next pass begins.
- A dependent craft waits for the accepted contribution it needs, passed on as a file.
- Crafts never dispatch their own specialists. A craft that needs one names the craft, the decision and the trigger in its return; the parent adds the row and dispatches it.
- **Fan-out rounds:** after each round, add every craft the returns show is needed and dispatch again. Stop when a round adds no new craft.

### 6. Handle returns

- **DONE:** check that every claim about the document quotes or cites the clause and every test has a result, then accept.
- **DONE_WITH_CONCERNS:** read the concerns. Resolve concerns about correctness or scope before accepting.
- **NEEDS_CONTEXT:** supply the missing source or fact, or record it Not supplied (`legal-matter-brief` step 2), and re-dispatch. Never write stand-in contents; the rows it leaves open are graded as `legal-test-driven-work` sets out (Fail or Blocked) and reported as their own group ("the file lacks it"), apart from defects in the text.
- **BLOCKED:** change something (context, scope, a split, a stronger model). Never resend the same brief unchanged.

Findings are failing tests. They go into the matter's test table (`legal-test-driven-work`), each tagged with its owning craft. Keep no separate findings list; a craft's contribution file is a working input, merged into the table and not kept as a record.

### 7. Assemble

- Build the result from the crafts' decisions and fixes. Do not re-decide a craft's judgment or redraft its fix.
- A change needed inside a craft's area goes back to that craft.
- When crafts conflict (the privacy craft wants uncapped liability for data breach; the commercial craft wants one cap), decide only where the brief's objective settles it: state the reason, record the override on the affected tests, and tell the overridden craft. Otherwise the row is Blocked: client decision, with the options (`legal-test-driven-work` step 3).
- Harmonize definitions, cross-references and survival without moving any craft's position. Rerun the affected tests.
- Commission the Wittgenstein version of the final text (`legal-wittgenstein`).

### 8. Verify

A fresh-context reviewer (`requesting-legal-review`) runs the whole suite against the final text as the opposing reader. Failures go back to the owning craft (`receiving-legal-review`). Finish with `legal-verification-before-completion`. The report is read off the test table.

## When Told to Staff Fewer Crafts

- **Fewer crafts** (one generalist, fewer specialists to save cost or time, only the clauses written): reply with the staffing table, marking each row the direction would drop, and one line: cost and speed never drop a needed craft (save through model choice), and absence is a trigger. If no matter brief exists, draft it; otherwise point to it. Once the brief exists, dispatch the rows the direction keeps; hold the dropped rows until the user replies. If they still direct fewer crafts, follow it: the generalist owns every decision its profession routinely answers for on this document, and rows that need a dropped craft's judgment read as `legal-test-driven-work` sets out (Blocked: craft not dispatched (user direction)); rows the text alone decides keep their Pass or Fail. The gap stays in the report.
- **"No subagents":** that is a direction about tooling, not about crafts. Run each craft as a labeled pass.

## Red Flags: Stop and Restaff

- A generalist deciding a call its profession would not answer for.
- Staffing from the clause headings only, with no check for what is missing.
- A past-dated document of Unknown signing status briefed as an unsigned draft.
- A Clock date recomputed by rules other than `legal-matter-brief`'s.
- A row with no trigger, or a decision with no row.
- The parent forming its own view on a craft's question "to save a round".
- Dropping or merging crafts to cut cost, time or subagent count.
- A craft returning comments without tests, results and fixes.
- A craft dispatching its own specialist.
- A researcher's case summary used as the conclusion.
- Craft outputs pasted together and called an assembled result.
- A drafter grading its own clause.
- A brief that tells the craft what answer to reach.

## Rationalizations

| Excuse | Reality |
|---|---|
| "One generalist is cheaper." | A generalist deciding a tax or data point answers for a call outside its craft. Save through model choice, not by dropping crafts. |
| "It's a short agreement; I'll review it myself." | Open decisions trigger crafts, not length. Short documents often need more crafts because of what they leave out. |
| "Twenty subagents is excessive." | There is no cap. The count follows the triggers. If a row cites a trigger, it stays. |
| "It doesn't mention data, so no privacy craft." | Absence is a trigger. The omitted clause is often where the client is most exposed. |
| "The researcher already read the cases; its summary is enough." | Evidence and judgment stay separate. The owning craft decides what the cases mean. |
| "I'll fix this clause myself; sending it back is overhead." | A parent fix skips the accountable craft and its tests. Return it to the owner. |
| "The crafts agree, so no review is needed." | Agreement is not a test result. The fresh-context reviewer runs the suite. |
| "The user wants it fast." | Parallel dispatch is fast. Speed changes how crafts run, not whether they run. |

## Example Staffing Table (illustrative)

Trademark license for a beverage brand, acting for the licensor, governing law stated in the license:

| Craft | Decisions it owns | Finished contribution | Trigger | Needs from |
|---|---|---|---|---|
| Trademark lawyer | Scope of licensed marks; strength of quality control; termination for misuse | Tests and fixes for grant and quality control | Grant clause; quality control "to reasonable standards" | Wittgenstein version |
| Tax accountant | Royalty withholding, gross-up, invoicing | Tests and fixes for royalty payment | Royalty payable by a foreign licensee | None |
| Food regulatory specialist | Labeling and recall responsibility | Tests and a recall clause | Gap: no recall or labeling clause for a consumable product | Trademark lawyer's quality standard |
| Commercial contracts lawyer | Term, renewal, royalty audit, termination mechanics; cap, exclusions and indemnity | Tests and fixes for those clauses | Term, termination and indemnity clauses | Tax accountant's royalty fix |
| Insurance broker | Product liability cover and additional-insured status | Tests and an insurance clause | Gap: indemnity with no insurance behind it | Commercial lawyer's accepted cap and indemnity |
| Precedent researcher (evidence only) | None: finds and codes cases on weak quality control in the governing law | Coded case table | Quality control turns on how courts treat loose licensing | Governing law from the brief |
