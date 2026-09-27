---
name: legal-matter-brief
description: Records whose side we are on, the objective, the facts, the documents, the relevant date and the governing law before any legal work starts. Use when starting any legal matter or any review, redline, drafting, research, negotiation or argument on a legal document; when new facts or documents arrive; or when told to skip the questions and just start.
---

# Legal Matter Brief

## Overview

Every legal test asks a question on someone's behalf. "Does the client get the outcome it needs?" cannot be run until you know who the client is and what it needs, and "does it survive their reading?" cannot be run until you know who "they" are. The brief settles this: whose side, what outcome, which facts, which documents, which date, and what is known about the law. Tests are written from the brief.

**Core rule: no tests, drafts, redlines, or conclusions before the brief exists.**

<HARD-GATE>
Before the brief exists, do not write tests, draft or redline clauses, or state review, research, or argument conclusions. You may, and should, read everything supplied, map the documents (their gaps included), write the Clock line, and commission the Wittgenstein version. They make the questions sharper.

A brief exists when:
- the user agreed it, after your questions or by correcting your draft brief;
- the user told you to proceed without questions, and you wrote the brief anyway with every decisive assumption labeled and shown at the top of your work, in the delivery order below; or
- the user's own request states the side and the objective ("we act for X, we need Y"): those fields are agreed; write the rest as labeled defaults at the top of your work and proceed.

The ceremony scales with the matter. The gate never does.
</HARD-GATE>

## Size the Matter First

Say the size in one line so the user can override it.

- **Settled edit.** The user gives the exact change and no position is left open: fix a cross-reference, insert a figure the user supplies, change "30 days" to "60 days" as instructed. The brief is two lines: document and clause, and what the change does. Skip the questions and the craft fan-out. The instruction fixes the words, so the side need not be known. Still check every other place the changed words or numbers appear, say when the change binds both parties or cuts both ways, and refresh the affected lines of the Wittgenstein version (commission one if none exists).
- **Full brief.** Everything else: any drafting choice, review, redline, negotiation, research, or argument. The fields apply however small the matter. A small matter has short answers, not fewer fields.

When in doubt, write the full brief. The ratchet is one-way: if a "settled" edit turns out to need a choice the user did not make (whether the same words elsewhere change too, how a defined term it touches should read, what a missing document it relies on says), stop and ask about that choice; if the answer opens a position, write the full brief. "Tidy the wording" is never a settled edit: the user has not given the exact change, and choosing new words is a drafting choice.

## Process

1. **Read everything supplied.** Do not ask what the documents already answer.
2. **Map the documents.** For each: name, version and visible date, parties, type, signing status, what it controls, and everything it refers to. Mark each referenced item Supplied or Not supplied: exhibits, schedules, annexes, signature pages, amendments, side letters, incorporated terms or policies, prior versions, and any later writing a term is left to (a choice of law, a price, a date), marked "Unknown whether it exists". Quote the clause that defers a term. Ask for each Not supplied item and name the rows it would unblock. Never fill a gap; text you propose for one goes in brackets, labeled as a proposal. Rows on it are graded as `legal-test-driven-work` sets out (Fail or Blocked). If the user describes a missing item, record that as the user's statement, keep the item Not supplied, and ask for it.
3. **Commission the Wittgenstein version** of each key document (each one the work acts on or relies on) through `legal-wittgenstein`. It uses the document's own party names and takes no side, so it runs before the side is known; run it in a subagent when you can, so it proceeds while you ask, unless the user asked you to hold all work. Its Open points become questions or open points in the brief, and its clarified terms are the vocabulary the tests are written in.
4. **Ask the side first, alone,** if no stated context gives it: whom we act for, and against whom. Without it there is no objective test and no opposing reading. "Neutral" or "both sides" is a valid answer, never a default. For a summary, comparison, or neutral research question, ask it only if the answer changes the output. Your next message after the answer is the draft brief, not another question.
5. **Write the brief** (template below), with a labeled default for every field the user has not answered, most decisive first: objective and the decision it supports, deliverable, non-negotiables and fallbacks, relevant date, governing law and forum where the documents do not settle them, missing facts and whether external search is allowed. Keep facts and assumptions apart, labeled as `legal-verification-before-completion` (Work-Product Checks) sets out.
6. **Get agreement in one reply.** Present the brief and ask the user to agree, correct it, or reply "go" to proceed on the labeled defaults; stop until they do. Ask a separate question only where no default is sensible and the answer changes a test. If they correct it, show the changed fields again.
7. **Hand off.** Settled edit: `legal-test-driven-work` with the one test the edit must pass. Full brief: whether a plan comes first is for `legal-work-planning` (When not to plan); `legal-craft-delegation` chooses and briefs the crafts, which write their tests through `legal-test-driven-work`.

