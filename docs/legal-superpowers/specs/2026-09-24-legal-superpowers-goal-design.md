# Legal Superpowers: Goal

**Date:** 2026-09-24
**Status:** Accepted by the user on 2026-09-24
**Supersedes:** the goal, audience, and delivery sections of `2026-05-11-generic-legal-tdd-framework-design.md` and `2026-05-11-legal-authority-research-design.md`. Those files stay as history.

## Goal

Legal Superpowers is a skills-only package that makes legal work test-driven. Before drafting, reviewing, redlining, or arguing, the agent writes the tests the work must pass: the law, the client's objective, and the other side's reading. It then works until the tests pass. Specialist subagents, chosen at runtime from the document itself, own the judgments in their craft.

## The core insight

Legal arguments are already test-driven. People ask whether an argument "stands the test" of a law. The rule is the test, the argument or clause is the code, and the facts are the fixtures.

Superpowers made software work reliable by forcing tests before code, fresh subagents per task, independent review, and evidence before any claim of completion. This package applies the same recipes to legal work.

## What a test is

A test is a short "what if" question with the answer the work must give.

| Field | Meaning |
|---|---|
| Source | Whose test it is: **the law** (valid, enforceable, compliant), **our objective** (the client gets the outcome it needs), or **their reading** (it survives the most hostile reading a counterparty or court could give it) |
| Rule or objective | What must hold |
| Scenario | The facts or event that trigger it |
| Expected result | The outcome the text must produce |
| Evidence | Document text, instruction, fact, or verified authority |
| Failure consequence | What goes wrong if it fails |
| Result | Pass, Fail, Partial, or Blocked, with the text or authority behind it |

Example from `tests/legal-superpowers/fixtures/generic-service-agreement.md`:

- **Test:** The provider delivers the report 10 days late. Can the client end the contract immediately? Needed answer: yes.
- **Current text:** Section 6 lets the client terminate if the provider "misses a material deadline". But the agreement sets no delivery deadline at all (the services sit in Exhibit A, which is not attached), and it defines no deadline as material. **Fail:** the test cannot even be run until "deadline" is pinned down.
- **Fix:** set the deadlines and state which are material. **Pass.** Rerun every other test.

"Test" means three different things in this repo. Only the first is the product:

1. **Legal tests:** does the work pass the law, the objective, and their reading? These are the product.
2. **Work-product checks:** did the agent cite sources and avoid inventing facts? These belong to verification before completion.
3. **Skill pressure tests:** does a skill make an agent behave under pressure? These belong to skill development.

## The loop

1. **Brief.** Record whose side we are on, the objective, the facts, the documents, the relevant date, and what is known about governing law.
2. **Choose the crafts.** See "Delegation by craft" below.
3. **Write the tests.** Each craft writes the tests for its area, then runs them on the current text and shows where it fails (RED).
4. **Fix.** Draft the smallest complete change that passes (GREEN). Correct the drafting rather than weakening an accepted test.
5. **Harmonize.** Align definitions, cross-references, and survival without moving any position (REFACTOR). Rerun the affected tests.
6. **Verify.** A fresh-context reviewer (the opposing reader) runs the whole suite against the final text. Failures go back to the owning craft. Whoever drafted a clause never grades it.
7. **Report.** State which tests pass, fail, are partial, or are blocked, and why.

## Where law differs from software, and what the package adds

- **No machine runs a legal test.** A court or counterparty applies it by reading. The closest equivalent to an automatic test runner is an independent agent with fresh context that applies the tests adversarially.
- **The test has to be found, and it can be wrong.** Law can be outdated, overruled, or from the wrong jurisdiction. Authority research verifies the law behind a test before the test is used. A test resting on unverified law is a research task, not a test.
- **Legal tests use open-ended words** such as "material", "reasonable", "notice", and "delivery". `legal-wittgenstein` clarifies how the document itself uses a term, so a test can be decided before it is run.

## The Wittgenstein version

Every piece of work on a legal document also produces a Wittgenstein version of that document: a plain-language distillation built by `legal-wittgenstein`, which uses conceptual clarification to keep the core of the document in focus where legalese muddles it. The brief commissions it at the start, the tests use its clarified terms, and the final deliverable includes a Wittgenstein version of the final text.

## Delegation by craft

This rule is adapted from the user's Codex `AGENTS.md` rule "Subagent Strategy: delegate by professional craft". The package carries its own copy because other users will not have that file.

