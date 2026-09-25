---
name: requesting-legal-review
description: Use when drafted, redlined, or revised legal text, a document review, a readiness verdict, or a legal argument is about to be delivered, sent to the other side, signed, filed, or relied on; when a craft or plan task has finished drafting or fixing legal text; when a test table holds a Pass labeled drafter, provisional, or self-run; when the drafter, a craft, a colleague, or the user says the work is already checked and fine; when asked for an independent, second-opinion, fresh-eyes, or opposing-counsel read; when told to get it reviewed quickly, to have the reviewer just confirm a green table, or to recheck only the changed rows; when text has changed since an earlier review; or when no subagent is available and rereading your own draft seems enough.
---

# Requesting Legal Review

## Overview

No machine runs a legal test. A counterparty or a court applies it by reading, without the drafter's reasoning. The closest thing to a test runner is an independent reader with fresh context who applies the tests adversarially. This skill gets that reader.

The reviewer receives the brief, the test table, the text and the sources, never the drafter's reasoning. It reruns the whole suite, reads the text as the other side would, writes the tests the suite missed, and returns results ranked Critical, Important and Minor, each tied to a test ID and a clause.

**Core principle:** the other side will read the text without your reasoning. So does the reviewer.

## The Iron Law

```
THE DRAFTER NEVER GRADES ITS OWN WORK
NO FINAL PASS UNTIL A FRESH-CONTEXT READER HAS RUN THE WHOLE SUITE
```

"The drafter" is anyone who wrote or chose the words under review: you, a craft, or a user who drafted the text or has already checked it. A drafter's check, however careful, is a claim, not a result.

## When to Request

- Before legal text, a review, a readiness verdict or an argument is delivered, sent to the other side, signed, filed or relied on.
- After each batch the user reviews as it comes (`executing-legal-work-plans`). There is no run per craft or task: their Passes stay open until the whole-suite run.
- After every fix round (step 7).

Size never waives the run; it sizes it. A one-clause redline gets one reviewer and a short suite, which takes minutes. Only a settled edit (`legal-matter-brief`) needs no reviewer: the user chose the exact words, and whether they are entered everywhere is a check for `legal-verification-before-completion`.

## Process

1. **Assemble the package:** the matter brief (`legal-matter-brief`); the test table (`legal-test-driven-work`); the text under review and, for a redline, the version it changes; every supplied source; every item the brief's document map marks Not supplied (`legal-matter-brief` step 2); the Wittgenstein version of the text (`legal-wittgenstein`). Missing a piece? Make it first. No brief: `legal-matter-brief` first. No test table, for example because the user drafted the text: write and run the cards from the brief (see "Verdicts While the Run Is Out"), with a their-reading card for each condition on a right: does it bind the other side to act, or only open the right? No Wittgenstein version: commission it now; it runs while you prepare the rest.
2. **Strip the drafter out.** Write the reviewer's copy of the cards to its own file with the Result column blank; the matter's table keeps its results. Keep each card's ID, Source, Rule or objective, Scenario, Expected result, Evidence and Failure consequence. Leave out drafting notes, craft reasons, session history, self-assessments ("I checked it, it's fine") and any answer you expect. **A worry is a test:** write it as a card, never as a hint.
3. **Choose the reviewers,** each a fresh-context subagent that drafted none of the text under review. One reviewer reads the whole text as the other side and runs the whole suite. Each specialist craft with rows in the suite (tax, data protection, service levels), even one row, also gets its own fresh reviewer from that craft for those rows, never the one that drafted them. Too large for one careful pass: split the rows by owning craft and give every reviewer the whole text; the whole-text reader stays, for attacks that cross clauses. No cap on reviewers. Reviewers dispatch no one; they name the craft they need, and the parent staffs it (`legal-craft-delegation`).
4. **Dispatch** with [reviewer-brief.md](reviewer-brief.md): all reviewers in the same turn, documents as files or paths ("attached" is not a path). Say "dispatched" only after the dispatch call returns. Otherwise say "brief written, not sent ([no subagent tool | dispatch failed: error]): [brief path]; cards: [path]" and use the fallback below.
5. **Record the return in the test table.** The Result column shows the independent result. Where the drafter recorded a different result on a row it actually ran, show both: "Fail, Critical (reviewer; drafter had Pass): ...". A blanket "checked, it's fine" is not a row result; note it once as "Drafter's claim: checked, fine (no row results)". New tests join as REV-n rows, and the parent assigns each an owning craft. Keep each severity as returned (reviewer-brief.md, Severity), except that a false green (a row recorded Pass that the run finds Fail or Blocked on a point the objective depends on) is raised to Critical. Do not merge, soften or drop a result on the way in. The table is the report: no findings memo beside it.
6. **Weigh and route.** Each result goes through `receiving-legal-review`, where it is weighed, not argued away here. Accepted failures go back to the owning craft. A cause nobody can explain goes to `legal-issue-tracing`; an authority gap goes to `legal-authority-research`.
7. **Rerun after fixes.** Between fix rounds, a fresh reviewer, never the craft that made the fix, gets the failed rows, every row whose clause changed or links to a changed clause, and a their-reading pass over the changed text. Repeat until a run adds no new Critical or Important result. Blocked rows waiting on the user (a document, a client decision) carry forward and do not count as new. The last run, before `legal-verification-before-completion`, is the whole suite on the final text with the Result column blank. The deliverable carries the test table and the Wittgenstein version of the final text. This last run is the fresh run `legal-verification-before-completion` needs; it is repeated only if the text or the brief changed after it.

