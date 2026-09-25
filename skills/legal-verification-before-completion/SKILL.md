---
name: legal-verification-before-completion
description: Use when about to say or imply, in any words, that legal work is done, fixed, resolved, complete, final, all green, in good shape, acceptable, or ready to sign, file, send, or rely on; when asked to write a final summary, closing report, cover note, status update, or sign-off for a review, draft, redline, negotiation, research answer, or argument; when the user declares a matter finished and asks you to confirm it or write it up; when a craft, subagent, or reviewer reports its work done or its tests passing; when about to deliver or hand over legal work product, send it to a client or the other side, or mark a plan task complete; when the text changed after the last test run, even by a tidy-up or renumbering; or when told there is no time or no need to rerun the tests.
---

# Legal Verification Before Completion

## Overview

A clause that passed an hour ago proves the text as it stood an hour ago. Harmonizing, a late fix, a renumbering, or a new fact can break a row that passed, and a summary written from memory says what its author hoped, not what the text does.

**Core principle:** evidence before claims. The evidence is the test table from a fresh run of the whole suite on the final text.

**Violating the letter of this rule is violating the spirit of this rule.**

## The Iron Law

```
NO COMPLETION CLAIM WITHOUT A FRESH RUN OF THE WHOLE SUITE ON THE FINAL TEXT
```

