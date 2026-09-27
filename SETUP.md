# Setting up Legal Superpowers

This page is for whoever installs the package: an IT colleague, or a lawyer comfortable with a terminal. The lawyer-facing guide is the [README](README.md).

## What it technically is

- An **AI agent** is an AI model that can use tools: read and write files, run commands, search the web. Claude Code, Codex and pi are programs that run agents on your computer; each is called a **harness**.
- A **skill** is a folder containing a `SKILL.md` file of plain-English instructions. The first lines of each file are a short **description**: what the skill does, then "Use when…" and the situations that call for it. The agent reads every description and opens a skill when a request matches it, so users never name skills.
- A **subagent** is a second agent started for one job with a fresh memory. The package uses subagents for specialists and for the independent reviewer.
- This package is 12 skills in `skills/`. It has no hooks, plug-in code or server; it works in any harness that reads skill folders.

## Install

**The easy way:** paste the install message from the [README](README.md#install-paste-one-message) into Claude Code, Codex, pi or another AI coding tool. It clones the repository to `~/legal-superpowers`, links each skill folder into the tool's personal skills folder, and runs the structure check. Pasting it again updates the package.

| Tool | Personal skills folder it uses |
|---|---|
| Claude Code | `~/.claude/skills/` |
| Codex | `~/.agents/skills/` |
| pi | `~/.pi/agent/skills/` (or `~/.agents/skills/`) |
| Other tools | their own skills folder, or `~/.agents/skills/` |

**By hand, as a Claude Code plugin:** run `/plugin marketplace add vivekgoquest/legal-superpowers`, then `/plugin install legal-superpowers@legal-superpowers-dev`, then start a new session.

**By hand, any tool:**

```bash
git clone https://github.com/vivekgoquest/legal-superpowers.git ~/legal-superpowers
mkdir -p ~/.agents/skills   # or the tool's folder from the table above
for d in ~/legal-superpowers/skills/*/; do ln -s "$d" ~/.agents/skills/; done
```

**claude.ai and ChatGPT downloads:** `scripts/package-skills.sh` builds them into `dist/` (one ZIP per skill for claude.ai, flat renamed files plus project instructions for ChatGPT). `.github/workflows/skill-bundles.yml` reruns it on every change to `skills/` and republishes the [`skills` release](https://github.com/vivekgoquest/legal-superpowers/releases/tag/skills), so the README's download links always serve the current skills.

**Check it works:** ask for *"the Wittgenstein version of this agreement"* with any contract attached. A reply organised around "the deal", "who must do what", "the economics" and "what each side really gets" means the skills loaded.

## The 12 skills

| Step | Skill | What it does |
|---|---|---|
| Brief | `legal-matter-brief` | Records the side, objective, facts, documents, date and known law before any tests |
| Clarify | `legal-wittgenstein` | Writes the plain-language version and pins down what key words mean in this document |
| Staff | `legal-craft-delegation` | Picks the specialist crafts the document needs at runtime and delegates their decisions |
| Test-first work | `legal-test-driven-work` | Writes the tests, then runs RED (show failures), GREEN (smallest fix) and REFACTOR (tidy without moving positions) |
| Law behind a test | `legal-authority-research` | Pinpoints the governing law and verifies statutes and cases, and their currentness, from free public sources |
| Plan | `legal-work-planning` | Turns a multi-step matter into reviewed, test-linked tasks |
| Execute | `executing-legal-work-plans` | Runs a plan task by task and stops at open client decisions |
| Trace | `legal-issue-tracing` | Finds the root cause of a failing test before anything is redrafted |
| Independent run | `requesting-legal-review` | Has a fresh-context reviewer rerun the suite as the other side would read it |
| Feedback | `receiving-legal-review` | Restates each comment as a test and checks it before acting on it |
| Done | `legal-verification-before-completion` | Reruns the whole suite on the final text before any completion claim |
| Build skills | `writing-legal-skills` | Test-driven development for the skills themselves |

The design in force is [`docs/legal-superpowers/specs/2026-09-24-legal-superpowers-goal-design.md`](docs/legal-superpowers/specs/2026-09-24-legal-superpowers-goal-design.md). Read it before changing any skill.

## Time and cost

Every step runs on every matter, including the independent review and often several specialist subagents, so usage is higher than a chat answer. In our tests a one-page loan note took about 20 minutes and roughly 300,000 tokens in Claude Code; a long agreement with many specialists can take hours. A cheaper model, or a harness on a plan you already pay for, reduces cost.

## Folder map

```
legal-superpowers/
├── skills/                       The 12 skills, one folder each
├── tests/legal-superpowers/
│   ├── fixtures/                 Short sample agreements written for testing
│   ├── corpus/                   Real public agreements for evaluation (see its README)
│   ├── <skill-name>/pressure/    Prompts that try to make a skill fail
│   ├── test-skills.sh            Structure checks for the whole package
│   ├── test-legal-wittgenstein.sh
│   ├── test-triggering.sh        Checks each skill starts from its own description
│   └── triggers.tsv              Requests used by the trigger check
├── docs/legal-superpowers/specs/ Design documents; the goal document is the one in force
├── .claude-plugin/ .codex-plugin/ .cursor-plugin/   Install details per harness
├── scripts/bump-version.sh       Updates the version in every install file at once
├── scripts/package-skills.sh     Builds the claude.ai and ChatGPT downloads (see Install)
├── .github/workflows/            Rebuilds and publishes those downloads when the skills change
├── CLAUDE.md                     Instructions for an agent working on this repository (AGENTS.md links to it)
└── LICENSE                       MIT
```

## Testing the package

"Test" means three things here:

1. **Legal tests** are the product: the tests the agent writes for a matter.
2. **Work-product checks** confirm the agent cited sources and invented nothing.
3. **Skill tests** check that the skills make an agent behave under pressure. This section is about these.

Structure checks (free, seconds):

```bash
bash tests/legal-superpowers/test-skills.sh
bash tests/legal-superpowers/test-legal-wittgenstein.sh all
```

Trigger check (uses model credits; one headless Claude Code session per line of `triggers.tsv`):

```bash
bash tests/legal-superpowers/test-triggering.sh
```

Behaviour tests follow `skills/writing-legal-skills/SKILL.md`: run each prompt in `tests/legal-superpowers/<skill>/pressure/` with and without the skill, grade with independent judges, then evaluate on corpus agreements by taking one side and checking the result helps that side without inventing anything.

> [!NOTE]
> Four corpus agreements have no open licence. They stay on the maintainer's machine, listed in `.gitignore`, and the test scripts skip them on a fresh clone.

## Changing a skill

Follow `skills/writing-legal-skills/SKILL.md`:

1. Write a pressure prompt first, in a legal professional's words, in `tests/legal-superpowers/<skill>/pressure/`.
2. Run it with the current skill and record the failure.
3. Make the smallest change that fixes it.
4. Rerun with independent judges who did not write the change.
5. Run the structure checks before committing.

Never put real client facts, party names or corpus wording into a skill. Each rule lives in one skill and others point to it. Each skill must start from its own "Use when" description.
