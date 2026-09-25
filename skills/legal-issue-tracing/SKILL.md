---
name: legal-issue-tracing
description: Use when a legal test fails and no one can say exactly why; when a fix, redraft, or added wording did not turn a failing test to Pass; when asked to add stronger wording, try another version, or keep redrafting until a test passes; when a test passes or fails unexpectedly, or a result cannot be explained from the text; when a finding, review comment, or conclusion has no clause, fact, or authority behind it; when clauses, definitions, schedules, exhibits, or documents conflict and nothing in the text settles which prevails; when someone says a failing test must be wrong and should be changed; or when each fix makes another test fail.
---

# Legal Issue Tracing

## Overview

A failing test is a symptom: it shows where the text gives the wrong answer, not why. The cause often sits elsewhere: a deadline in a missing exhibit, a definition three clauses away, an unverified rule, a missing fact, or a test built on a misreading. Wording added where the failure shows leaves the cause in place and adds new text with effects of its own.

**Core principle:** find and prove the cause before changing anything: the text, the test, or the finding.

**Violating the letter of this process is violating the spirit of it.**

## The Iron Law

```
NO FIX WITHOUT A TRACED CAUSE
NO CHANGED TEST OR WITHDRAWN FINDING WITHOUT EVIDENCE THAT IT WAS WRONG
```

Until you can finish the sentence "Row [ID] fails because [cause], shown by [quote, fact, or authority]", propose no wording. Use this most when the fix looks obvious, when a fix has already failed, when time is short, and when someone asks for "stronger wording".

## The Process

Finish each step before starting the next.

### 1. Reproduce the failure

Take the row from the test table (`legal-test-driven-work`). Restate its ID, source, scenario, and expected result, then the outcome the text actually gives, with the deciding clause quoted and cited. Run it on the text as it stands now, including any patch already added. The row's scenario is the user's scenario in their words; if you split or reframe it, say so and keep the literal version as the primary row.

- No row yet (a test stated in prose, a finding or comment with no row)? Write it as a test card in the table first.
- Cannot state the actual outcome from quoted text? It is not reproduced. Re-read; do not guess.
- A patch described but not in the supplied text? Ask for its exact words and place, or run the text as supplied and say so. Never reconstruct it.
- The result changed since the last run? Find what changed: a fix, a new document or version, a changed brief, a craft's contribution.

### 2. Trace back to the source

Start at the clause that decides the scenario and ask of each link, "what does this depend on?" Stop at the first link that is missing, conflicting, or unsupported and has no cause further back.

1. **The scenario's facts.** In the brief with a source, or only assumed?
2. **The deciding clause.** Actor, trigger, act, standard, deadline, notice, evidence, exception, consequence. Which element is absent?
3. **Its words.** Defined terms, terms used as if defined, open words ("material", "late", "delivery", "immediately", "within"). Use the Wittgenstein version (`legal-wittgenstein`); if none exists, commission it now. For an open word, note what it attaches to and every reading the text supports, and carry the same readings through steps 3 and 5.
4. **What it points to.** Cross-references, exhibits, schedules, incorporated terms, and the signature page: Supplied or Not supplied on the document map.
5. **What overrides it, and what hangs on it.** Exceptions, precedence, amendments, later documents, caps, survival, clauses keyed to the same event, and every other route either party has to the same end (an exit the other side can use first).
6. **The law behind it.** The governing law the documents actually state, and whether the rule the row relies on is verified and current.
7. **The test itself.** Its source, and whether its expected result comes from the client's objective, verified law, or a real hostile reading.

Write the chain in one line: scenario → deciding text → what it depends on → the break → consequence. Quote or cite every link. Never fill a link with what the document "must" say, general knowledge, or "market practice". "Cannot trace" is a result only with every link checked listed; most untraceable failures are incomplete traces.

Compare with something in the file that passes a similar test, or the same mechanism in another supplied document. List every difference, however small, and claim for the comparison only what its text shows.

Several rows failing? Look first for a shared link: one undefined word or one missing exhibit can fail ten rows. Independent traces can run as parallel subagents; there is no cap.

### 3. Test one hypothesis

State it: "Row [ID] fails because [cause]. If so, supplying [the one missing or corrected element] alone flips the outcome."

Test by reading, not by drafting into the document. Supply only that element as a labeled illustration ("illustration: a Delivery Date of [date]"), rerun the scenario and each of their readings, and change nothing else.