- **Experts are discovered at runtime.** No list of experts is stored. There are too many possible fields, so each document produces its own list.
- **Choose by accountability.** Ask which profession would answer for the quality of this decision. Crafts can be non-legal, for example a tax accountant, an engineer for service levels, or an insurance broker.
- **Name the ownership.** For each craft, record the decisions it owns, the finished contribution it will deliver, and the clause or gap that triggered it. Absence counts as a trigger: an analytics contract that never mentions personal data may still need a privacy craft.
- **Craft brief.** Each brief contains the goal, the evidence or access to it, the constraints, the authority, and what counts as done.
- **Crafts own decisions.** A craft delivers its tests, their results, and the fix for failures in its area, with reasons, evidence, and unresolved issues.
- **Keep evidence and judgment separate.** For example, the precedent researcher finds and codes the cases (court, date, facts, holding, which way it cuts, whether it is still good law), and the owning craft judges what they mean.
- **Staffing goes through the parent.** A craft that needs another specialist asks the parent, which keeps the single staffing list and passes accepted contributions to dependent crafts. Fan-out stops when a round adds no new craft.
- **No cap on fan-out.** Staff every craft the document requires, even if that is 20 or more. Never drop a needed craft to save cost.
- **The parent assembles.** It builds the final result from the crafts' decisions, returns changes in a craft's area to that craft, and resolves conflicts between crafts with a stated reason for any override.
- **Proportionality.** Small, settled edits skip the fan-out.

## Decisions made by the user

- **Users:** any legal professional, for any legal purpose. There are no conditions based on who the user is.
- **Scope:** drafting, review, redlining and negotiation, and research.
- **Delivery:** skills only, with no hooks. The package runs in any harness on any model, so each skill must trigger from its own description.
- **Jurisdiction:** no fixed list. The agent works out the legal system per matter.
- **Experts:** discovered at runtime, with no skill per field.

## Decisions approved on 2026-09-24

1. **Base and home.** Build from the July skill set (`Tech and Code/Superpowers`), whose legal TDD already follows the core insight, and keep this repo as the home because it has the GitHub remote. Port in the May research rigor as checks, not separate records: citation verification and currentness checks feed each test's Evidence column.
2. **Rules.**
   - **Keep the accuracy rules.** Never invent facts, clauses, citations, or law. Keep uncertainty and currentness visible. Keep confidential facts out of web searches unless the user allows it.
   - **Drop the persona rules.** Remove "not legal advice", "never safe to sign", and mandatory attorney handoff.
3. **Names.** Legal-prefixed names, because `~/.codex/skills` already links upstream coding skills with the July names (`brainstorming`, `test-driven-development`, `writing-plans`, `executing-plans`, `dispatching-parallel-agents`, `verification-before-completion`).
4. **One record per matter.** The test table is the matter's single record. Findings are the failing tests, and the report is derived from the table rather than kept as a separate ledger.
5. **Skill set.**

| Step | Superpowers recipe | Proposed legal skill | Start from |
|---|---|---|---|
| Brief | brainstorming | `legal-matter-brief` | July `brainstorming` |
| Choose and delegate crafts | subagent-driven-development, dispatching-parallel-agents | `legal-craft-delegation` | New, from the user's craft rule and July `dispatching-parallel-agents` |
| Test-first work | test-driven-development | `legal-test-driven-work` | July `test-driven-development` |
| Clarify terms | none | `legal-wittgenstein` | New, in progress |
| Verify the law behind a test | none | `legal-authority-research` | July `researching-jurisdictional-law` plus May citation and currentness checks |
| Plan and execute | writing-plans, executing-plans | `legal-work-planning`, `executing-legal-work-plans` | July |
| Trace a failing test | systematic-debugging | `legal-issue-tracing` | July `systematic-legal-issue-analysis` |
| Opposing reader | requesting and receiving code review | `requesting-legal-review`, `receiving-legal-review` | July |
| Done check | verification-before-completion | `legal-verification-before-completion` | July |
| Improve the skills | writing-skills | `writing-legal-skills` | May, rewritten around pressure tests |

6. **Remove the hook machinery.** Delete `hooks/`, the OpenCode plugin, `GEMINI.md` with `gemini-extension.json`, and the router role of `using-legal-superpowers`. Replace `tests/legal-superpowers/test-active-skill-surface.sh`, which hard-codes the May skill names.

## Answers to the former open questions

- **Remaining May skills.** Remove all of them: `strategy-confidence-loop`, `using-isolated-matter-workspaces`, `finishing-legal-matter-packet`, `using-legal-superpowers`, and every May skill replaced in the table above.
- **Fan-out.** No limit. See "Delegation by craft".
- **Paid research databases.** None yet. Research relies on official and free public sources. Where currentness cannot be verified from them, say so and mark the test Blocked.
- **Testing the package.** Collect complex public agreement templates: VC shareholders' agreements, long SaaS vendor agreements, trademark licenses, and debt agreements. For each one, take a position in the transaction, run the skills for that side, and have independent subagents judge whether the result works in that party's favor without inventing anything. Run the whole evaluation as an orchestrated fan-out of subagents.
- **`legal-wittgenstein` placement.** It is a core, near-automatic step. See "The Wittgenstein version".