Fresh: after the last change of any kind (a fix, harmonizing, a renumbering, the user's own edit, a new fact or document in the brief), and in the record now, not recalled from an earlier run or session. Whole: every row, not only those that failed or whose clauses changed. A completion claim is any wording that says or implies the work is done or good: "fixed", "addressed", "resolved", "final", "all green", "in good shape", "ready". Paraphrases count. A plan task's status is read off its rows (`executing-legal-work-plans` step 2); marking a task is not a completion claim about the work.

## The Gate

1. **Name the claim and the text.** Which claim (table below), against which text: title, version, date, file. Version unclear: ask. A run on the wrong version is not evidence. No brief, test table, or final text in the record: nothing has been verified. Ask for what is missing, or build it (`legal-matter-brief`, `legal-test-driven-work`), then run.
2. **Check the suite still fits the brief.** Reread the brief and the plan, if any. Every objective, non-negotiable, document, and fact that arrived since has its rows; every mechanism has rows from each source that bears on it (`legal-test-driven-work` step 1); every clause whose money, ownership, or survival outcome changed has its linked-clause rows. A gap gets rows before the run.
3. **Run the whole suite fresh on the final text** through `requesting-legal-review`: a fresh-context opposing reader that drafted none of it. The last whole-suite run from `requesting-legal-review` on the final text is that run if nothing changed after it; otherwise request one. A settled edit needs no reviewer (`requesting-legal-review`, When to Request) and still runs fresh: its one test plus every other place the changed words appear. No subagent tool, dispatch failed, or the user directs no independent run: `requesting-legal-review` (When the Setup Falls Short), with its run labels.
4. **Read every result.** Each row quotes the final text with its cite, or names the authority behind its result. Count Pass, Fail, Partial, Blocked and open Pass; every run-labeled Pass counts as open (`requesting-legal-review`, Run labels). A law row passes only on authority verified current at the relevant date from official or free public sources (`legal-authority-research`); otherwise it is Blocked. A craft's or reviewer's "all pass" is a claim: its rows must quote the text as it now stands, and its fixes must appear in it.
5. **Run the work-product checks** below. Fix any failure before delivery.
6. **Not all Pass?** The work is not "fixed" or "ready". Fail and Partial rows go back to the owning craft (`legal-craft-delegation`, weighed through `receiving-legal-review`); a failure nobody can explain, or one a fix did not flip, goes to `legal-issue-tracing`; each Blocked row names what unblocks it. After any fix, start again at step 1. Open rows do not stop delivery. They stop a false claim.
7. **Only then claim**, in the report below, every line read off the table.

## What Each Claim Needs

| Claim | Requires | Not sufficient |
|---|---|---|
| "Fixed" | The failing row passes on a fresh run, and every other row was rerun | The clause was redrafted |
| "All tests pass" | Whole suite on the final text: no Fail, Partial, Blocked, or open Pass | The run before harmonizing; the rows you touched |
| "Ready to sign" or "acceptable" for a party | Every row Pass, including law rows on verified current authority and rows for exhibits and complete signature blocks (parties, signatories, capacities); execution rows only for a "signed" or "binding" claim | Our objective rows passing; "the big issues are fixed" |
| "Review complete" | Every mechanism in the brief has rows, and every row has a result from the final run | Clauses read through; findings drafted |
| "Redline implements the changes" | Each accepted change is in the final text, and the redline and clean versions match | The change list |
| "The law supports X" | Law row Pass on authority verified current at the relevant date | Memory, a secondary summary, research done before the facts or date moved |
| "Craft or reviewer done" | Its rows are in the table with quoted text, and its fixes appear in the final text | Its report says DONE |

Keep claims separate: one never implies the other.

## Work-Product Checks

These check your own work, not the document. They are not rows. A failing check is fixed before delivery; a claim that cannot be supported is removed or becomes a Blocked row.

- Quote, don't paraphrase, the words a result turns on. Every claim about a document cites its clause (where the user asks for no cites, in the record rather than the delivered text). Words in quotation marks are the document's exact words; mark any emphasis you add. An ellipsis marks each omission and never joins separate sentences or changes which words a qualifier governs. Quote a clause whole when another of its sentences, or a clause it cross-references, changes the result; a fragment keeps its clause's scope words or states them. A paraphrase that drops or adds an operative word ("may" read as "must", a dropped "unless") is an interpretation and is labeled as one. A caption, heading or cover-page label is never read as what its clause does; where another clause (precedence, definitions, headings) could give it effect or deny it, quote that clause and put both readings in a row.
- Every fact has a source: a clause cite, a document, or "user said" for words the user actually used. Anything drawn from them, from what the user said included, is labeled "inferred"; an assumption is labeled "assumed", with what changes if it is wrong; a law the user asked you to assume is labeled as `legal-authority-research` step 2 sets out.
- Nothing invented: no fact, clause, definition, exhibit content, citation, authority, governing law or legal effect the sources lack (`legal-test-driven-work`: Text, not law; Fail or Blocked). Never assume a jurisdiction. Every date meets the Clock rule of `legal-matter-brief`.
- Uncertainty and currentness visible, compactly: each Blocked row names what unblocks it; each law row says "current as of [date]" or that currentness could not be verified.
- The final text as a system: defined terms, cross-references, numbering, precedence, survival. Every bracket, blank, drafting note, or comment left in the text is removed or matched by a Blocked row.
- The Wittgenstein version (`legal-wittgenstein`) is of the final text. Text changed after it was made: refresh the changed lines.
- No confidential fact went into an external search beyond the brief's permission (`legal-authority-research` step 7); nothing from another matter is in the file.

## The Report

Read it off the table. Never draft it before the run or from memory.

```markdown
[Claim]: [Yes | Not yet | No | Complete | Not complete] [run label, if any]   (one line per claim asked or implied; a readiness claim is the verdict line of `legal-test-driven-work`, with no label after it)
Whole suite ([N] rows) run fresh on [document, version, date] by [reviewer | its run label].

[Then the rest in the delivery order of `legal-matter-brief`, from the Clock line on, with the test table as run on the final text.]
```

**Readiness verdict.** As Readiness Verdicts in `legal-test-driven-work`. Never move a Blocked row into a footnote or general caveat. No prose that restates the table.

## Delivery Options

After the report, if the user has not said what to do with the work, present only the options that apply, then wait for the user's choice:

```text
1. Deliver as it stands: [deliverable], the test table, the Wittgenstein version, open rows showing.
2. Fix the Fail and Partial rows through their owning crafts, then rerun this gate.
3. Unblock the Blocked rows: [missing document | fact | client decision | authority research].
4. Turn the open rows into [a markup | negotiation points | a question list] for [recipient].
5. Hold the matter record as it stands and resume later.
```

- Whether, when, and to whom anything goes (client, counterparty, court, registry) is the user's decision. Never send, file, or circulate on your own initiative.
- Anything for the other side follows "To the other side" in `receiving-legal-review`.
- Deliver the final text as a new version. Never overwrite or delete the supplied documents, earlier versions, or the matter record unless the user asks in so many words, and say first what would be lost.
- A chosen option that changes the text sends you back to step 1.

## Red Flags: STOP and Run the Gate

- "Should pass", "probably fixed", "looks right", "I believe everything is addressed"
- Satisfaction before the run: "Done!", "All set", "Everything's fixed"
- The final summary drafted before the final run, or written because the user said "we're done"
- Results copied from an earlier run, a craft's report, or memory
- Only the previously failing rows rerun
- Any change to the text after the last run, however small
- "Ready to sign" with a Fail, Partial, Blocked, or open Pass
- A Blocked row dropped, shown as Pass on assumption, or moved into a caveat
- Counts in the summary that differ from the table
- A self-run reported as independent
- A Wittgenstein version of an earlier draft, or none
- Sending, filing, or deleting anything the user did not choose

## Rationalizations

| Excuse | Reality |
|---|---|
| "The user says we're done; write what they asked." | The user decides when to stop. The table decides what the summary says. Write the true summary from a fresh run. |
| "It's only a summary, not a sign-off." | A summary that says "fixed" or "ready" is the claim. |
| "Everything passed this morning." | That run proved this morning's text. Rerun on the final text. |
| "I only tidied a definition or renumbered." | Definitions and cross-references feed every clause that uses them. Whole suite. |
| "Every craft reported DONE." | A report is a claim. Check its rows quote the text as it now stands and its fixes are in it. |
| "Blocked isn't failed." | Blocked means nobody knows. Ready requires Pass. Show the row with what unblocks it. |
| "A caveat covers the open points." | An open row is reported as a row with its consequence, not folded into boilerplate. |
| "The client will accept that risk." | Then the objective changed. Rewrite the row openly and rerun it; do not drop it. |
| "A No will disappoint them; soften it." | The verdict is derived. State it, then what turns each deciding row to Pass. |
| "The call is in five minutes; no time to rerun." | Split the run and fan it out. |
| "I said 'in good shape', not 'done'." | Different words, same claim. Spirit over letter. |
| "They obviously want it sent." | Delivery is the user's choice. Present the options and wait. |
