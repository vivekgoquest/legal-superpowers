# Legal Superpowers

Legal Superpowers is a skills package that makes legal work test-driven. Before drafting, reviewing, redlining or arguing, the agent writes the tests the work must pass, then works until they pass. Specialist subagents, chosen at runtime from the document itself, own the judgments in their field.

It has no hooks. Each skill triggers from its own description, so it works in any agent harness, on any model.

The accepted design is in [`docs/legal-superpowers/specs/2026-09-24-legal-superpowers-goal-design.md`](docs/legal-superpowers/specs/2026-09-24-legal-superpowers-goal-design.md).

## The idea

Legal arguments are already test-driven: an argument has to "stand the test" of a law. The package makes that explicit. A test is a short "what if" scenario with the answer the text must give, drawn from three sources:

- **The law:** is the text valid, enforceable and compliant?
- **Our objective:** does the client get the outcome it needs?
- **Their reading:** does it survive the most hostile reading the other side or a court could give it?

The work runs RED (show where the current text fails), then GREEN (write the smallest complete fix), then REFACTOR (harmonize without moving any position). A fresh reviewer that did not draft the text then reruns every test. The test table is the matter's single record: findings are its failing tests, and every report is read off it.

Every piece of work on a legal document also produces a **Wittgenstein version**: a plain-language distillation that keeps the core of the document in focus.

## Skills

| Step | Skill | What it does |
|---|---|---|
| Brief | `legal-matter-brief` | Records the side, objective, facts, documents, date and known law before any tests |
| Clarify | `legal-wittgenstein` | Distills a legal document into plain language by clarifying how it uses its key terms |
| Staff | `legal-craft-delegation` | Picks the specialist crafts the document needs at runtime and delegates their decisions |
| Test-first work | `legal-test-driven-work` | Writes the tests, then runs RED, GREEN and REFACTOR for drafting, review, redlining and argument |
| Law behind a test | `legal-authority-research` | Pinpoints the jurisdiction and verifies statutes, cases and currentness from public sources |
| Plan | `legal-work-planning` | Turns a brief into reviewed, test-linked tasks |
| Execute | `executing-legal-work-plans` | Runs a plan task by task and stops at open decisions |
| Trace | `legal-issue-tracing` | Finds the root cause of a failing test before anything is changed |
| Independent run | `requesting-legal-review` | Has a fresh reviewer rerun the suite as the other side would read it |
| Feedback | `receiving-legal-review` | Checks each comment against the text and tests before acting on it |
| Done | `legal-verification-before-completion` | Reruns the whole suite on the final text before any completion claim |
| Build skills | `writing-legal-skills` | Test-driven development for the skills themselves |

## Install

- **Claude Code:** add this repository as a plugin marketplace (`/plugin marketplace add vivekgoquest/obra-superpowers-legal`), then install `legal-superpowers`.
- **Codex and other harnesses:** point the harness at the `skills/` folder, for example by symlinking each skill folder into `~/.codex/skills/`.

## Testing

```bash
bash tests/legal-superpowers/test-skills.sh
bash tests/legal-superpowers/test-legal-wittgenstein.sh all
```

These scripts check structure only. `bash tests/legal-superpowers/test-triggering.sh` runs one headless `claude -p` session per row of `triggers.tsv` and checks that each skill loads from its own description; it uses model credits. Behaviour is tested the way `writing-legal-skills` describes: run each skill's pressure prompts in `tests/legal-superpowers/<skill>/pressure/` with and without the skill, then evaluate on real agreements in `tests/legal-superpowers/corpus/` by taking a side and checking the result works in that party's favour without inventing anything.

## Attribution

This repository began as a fork of [obra/superpowers](https://github.com/obra/superpowers) by Jesse Vincent and Prime Radiant, and remains under the MIT License in `LICENSE`.