## Verdicts While the Run Is Out

The reviewer's run is the independent run, not the first run. Run every row on the text now and record each result as `legal-test-driven-work` defines it, a Pass with its run label (below). "Not run" is not a result. None of these results goes into the reviewer's copy.

**Run labels.** Until the independent run returns, every Pass carries the label true now and is an open Pass, counted as open in every open-rows list and verdict, in every output mode; Fail, Partial and Blocked carry none. "Pass (drafter; independent run pending)" on text you drafted; "Pass (provisional; independent run pending)" on text you did not; "Pass (self-run, not independent)" after the no-subagent fallback; "Pass (drafter's run only; user direction)", naming who directed it. A label every Pass shares goes once, on the verdict line and the Result column heading. A delivery says "pending" only for a run whose dispatch call returned; otherwise dispatch it, or use the fallback.

Anyone may report a Fail; only an independent run reports a final Pass. So give the verdict line now (`legal-test-driven-work`, Readiness Verdicts); a Yes waits for the run. A Wittgenstein version delivered before an independent check (reviewer brief, Order step 4) is headed "unchecked"; a self-run check does not lift it, and any mismatch it finds is fixed before delivery. Deliver as `legal-matter-brief` sets out (Delivery order), adding the reviewer-brief and card paths and the Wittgenstein check result (Pass, or each mismatch fixed, with its clause); the reviewer brief stays in its file.

## When the Setup Falls Short

- **No subagent tool, or dispatch failed:** write the filled reviewer brief and the blank-Result cards to files (no file tool: inline, under the paths they would have) and give the paths, so a fresh session can give the independent run. In the same turn, rerun the brief's Order from those files as a separate pass (same context, so not independent) and give its Return, the Wittgenstein check included. Record it as step 5 records a return, showing both results where they differ from your first run. Never call it independent, and never leave the only run to the user.
- **The user directs no independent run:** say in one line what the run would test, then follow the direction. Label the results as Run labels sets out; the rows stay open.
- **"Quickly":** one reviewer, dispatched now, in parallel with the Wittgenstein version; if that version arrives after dispatch, check it in a small separate run. Nothing can be dispatched? Apply the no-subagent rule in the same turn. Speed changes how the run happens, not whether it happens.

## Red Flags: Stop and Dispatch

- Your own run offered as the review because you know the clause best
- A row left unrun, or marked "Not run", because the reviewer will run it
- Sending the reviewer your notes, reasons, recorded results or the finding you expect
- A brief that asks the reviewer to confirm, or a first or last run limited to the changed rows
- A craft reviewing text it drafted
- The user's own check treated as the independent run, or as results on rows nobody ran
- "Looks fine" accepted without every row rerun
- A finding with no test ID or no quoted clause
- A document the brief's map marks Not supplied missing from the package, or an open row's blocker missing from the ask
- Findings kept in a memo, or softened on the way into the table
- A self-run reported as independent, or a review called sent with no returned dispatch call
- A Yes, or any final Pass, before the independent run returns

## Rationalizations

| Excuse | Reality |
|---|---|
| "I've checked it myself and it's fine." | That is the drafter grading its own work: a claim, not a row result. The run exists because the drafter cannot see what the drafter missed. |
| "It's one sentence." | One sentence, one reviewer, minutes. One term the file never pins down can decide whether the right exists at all. |
| "Give it our reasoning so it goes faster." | Reasoning anchors the reviewer to your reading. The other side reads without it. |
| "Send the green table; it only needs to confirm." | A reviewer handed results confirms them. Blank the Result column and let it run the tests. |
| "Only the changed rows need rerunning." | A change breaks rows elsewhere through definitions, cross-references and survival. The first run and the last run cover the whole suite; scoped reruns only between fix rounds. |
| "The craft that drafted it knows it best." | That is why it cannot see the gap. Use a fresh reviewer from the same craft. |
| "No subagents here, so I'll reread it with fresh eyes." | The same context is not fresh. Write the brief for a fresh session and run the labeled "self-run, not independent" pass now. |
| "The reviewer will run those rows." | Its run is the second, independent one. The file already answers them: run them now, with their run labels, and let the Fails decide the verdict. |
| "No verdict until the review is back." | A No the file already shows needs no reviewer. Give it now, with the deciding rows. Only a Yes waits. |
| "The reviewer will just nitpick." | The severity rules keep nitpicks Minor. An unsupported Critical is pushed back in `receiving-legal-review`, not avoided here. |
| "There is no time for a review." | Parallel dispatch takes minutes. A hostile reading missed now is found later by the other side. |
