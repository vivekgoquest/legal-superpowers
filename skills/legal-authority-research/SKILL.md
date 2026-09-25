---
name: legal-authority-research
description: Use when a legal test, clause position, or answer depends on what the law is or how courts have applied it, including governing or controlling law, statutes, regulations, leading cases, precedent, enforceability, or whether a rule applies in a jurisdiction on a date; when a citation or authority needs checking, or someone asks whether a case or statute is still current or good law; when someone asks you to assume a jurisdiction's law, cite cases from memory, or treat a blog, summary, or unopened citation as authority; or when a search for law could expose confidential matter facts.
---

# Legal Authority Research

## Overview

A legal test is only as good as the law behind it. This skill verifies that law and writes it into the test card: the Evidence column and the Result. It is the evidence role; the craft that owns the test judges what the evidence means for the clause. When the user asked the question directly, you are also the owning craft: answer it, with a verdict.

**Core principle:** an authority you have not opened, checked for currentness, and set against contrary authority is not evidence. It is a lead.

## The Iron Law

```
NO RULE OF LAW ENTERS A TEST UNTIL THE JURISDICTION IS PINPOINTED (OR ASSUMED AT THE USER'S REQUEST, LABELED),
THE AUTHORITY IS OPENED AND PINPOINTED, ITS CURRENTNESS IS CHECKED,
AND CONTRARY AUTHORITY HAS BEEN SOUGHT.
```

Short of that, the row is Blocked, with the reason and what would unblock it. Never pass a law row with a caveat about the law. Blocked means you could not verify it, not that you did not try.

No exceptions: not when the user says "just tell me" or wants no research packet (short output, full research); not for a case you "know"; not because the text sits on an official site; not because no paid database is available.

## When to Use

- A row's rule or expected result depends on law: validity, enforceability, a mandatory rule, a formality, a default rule that fills a gap in the text, what follows if a right is exercised wrongly.
- Someone asks for the governing or controlling law, the leading cases, a statute, or whether an authority is still good law.
- A citation arrives from the user, a counterparty, a draft, or your own memory.

A row that turns on the document text alone passes or fails on the text, without research, and decides only what the text provides. What the law adds is a law row (`legal-test-driven-work`, Text, not law). A text Fail does not end the research: the law rows the answer still depends on run.

## Process

### 1. Frame the question from the test

Take the Rule, Scenario, and Expected result from the test card, in the clarified terms of the document's Wittgenstein version; if there is none yet, commission it (`legal-wittgenstein`) and deliver it with your answer. It and every row state only what the file says; name each part the file lacks as `legal-test-driven-work` (Fail or Blocked) sets out.

Then write the question:

> Under [law], applied by [forum] as of [date], does [rule] give [expected result] on [scenario]?

One question per row, with a concrete expected result ("yes, the termination is valid"; not "the authorities support it"). Split a row that bundles several law questions (notice, cure, and good faith are three rows); a list of research topics is not a test. Give each row its Source (`legal-test-driven-work`). When the question is whether a party can exercise a right, add law rows on what follows if the exercise is wrong (wrongful termination, repudiation) and on any step the law lets the party take to create or perfect the right (a notice fixing a time, a notice to cure), plus the linked-clause and their-reading rows of `legal-test-driven-work` step 4. Research the rows that can change a result before background.

### 2. Pinpoint the jurisdiction

Start from what `legal-matter-brief` recorded about governing law. From the brief, the document, and the facts, record each item with its clause cite or "not stated": legal system and subnational unit; governing-law clause; forum, court, or arbitral seat; subject regime and any mandatory law that can override the parties' choice; place of performance or enforcement, and each party's residence or incorporation, when material; relevant event date; research as-of date. Then give one status:

| Status | Meaning | What you may do |
|---|---|---|
| Confirmed | Every item that could change the result is known | Research and give results |
| Assumed | The user asked for a hypothetical ("assume New York law") | Research it; label every result with the Assumed line |
| Partial | A material item is unknown | Research only what does not change across the unknown; the rest is Blocked |
| Unknown | You could research the wrong law | Block the law-dependent rows; ask for the items that would pin it |

Under Confirmed or Assumed the lane runs. "Not researched" is allowed only for a named inability: no search or fetch tool in this session, the user withheld external search, the source is unreachable, or no free repository covers the decisive court or period.