- **Flips on the text alone:** cause confirmed, unless the element illustrated could already sit in a document marked Not supplied: then "probable (text-level), pending [document]".
- **Flips only through how an open word applies, or through a doctrine under law not chosen or not verified:** "probable (text-level)". Name what would confirm it: the clarified term, the verified rule, the row it waits on.
- **Holds:** the hypothesis is wrong or incomplete. Form a new one from the evidence and rerun it on the original text. If causes stack (a missing date and an undefined standard), name each element and what each changes. Never pile guesses on a failed one.
- **Cannot run it** because the answer turns on something nobody has (the exhibit, the fact, verified law): that missing thing is the cause, or part of it. Name it and what unblocks it.

An illustration never enters the document, an Evidence cell, or the Wittgenstein version as fact.

### 4. Classify with evidence

| Cause | What the evidence shows | Result | Fix goes to |
|---|---|---|---|
| Missing fact | The outcome turns on a fact the brief lacks or only assumes | Blocked | The user; update the brief (`legal-matter-brief`) and rerun |
| Missing document | The text relies on an exhibit, schedule, signature page, amendment, or incorporated term marked Not supplied | Fail | Ask for it; if it does not exist, the owning craft drafts it |
| Wrong or unverified rule | The row rests on law not chosen, or not verified as current for the confirmed jurisdiction | Blocked | `legal-authority-research`, once the law is chosen, or the connecting facts that fix the default law are supplied; searches as step 7 there sets out |
| Drafting gap | A mechanism element is absent, a word is undefined or does two jobs, a cross-reference is broken | Fail | The owning craft through `legal-test-driven-work`; open words through `legal-wittgenstein` first |
| Conflict | Two clauses or documents give different answers and nothing settles which prevails | Fail | The craft owning the clause family; across crafts, the parent (`legal-craft-delegation`) |
| Wrong test | The row rests on a wrong fact or authority, misreads the text, claims text that is not there, or expects a result the client never adopted | Row corrected, with the reason, and rerun | The owning craft; only the client changes an objective |

Causes can stack. Record each with its own evidence, the most upstream first.

- No choice of law in the file: `legal-authority-research` step 2 (a Fail row and an applicable-law row; never "nothing to research"). A row a clause could decide on the text is a drafting row (`legal-test-driven-work`, Text, not law).
- A test the text cannot pass is not a wrong test; it is doing its job.
- Text that works as the parties wrote it but gives the client less than its objective is not a drafting gap. It is a negotiated position, and goes to the user.
- A finding with no clause, fact, or authority behind it is traced: supported with a cite, or corrected as a wrong test with the reason.

### 5. Record in the row and hand back

The trace lives in the failing row; keep no separate diagnosis memo, log, or issues list. Lead the reply with the cause in plain words, whether the user's own row passes once the fix is in (and what keeps it open), and the owner; then the working, once, one line per step as in the Example, with the links checked in the row's Evidence cell, not in prose; then deliver as `legal-matter-brief` sets out (Delivery order). The Result cell holds one or two lines:

`Fail. Cause ([class]; confirmed, or probable (text-level) pending [what confirms it]): [chain with cites]. Tried: [patch], cannot flip because [what it cannot do on the text]. Fix at: [source clause or document]. Owner: [craft].`