**When the user says proceed without questions,** do steps 1 to 3 and 5 in the same turn. Fill each unanswered field with a labeled assumption or "Unknown" and proceed. If no stated context gives the side:
- **Review, summary, comparison, or research:** assume neutral. Label it at the top, write objective tests for each party, name both opposing readings, and proceed.
- **Redline, drafting choices, negotiation, or argument:** the work must push one way. Ask that single question; the document map and the Wittgenstein version can go in the same message.

**Delivery order.** The record (the brief, one line per field, heading the test table and its verdict line) is always built in full and kept in its own file. The reply is written for the reader the user names, or for the user, in the form and length they asked for; unasked, its length is whatever that reader needs to understand the answer, with a table, a timeline or a diagram where that is plainer than prose, and the working stays in the record. When the user will paste or forward it, the reply is only the text for that reader, within any limit set; anything for the user alone (the verdict, the ask, the paths) goes in the record or above that text, set apart from it, never inside or after it. Plain words, as `legal-wittgenstein` (Accuracy) sets out: one idea per sentence, and each term of art kept explained once. In this order:

1. The answer: first to the question the user asked, in plain words (asked what to push back on, the push-back points); then the verdict line's answer (`legal-test-driven-work`, Readiness Verdicts), what it rests on (defects in the text, or items the file lacks), and whether an independent run has checked it; then the points that decide it, most serious first. Counts and labels stay in the record.
2. The clock: each Clock line cutoff still running, in plain words (omit when none runs).
3. The ask: each document, fact, client decision and bracketed value an open row waits on, and each assumption the answer rests on (omit when there is none).
4. The deliverable. A redline or markup opens with its list of changes, each with its reason, before the full wording.
5. The paths of the record and the Wittgenstein version (no file tool: both follow, under their own headings).

Every open row that bears on the objective reaches the reply in plain words in these parts; rows that share a fix are explained together. Row IDs and run labels stay out of sentences; a clause cite or row ID may close a line in brackets. "Just the clause", "skip the tests" or "just tell me" shortens the reply, never the work: every step still runs and every row is written.

Cells and brief fields take one line each. In a delivery, staffing shows in the table's craft ID prefixes, not in a block. A draft brief sent for agreement starts at the Clock line. Nothing else: no preamble, no prose restating the table beyond those lines, no disclaimer or attorney-review line ("not legal advice", "for attorney review", "consult counsel").

No questions is not no independent run (`requesting-legal-review`).

**When a new fact, document, party, or instruction arrives mid-matter,** update the brief, say which tests it affects, and rerun them.

## The Brief

The brief heads the matter's single record; the test table sits beneath it. Do not keep a separate intake note, ledger, or packet.

```markdown
## Matter brief: [matter name or neutral code]
Size: full | settled edit
Work: [draft | review | summary or comparison | redline or negotiation | research | argument]
Acting for: [party] against [counterparty] | Neutral, both parties tested (stated | assumed)
Objective: [outcome the client needs; the decision this supports]
Non-negotiables / fallbacks: [...] / [...]
Facts: [fact] ([clause cite] | user said)
Assumptions: [assumption]; if wrong: [what changes]
Documents: [map; each gap marked Not supplied]
Relevant date: [date], because [signing | event | expected signing | research]; signing status: [signed (source) | unsigned (source) | Unknown]; in force: [yes (source) | ended (source) | Unknown]
Governing law / forum: [chosen: [law] ([cite]) | none in the file ([cite] silent) | none in the file ([cite] defers it to a later writing, Not supplied, Unknown whether it exists) | Unknown | Assumed at user's request (`legal-authority-research` step 2)]
Deliverable: [form], plus a Wittgenstein version of the final text
Wittgenstein version: [commissioned for ...; open points: ... | none]
Confidentiality: [matter boundary]; external search: [allowed | sanitized only | none]
Open questions: [only those that change a test]
Next: [legal-work-planning | legal-craft-delegation | legal-test-driven-work]

## Test table
| ID | Source | Rule or objective | Scenario | Expected result | Evidence | Failure consequence | Result |
```

One line per field; a field that needs more points to rows, not bullets. "Unknown" is an answer; a blank is not.

## Governing Law and Forum: Work It Out, Never Assume It

- Record what the documents say, with the clause cited. A choice left to a later writing is not in the file: write "none in the file ([cite] defers it to a later writing, Not supplied)", never "not chosen", and map that writing (step 2).
- Never infer a governing law; one the user asks you to assume is labeled as `legal-authority-research` step 2 sets out.
- A country can contain several legal systems. Record the system, not just the country.
- When working out the governing law itself needs legal research, that is a task for `legal-authority-research`, not an assumption.

