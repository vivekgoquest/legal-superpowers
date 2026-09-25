---
name: executing-legal-work-plans
description: Use when an approved or agreed plan for legal work is to be carried out, such as a drafting, review, redline, negotiation, research, or argument plan with numbered tasks, including a plan pasted into the message; when told to execute, run, work through, or finish a legal work plan, or to deliver the finished clauses or document from one; when resuming a partly executed legal plan in a new session or after a checkpoint; when a task in a legal plan waits on a client decision, fact, document, or authority that has not been supplied; when a plan says a task's test must pass; when told the plan is approved, so do not question it, ask anything, stop, or report until the end; or when told the tasks are small wording edits, so the tests, batch reports, or final review can be skipped.
---

# Executing Legal Work Plans

## Overview

Load the plan, review it against the documents, run each task test-first, stop on anything only the client or the file can supply, report after each batch, and verify the integrated text before calling it done.

**Core principle:** a task is done when its rows in the test table say so, not when its steps were followed. A plan that says a test "must Pass" states the expected result. The result comes from the text.

## The Core Rule

```
NO TASK DONE UNTIL ITS ROWS HAVE RESULTS FROM THE TEXT, AND NO DRAFTED ROW PASSES WITHOUT AN INDEPENDENT RUN
NO DECISION, FACT, DOCUMENT, OR LAW FILLED IN TO KEEP THE PLAN MOVING
```

This skill runs the plan; the crafts own the judgments inside it. Tasks owned by different crafts, or independent tasks that can run in parallel, go out through `legal-craft-delegation`, every independent one in the same turn. A task you draft yourself, unless it is a settled edit, runs as its owning craft's labeled pass (`legal-craft-delegation` step 5), with that craft's prefix on its row IDs. No plan yet: `legal-work-planning` first.

## Process

### 1. Load and review the plan

Read the plan, the matter brief, the test table, every document the plan names, and the Wittgenstein version. If there is none, as with most pasted plans, commission it through `legal-wittgenstein` before the first RED. Work on the version the plan names and keep proposed text apart from accepted text. Every craft and subagent inherits the brief's confidentiality limits. Resuming: the plan's checkboxes and the table show where it stands; anything changed since the last run (text, brief, a document) reruns the rows it touches before the next task.

Before Task 1, check:

- **Clocks.** Each window that could run before the plan finishes goes first in your first message, on the brief's Clock line, worked out as `legal-matter-brief` (Relevant Date and Clocks) sets out, and linked by row ID to each task whose deadline or right it can cut off and to the questions that set those deadlines.
- **Brief.** Side, objective, relevant date, governing-law status, signing status, whether external search is allowed. Any missing: `legal-matter-brief` first; short answers, no blanks. A plan's "must Pass" is a stated objective; record it.
- **Tasks.** Each names what it changes (clause cite or named gap), the cards it must pass, and its owning craft when crafts are staffed. A task with no cards gets them before any drafting.
- **Sources.** Every section, defined term, exhibit, and fact a task relies on is in the file and says what the plan assumes. Mark each Not supplied item (`legal-matter-brief` step 2).
- **Decisions.** A task that says "choose", "set", or "decide" something the brief does not settle waits on the client.
- **Expected Passes.** Can each "must Pass" row pass from the file plus drafting? If it needs a value only the client or the deal can supply, or the other side's agreement, say so now.
- **Dependencies.** Which tasks use another's output, share a clause family (termination, survival, definitions), or have law rows waiting on an open governing law.

Raise every concern in one message, each with the task, the problem, and the decision or source that clears it. If the plan no longer fits the documents or the brief, stop there and ask. Concerns that hold some tasks do not hold the rest: start those.

### 2. Execute in batches

A batch runs to the plan's next checkpoint, or until every task left waits on an answer, whichever comes first; its independent tasks go out together. For each task:

1. Mark it in progress. Restate its input, the change it makes, and its cards.
2. Confirm its prerequisites: documents, decisions, verified authority, earlier tasks.
3. Run it through `legal-test-driven-work`: RED on the current text, clause quoted with its cite, before any drafting. A plan that describes the clause does not replace the RED.
4. Law rows rest on authority verified through `legal-authority-research` for a confirmed jurisdiction at the relevant date. Otherwise they are Blocked.
5. Put its rows in the test table, with Fail and Blocked as `legal-test-driven-work` defines them. Task status lives in the plan's checkboxes; results, findings, and decisions live in the table and the brief. Keep no other log.
6. Rerun the earlier rows its change touches. A later task that breaks an earlier Pass reopens the earlier task.

Send a batch that drafted text to an independent run (`requesting-legal-review`) before its report when the user reviews batches as they come; otherwise the whole-suite run at the finish serves, and the batch's tasks stay Drafted until then. A task's status comes from its rows:

- **Done:** every row Pass on the independent run. A review or research task that drafts nothing is Done once the independent run has read every row; its failing rows are the findings.
- **Drafted:** every row an open Pass (`requesting-legal-review`, Run labels).
- **Open:** a Fail, Partial, or Blocked row, naming only what can still defeat it (each decision and who must agree, each missing source, each linked row ID).
- **Held:** waiting on a question before its drafting can start (step 3).

Follow the plan's approach. If the tests show it fails, stop and show the failing rows and the options; never swap in an approach, position, or allocation the plan did not approve. The plan limits what you change, not what you test: every task gets the linked-clause and their-reading rows of `legal-test-driven-work` step 4, whether or not the plan names them; where the words are silent, the row fails on the words, quoted. Complete the mechanism within the task's scope as that skill's step 3 sets out. A defect or fix outside the task's mechanism gets its row, with its fix held as a question with options; a client answer declining the fix closes the dependency as an accepted risk (`legal-test-driven-work`, Readiness Verdicts).

### 3. Stop and ask

Stop the affected task when:

- a decision only the client can make is missing: a choice of law or forum, a commercial value, a fallback, a risk to accept. Inside the task's mechanism, `legal-test-driven-work` step 3 brackets it instead, and the task is Open, not Held;
- a fact or document the task needs is not in the file (an exhibit, a signature page, a date, an amount), including drafting that would rely on what a missing document says;
- the jurisdiction is unknown, or the law behind a row is unverified or its currentness cannot be confirmed from official or free public sources;
- research finds contrary authority or a mandatory rule the plan did not anticipate;
- a row still fails after one fix, or nobody can state why it fails (`legal-issue-tracing`);
- the fix would move a position the brief or plan did not authorize, or reach outside the task's mechanism;
- the task needs confidential facts in an external search the brief does not allow;
- the document version is unclear, task outputs conflict, or you do not understand a task.

**How to ask.** One question per missing decision; its answer updates the brief (`legal-matter-brief`) and reruns the rows it affects.

- Say what it holds (tasks and rows), the options with the rows each would pass and any open position each makes worse, and what the answer changes.
- Where the other side must agree (a new date, amount, or governing law), the client chooses what to propose, and the rows resting on it stay open until it is agreed. Candidate laws: law rows run per candidate through `legal-authority-research`, each labeled.
- The rows stay open as `legal-test-driven-work` sets out.
- A labeled assumption only when the user asks for one, labeled as `legal-verification-before-completion` (Work-Product Checks) sets out.

**Keep going on what is independent.** A task is independent of a held question when neither its text nor its rows turn on the answer: run it. A task whose drafting is independent but whose law rows wait on the answer: draft it and run the other rows; its law rows stay Blocked and the task stays Open.

**Back to step 1** for the affected tasks when the user changes the plan or the brief, a new fact or document arrives, or the approach needs rethinking. Never deviate from the plan silently.

### 4. Report after each batch

Read the report off the table:

```markdown
## Batch [n]: tasks [x-y]
Clock: [the brief's Clock line]; rows it can cut off: [IDs] (while any is live)
Done: [task] ([row IDs] Pass on the independent run)
Drafted: [task] ([row IDs])
Open: [task] ([row IDs]; waiting on [question numbers | row IDs])
Held: [task] ([row IDs]), waiting on [question number]
Text: [clauses drafted in this batch, whatever their task's status]
Next: [batch n+1 | waiting on your answer to ...]
```

Then wait for feedback. Told to run straight through: report and continue, still stopping every held task.

### 5. Finish

1. Run the whole suite on the integrated text, not only the changed clauses. Tasks that pass alone can fail together.
2. Harmonize without moving positions; rerun the affected rows.
3. Commission the Wittgenstein version of the final text (`legal-wittgenstein`).
4. `requesting-legal-review`: a fresh-context opposing reader runs the whole suite on the final text. Only its results close an open Pass and turn a Drafted task into Done. Weigh them with `receiving-legal-review`; each failure goes back to its owning task or craft.
5. `legal-verification-before-completion` before calling any of it done.

Deliver as `legal-matter-brief` sets out (Delivery order); open questions and their options go in the ask. The plan is complete only when every task is Done and the whole suite has run on the final text; "finished" never hides a Blocked row or an open Pass.

## Red Flags: Stop

- Task 1 started before the whole plan was read against the documents
- A window missing from the first message's Clock line, or not linked to the task deadlines it can cut off
- A row marked Pass because the plan said it must Pass, or an Open row said to pass on one condition while another can still defeat it
- A governing law, date, amount, or exhibit content chosen or relied on so a task can finish
- One of the client's options drafted in "for now", or a mechanism element with several reasonable answers drafted as one, unmarked
- Drafted text, a question, or the Wittgenstein version that says what a Not supplied document contains
- A clause drafted from the plan's description with no RED
- A task marked done on the drafter's own Pass, or with a Fail, Partial, or Blocked row
- A linked-clause or their-reading row left out because the plan did not name it
- The whole plan halted for one question other tasks do not depend on
- Batch reports skipped because the user wants everything at once
- A later task changes a definition and earlier rows are not rerun
- A failing approach replaced with one the plan did not approve
- A progress log, issues list, or status memo kept beside the table
- The plan called complete because every task is ticked
- A final deliverable with no Wittgenstein version

## Rationalizations

| Thought | Reality |
|---|---|
| "The plan is approved, so I shouldn't question it." | Approval covers the approach, not the gaps it missed. Check it against the documents before Task 1 and raise what you find in one message. |
| "The plan was pasted in; someone already checked the dates." | A pasted plan may never have had a clock gate. Find every window in the documents and put it first. |
| "The plan says this test must Pass." | That is the expected result. If the file cannot make it Pass, the row says why and what would. |
| "They want finished clauses; asking stalls the plan." | Deliver what is independent, hold what is not, and ask the one question. A chosen answer to the client's question is an invented instruction. |
| "Most clients pick that law; I'll use it and flag it." | Choosing between the client's options is the client's decision. A flagged guess is still a guess in the text. |
| "The missing schedule will set it, or I'll put in a sensible value." | Nobody has seen the schedule, and a value only the client or the deal can supply stays bracketed. Hold it as a question; the rows resting on it stay open. |
| "Once the date is supplied, the row passes." | Only if nothing else can defeat it: the other side's agreement, the notice route, the drafted words. Name every one. |
| "These are small wording tasks; the tests are a formality." | The RED shows whether the change is needed and what it must fix. A one-line task gets a one-line test. |
| "I drafted it and ran the scenarios; the task is done." | That is an open Pass. The task is Drafted until the independent run passes it. |
| "That issue is outside the plan's task." | The plan limits what you change, not what you test. The row goes in the table; its fix is a held question. |
| "One task is blocked, so everything waits." | Stop what depends on the answer. Run what does not, and say which is which. |
| "I'll report once at the end." | A batch report makes a wrong turn cost one batch, not the plan. |
| "Every task is ticked, so the plan is done." | Tasks interact. Run the whole suite on the integrated text, then the opposing reader. |
