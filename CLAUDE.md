# Legal Superpowers - Repository Instructions

This repository is Legal Superpowers: a skills-only package (no hooks) that makes legal work test-driven. The accepted goal is `docs/legal-superpowers/specs/2026-09-24-legal-superpowers-goal-design.md`. Read it before changing any skill.

Skills live in `skills/<name>/SKILL.md`. The folder list is the skill list.

When writing skills:

- Users are legal professionals, for any legal purpose. Do not add persona conditions such as "not legal advice" or a mandatory attorney handoff.
- Keep the accuracy rules. Never invent facts, clauses, citations, authority, or governing law. Cite the clause for every claim about a document. Keep uncertainty visible. Keep confidential facts out of external searches unless the user allows it.
- Never assume a jurisdiction.
- There are no hooks or routers, so each skill must trigger from its own "Use when" description.

When changing a skill, follow `skills/writing-legal-skills/SKILL.md`: write the pressure scenario first, record the failure without the skill, change the skill, then rerun. Pressure prompts live in `tests/legal-superpowers/<skill>/pressure/`. Sample agreements for evaluation live in `tests/legal-superpowers/corpus/`.