## Relevant Date and Clocks

The date against which facts and law are tested: the signing date for a signed document, the event date for a dispute, the expected signing date for a draft, the research date for currentness. State which and why. Do not treat a dated document as signed without a signature page or the user saying so, and do not put today's date into the document. Signing status and in-force status are separate facts: record each with its source, or Unknown. For a document that may be in force, record as fact or Unknown what has happened under it (delivered, accepted, invoiced, paid, notices given) and whether amendments or side letters exist, and ask for them. Whether a document binds unsigned, and what makes a change to it bind, is a law row (`legal-test-driven-work`, Text, not law) unless the text sets the formality: quote it.

Work out every time-running clause (renewal cutoff, notice or option window, deadline, limitation, filing) while mapping, and put each on the Clock line: `Clock: [each cutoff, earliest reading first, with arithmetic and weekday; "if in force" where Unknown] ([clause]; [trigger words quoted]); act: [step, form, route]: [what it does and gives up]; let pass: [what follows, against the other exits]; Blocked: client decision ([ID]) | none running`. Other skills carry this line; they never recompute it by rules of their own.

- **Date.** Quote the trigger words; a paraphrase that adds receipt or drops "at least" moves the date. Count from the start date the text states, from signing only where the text runs from signing. Where in-force status is Unknown, the dates hold "if in force"; whether a signing after a date has passed changes it is a law row. Give the date under each reading the words or an unchosen law leave open (sent or received; clear or inclusive days; which day ends the term; business days only where a word supports them), each with its arithmetic, weekday and days from today; mark unverified any reading that rests on an unchosen law's counting or receipt rule. The earliest is "the earliest reading identified", the date to meet if the step is taken. Never call a date safe or a floor.
- **Both paths.** Name the step the client can take alone, with the form and route the notices clause requires. State both paths, taking it and letting the date pass, each with every effect it has, and test each against every other exit in the document and every deadline, payment and ownership it can cut off. A party that can still leave is not locked in: missing the date costs what leaving costs. Call neither path safe, protective or option-preserving. The client decides; the Clock row reads "Blocked: client decision". A redline alongside changes nothing until the other side agrees to it.
- **Live until removed.** A clock stays live until the document is confirmed never in force or ended; never "relevant only if" an open question comes out one way.

## Confidentiality and Matter Isolation

- One brief per matter, under a name or neutral code. Keep its sources and outputs together and apart from other matters.
- Never mix documents or facts from another matter unless the user says they belong together. If a source looks like it belongs to another matter, stop and ask.
- Mark privileged, confidential, and personal information where visible.
- External search: as the brief records it; queries as `legal-authority-research` step 7 sets out.
- Every subagent and craft inherits these limits. Put them in its brief.

## Red Flags

Stop and go back to the brief if:

- you are writing a test, redline, or conclusion and cannot name the party you act for, or a labeled neutral;
- you put a cutoff on the Clock without each reading's arithmetic, without both paths tested against the document's other exits, or called it safe;
- you are describing the contents of a document that is not in the file;
- you have written a governing law that no clause and no user instruction gave you;
- a fact in your work has neither a source nor an "Assumed" label;
- the deliverable has no Wittgenstein version.

## Rationalizations

| Thought | Reality |
|---|---|
| "They said no questions, so no brief." | No questions means labeled assumptions at the top of the work. The brief still exists. |
| "The contract names both parties, so I know our side." | Being named is not being represented. Ask. |
| "A review is neutral, so the side doesn't matter." | A review takes positions for someone. Questions allowed: ask; "neutral" is an answer, never a default. Told not to ask: label it neutral and test both parties. |
| "They said no questions, so I'll ask the side for this review anyway." | Only work that must push one way needs the side. A labeled neutral review answers them now. |
| "The redline deletes the clause, so the deadline is handled." | A redline changes nothing until the other side agrees. Put both paths on the Clock; the client decides. |
| "The user says it's signed, so the map can say signed." | Record it as the user's statement. The signature page stays Not supplied. |
| "It's just wording, skip the process." | Choosing new words is a drafting choice. Only an exact change the user gave is a settled edit. |
| "The Wittgenstein version is extra; they asked for a redline." | It comes with every document task. The tests are written in its clarified terms. |
| "I'll ask everything at once, or each field in turn." / "Once they answer the side, I'll ask about the objective." | The side goes alone, first; a batch buries it. The next message is one draft brief with labeled defaults to agree or correct, not another question round. |
| "I've shown the brief; I'll start while they read it." | Present, then stop until they agree, unless told to proceed. |
| "The brief is agreed; this new fact is minor." | A new fact updates the brief and reruns the tests it touches. |