- **Fix at the source of the cause, not where the failure shows.** The owner drafts it through `legal-test-driven-work` steps 3 to 5 (options where the brief gave no position, rows on the fix's own words and every linked clause, the run label) and refreshes the Wittgenstein version for the proposed text through `legal-wittgenstein`, brackets kept.
- You own the fix (a single-craft matter, or the user asked you for the text)? Draft it in the same reply; the trace leads the reply, it is not where it stops. Where a Not-supplied document may hold the answer, still draft the options, labeled fallbacks; the row stays Fail until the document arrives. The independent run (`requesting-legal-review`) and `legal-verification-before-completion` still follow.
- A new failure the trace uncovered becomes a new row with its own owner. A row whose scenario needs text that does not exist yet (a deadline the fix will set) is tied to that fix and run after it, not scored now.

### 6. When a fix fails

- A patch that did not turn the row to Pass is new, untested text. Before the next attempt, take it out, or test it as a change of its own, with its own rows: their reading may stretch it further than intended. Its exact words not supplied? Write "remove, or supply its exact words so it can be tested"; never delete words you have not seen. Never stack a second patch on it.
- Record what the patch cannot do on the text. For a term of art ("time is of the essence", "condition", "best efforts", "indemnify", "in good faith"), record only a structural absence on the text ("no date in the file to attach to", pending any Not-supplied document that may hold one, as in step 3): never "no effect", and never whether it supplies or satisfies another element (materiality, essentiality, a condition). That, and whether it reaches the client's own obligations, is legal effect: Blocked on the governing-law row and on its exact words, then `legal-authority-research`.
- Return to step 1 with what the failed fix showed.
- **Three failed fixes, or each fix makes another row fail: stop fixing and question the structure.** The mechanism may be wrong for the deal, a document the structure needs may not exist, the tests may conflict (our objective against the law), or the precedence between documents may be wrong. Put it to the user with the evidence: restructure the mechanism, obtain or create the missing document, or the client changes its objective openly in the row. This is not one more failed hypothesis. It is a wrong structure.

## Red Flags: Stop and Return to Step 1

- "Add stronger wording until it passes"
- An intensifier ("notwithstanding anything to the contrary", "for the avoidance of doubt", "in any event") added to push a row to Pass
- A term of art recorded as having "no effect", as supplying or not supplying an element (materiality, a condition), or with its legal effect stated under law nobody chose
- "Confirmed" on a flip that turns on an open word, on unchosen law, or on an element a Not-supplied document may hold
- The user's scenario reworded, split, or demoted without saying so
- Changing the clause where the failure shows without asking what that clause depends on
- A second fix stacked on a failed one
- Wording proposed before "Row [ID] fails because..." is finished
- "The test must be wrong" with no wrong fact, authority, quote, or client decision to show
- An expected result softened, or a row deleted, to get a clean table
- A missing exhibit, deadline, patch, or governing law filled with what it "must" say
- Several changes made at once
- A fourth fix after three failed
- A diagnosis kept anywhere but the row

## Rationalizations

| Excuse | Reality |
|---|---|
| "The fix is obvious." | Obvious fixes go where the failure shows. The cause is often upstream, and tracing a simple failure takes a few lines. |
| "Stronger wording will get it over the line." | Intensifiers do not create a missing deadline, definition, or document. They add text the other side can use. |
| "The term of art changed nothing, so it has no effect." | Record only what it lacks on the text to attach to. Whether it supplies an element (materiality, a condition) turns on its words and the governing law: Blocked, not "no effect". |
| "It flipped, so the cause is confirmed." | Only a flip on the text alone confirms. A flip through an open word or unchosen law is probable (text-level). |
| "The client call is in ten minutes." | Patching until something passes is slower than one trace, and a false Pass is worse than an honest Fail. |
| "Just one more version." | After three failed fixes the structure is the problem. Another wording is the same guess. |
| "The test is wrong; change it." | Only a wrong fact, wrong authority, misread text, or the client's own change of objective makes a test wrong. |
| "The patch is harmless; leave it in." | Untested text is not harmless. Take it out or test it. |
| "They asked for wording, not a diagnosis." | They asked for a Pass. The trace takes a few lines and leads the reply; the wording that follows goes at the source. |

## Example

We act for the Customer; §14 chooses no governing law (row GOV-1, Fail). Row PAY-3: the Customer disputes 10,000 of a 50,000 invoice by notice under §5.3 and pays 40,000 on the due date; expected result: no breach and no termination right. It failed, so the team added "in good faith" to §5.3. It still fails.

- **Reproduce.** §12.1: "Supplier may terminate if any amount remains unpaid 10 days after its due date." The 10,000 is unpaid. Terminable.
- **Trace.** §12.1 → "due date" → §5.2 "All invoices are payable in full within 30 days" → §5.3 "Customer may dispute any invoice by notice within 15 days". The dispute right has no consequence: nothing suspends the due date of the disputed amount.
- **Hypothesis.** Illustration only: "the disputed amount is not due until the dispute is resolved". §5.2 no longer reaches the 10,000, and §12.1 is not triggered. Flips on the text alone: confirmed.
- **The patch.** "In good faith" conditions the right to dispute and does nothing to the due date, so it cannot flip PAY-3; it also gives the Supplier a ground to contest the dispute. What the standard demands in law is Blocked on GOV-1. Take it out, or test it as its own change.
- **Fix, with rows on its own words.** New §5.4: "An amount disputed under Section 5.3 is not due under Section 5.2 until [Option A: the dispute is resolved] [Option B: [number] days after the dispute notice]." PAY-3A (their reading): the Supplier calls its own rejection a resolution, so the 10,000 falls due at once: Fail until "resolved" is tied to agreement or a decision. PAY-3B (their reading): if [number] runs out while the dispute is open, §12.1 reaches the 10,000 again: Blocked, client decision on [number].

Result cell: `Fail. Cause (drafting gap, confirmed): §5.3 gives a dispute no effect on the §5.2 due date, so §12.1 reaches the disputed 10,000. Tried: "in good faith" (§5.3), cannot flip (touches the right to dispute, not the due date); effect in law Blocked on GOV-1; remove or test. Fix at: §5.3 (new §5.4). Owner: commercial contracts craft.`