When the governing-law clause is silent, missing, or leaves the choice to a later written agreement, write two rows: a Fail row for the text (no choice in the file, per `legal-test-driven-work`; a writing the choice is deferred to is Not supplied, per `legal-matter-brief`), and an **applicable law** row, Blocked until the forum is known and its conflict-of-laws rules are researched against the connecting facts. Ask for a written choice of law; failing that, the forum and the connecting facts (each party's residence or incorporation, place of performance).

Never infer governing law from party names, entity type, currency, addresses, drafting style, or where the user sits: none of these chooses a law, and which facts connect a contract to a law is for the forum's conflict rules (the applicable-law row). A country or act the user names is a lead to confirm, unless they are asking you to assume it: then it reads "Assumed at user's request: [law]" on every row it touches. Give formation, interpretation, regulation, remedy, enforcement, tax and data each their own lane and status; whether the contract's choice reaches each one is a research question for that lane. Details: `jurisdiction-and-authority.md`.

### 3. Map the authority

Work out what binds in that system before ranking anything: its sources of law, court hierarchy, which decisions bind whom, and publication and citation rules. Do not import a familiar system's hierarchy.

### 4. Research two tracks

- **Positive law.** The official text in force on the event date and on the as-of date, with the checks in `jurisdiction-and-authority.md`. A consolidated text is not proof that it is current.
- **Case law.** Every decision you rely on, and every one that cuts against you, goes into the precedent coding table below.

Run both unless the system or the question makes one irrelevant, and say why. Independent lanes (a track, a jurisdiction, a row) can go to separate subagents through the parent, with no cap on how many.

### 5. Verify every citation

Open it and match the pinpoint to the proposition. Existence is not support.

| What you have | What it can do |
|---|---|
| Opened; the pinpoint states the proposition; right jurisdiction; current | Evidence |
| Real but not opened | Nothing. At most an unverified lead, labeled so |
| Opened, but it says something else | Nothing for this proposition |
| Another jurisdiction's authority | Persuasive only if that system allows it, labeled so |
| Unpublished, non-precedential, vacated, withdrawn | Only the weight local rules give it, with the rule stated |
| Blog, client alert, summary, sample clause, market practice, AI output, search snippet | A lead to primary authority. Never authority |
| Cannot be found | Not cited. Say it could not be found |

Memory supplies search terms. It never supplies a citation.

### 6. Check currentness and contrary authority, always

No paid research database is available. Use official and free public sources; `free-sources-and-currentness.md` lists them and defines what counts as a currentness check for statutes, regulations, and cases. After finding support, search for exceptions, limiting and contrary decisions, other courts in the hierarchy, and cases with unfavorable facts (more in `jurisdiction-and-authority.md`). The other side will.

Record what you checked, where, and the as-of date. Say "none found in [sources]", never "none exist". If free sources cannot cover it (the decisive court or period is missing, or the appeal status is unknown), say so and mark the row Blocked.

### 7. Search the law, not the matter

External queries carry the legal issue, the clause type, and the jurisdiction. They never carry party names, deal terms, amounts, dates, or the clause's unique wording unless the brief records the user's permission; if the user said nothing, queries are sanitized only. If a sanitized query cannot find what you need, ask before sending anything confidential.

### 8. Write the result into the test card

See "Recording the Result". Every part the file lacks that the verdict depends on goes in the "Not supplied" line, described as `legal-test-driven-work` (Fail or Blocked) sets out. Then hand the judgment to the owning craft, or answer the user with the template below.

## Precedent Coding Table

One row per decision, attached to the test it serves.

| Decision and pinpoint | Court and level | Date | Key facts | Holding | Cuts for or against this test | Subsequent treatment; still good law (as of, sources) | Weight |
|---|---|---|---|---|---|---|---|

- **Holding:** the proposition necessary to the result, in that system's terms. Mark dicta, separate opinions, and commentary as such.
- **Cuts:** measured against this test's expected result, not in the abstract.
- **Weight:** binding on the likely forum, persuasive, non-precedential, or unclear, with the rule that makes it so.
- Keep the adverse rows. A table with only favorable rows is not finished.

The table shows where precedent currently sits; the owning craft judges what that means for the clause. A verified split is evidence, not a gap: code both lines, say which binds the likely forum, if either does, and leave the grade to the craft.

## Recording the Result

The test card and the test table are the matter's single record. Do not start a research memo, source ledger, or claim ledger beside them. Rows use the test table's columns (`legal-test-driven-work`).

Grade every row by `legal-test-driven-work`. This skill adds two things:

- **Evidence cell:** `[Proposition] · [Authority, pinpoint, link] · Current as of [date]: [what was checked, where] · Contrary: [authority, or "none found in (sources)"] · Jurisdiction: [Confirmed | Assumed at user's request: [law]]`
- **Blocked for law:** jurisdiction not pinned, authority not opened, or currentness not verifiable from free sources. Name what would unblock it.

## Answering the User

When the user asked directly, answer with this template, then deliver as `legal-matter-brief` sets out (Delivery order): "just tell me", "no research packet" or "no caveats" asks for the answer alone, which holds the rows and the precedent table back; the template lines stay. Each line is mandatory whenever it applies; "no caveats" removes none of them.

```text
[Verdict, read off the deciding row, citing the clause or authority. Deciding row Fail on the text: "Not on the text in the file: [what the trigger needs, cited]; [what the main text provides] ([part] Not supplied)." Resting on the text alone: begin "Under the text,". Then each other route to the same end, from the text or a law row, with its clause or row ID and that row's result; dates as the Clock rule of `legal-matter-brief` sets out.]
Jurisdiction: [Confirmed: law, source | Assumed at user's request: X; what the document says about governing law; "researched: authority, pinpoint" or "not researched: [named inability from step 2]" | Unknown: the items that would pin it].
Not supplied: [each part the file lacks that the verdict depends on, described only by what the main text says of it].
Blocked: [row IDs grouped by what unblocks them; one line per blocker.]
```

State each point once; notes point to rows instead of restating them. Under Unknown status the Jurisdiction line replaces the pinpoint table. Omit an empty precedent table (the Blocked line says why). If no side is stated, label objective rows "Our objective (assumed)". A longer research memo only if asked, and still derived from the table.

## Red Flags: STOP

- A citation in your output that you did not open in this session
- "Under [law]" with no jurisdiction status beside it
- Governing law picked from names, entity type, currency, addresses, or style, or from the forum without its conflict-of-laws rules
- Confirmed or Assumed law marked "not researched" while search tools were available, or with no named inability
- "Still good law" with no as-of date and no sources named
- A precedent table with only favorable rows
- A blog, alert, summary, or snippet in the Evidence column
- A party name, amount, or unique clause wording in a search query without permission
- A memo, source list, or ledger outside the test table, or rows with improvised columns
- Pass on a row whose law is only partly verified
- A verdict leading "yes" or "under the text, yes" when the deciding row is Fail
- A verdict line that states law from a Blocked row ("only if" and "only when" limits included), or "no other right", "the only route" or "no remedy" with no verified authority behind it
- A right's exercise tested with no their-reading row or no row on a wrong exercise
- A general disclaimer where a specific Blocked reason belongs

All of these mean: go back to the step you skipped.

## Rationalizations

| Excuse | Reality |
|---|---|
| "I know this case." | Memory misremembers names, holdings, and treatment. Open it or it is a lead. |
| "No paid citator, so skip currentness, or add a caveat." | Run the free check and name the sources. If it cannot cover the case, the row is Blocked with what unblocks it. A caveat is not a result. |
| "LLC, Inc., and US dollars: it is US law." | None of these chooses a governing law. Read the clause; if it is silent, the jurisdiction is Unknown. |
| "The user said assume New York law, so drop the label." | The assumption is allowed. The label, with its researched or named-inability clause, is what makes the answer true. |
| "The user said no research packet, or wanted it short, so I skipped research." | Short output, full research. The packet is what you leave out of the answer, not the work behind it. |
| "I framed the questions; running them can wait." | Blocked means you could not verify it, not that you did not try. Run them, or name the inability. |
| "The user wants no caveats." | Verdict first. The Jurisdiction, Not supplied, and Blocked lines are one line each and are never dropped. |
| "I found support; contrary search is overkill." | The other side runs that search. An unseen adverse case is a failing test you did not write. |
| "A leading firm's alert says so." | Secondary. Follow it to the primary authority and cite that. |
| "Same facts, so it binds." | Weight comes from court, hierarchy, and publication status, not factual similarity. |
| "Party names will find better cases." | Law is found by issue, not by parties. Confidential facts stay out unless allowed. |
| "It fails on the text, so the law is moot." | The text decides what the text provides. The law rows the answer still depends on (a right the law adds, the risk of a wrong exercise) still run. Research nothing else. |

## Integration

`legal-test-driven-work` sends a test here when its rule depends on law and owns the card and the grading. `legal-craft-delegation` staffs research lanes; results go back to the owning craft. `legal-verification-before-completion` rechecks every Evidence cell against this skill before delivery.
