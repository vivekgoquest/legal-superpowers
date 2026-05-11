# Original Superpowers to Legal Superpowers Mapping

**Purpose:** Preserve the lineage from Obra Superpowers while making this fork legal-native.

Legal Superpowers keeps the original process discipline: use the right skill first, write specs before work product, use TDD for behavior-shaping skill text, review before completion, and verify before claiming success. The adaptation changes the domain from coding work to legal-document work.

## Mapping Table

| Original Superpowers Skill | Legal Superpowers Skill | Preserved Discipline | Legal Adaptation |
|---|---|---|---|
| `using-superpowers` | `using-legal-superpowers` | Check and apply the relevant workflow skill before acting. | Requires legal skills before intake, document review, legal planning, issue tracing, or completion claims. |
| `brainstorming` | `legal-matter-intake` | Clarify intent before producing the main work product. | Turns the user request into a plain-English legal matter objective, audience, jurisdiction assumptions, and document inventory. |
| `writing-plans` | `legal-review-planning` | Convert approved requirements into small executable tasks. | Converts a legal matter spec into review phases, expected review tests, source inventory steps, and attorney handoff checkpoints. |
| `test-driven-development` | `legal-review-tdd` | Write failing tests before implementation, then go red, green, refactor. | Writes expected legal findings and process tests before final analysis or skill changes. |
| `systematic-debugging` | `legal-issue-tracing` | Trace causes before fixing symptoms. | Traces legal/document issues back to source text, missing facts, conflicting documents, or unsupported assumptions. |
| `verification-before-completion` | `legal-verification-before-completion` | Verify evidence before claiming completion. | Checks citations, missing-info treatment, dual-audience output, and attorney handoff before saying the review is complete. |
| `writing-skills` | `writing-legal-skills` | Treat skill writing as TDD for process documentation. | Uses seeded legal fixtures and pressure prompts to prove legal skills change agent behavior. |
| `dispatching-parallel-agents` | `dispatching-parallel-legal-reviewers` | Split independent work across parallel reviewers when safe. | Dispatches independent legal reviewers by document, issue category, or audience while preserving source boundaries. |
| `subagent-driven-development` | `subagent-driven-legal-review` | Execute planned tasks with review gates between tasks. | Uses fresh reviewers for legal review tasks, with separate source-grounding and work-product-quality review gates. |
| `executing-plans` | `executing-legal-review-plans` | Execute a written plan in order with checkpoints. | Executes legal review plans in batches while preserving expected review tests and counsel handoff gates. |
| `requesting-code-review` | `requesting-legal-work-product-review` | Ask for independent review before integration or completion. | Requests review for unsupported conclusions, missing citations, output imbalance, and legal-advice boundary breaches. |
| `receiving-code-review` | `receiving-legal-review-feedback` | Evaluate feedback rigorously before applying changes. | Distinguishes substantive legal-review corrections from style preferences or unsupported reviewer assumptions. |
| `finishing-a-development-branch` | `finishing-legal-matter-packet` | Verify, summarize, and choose the next integration path. | Finalizes a legal matter packet with source map, findings, business summary, open questions, and counsel handoff. |
| `using-git-worktrees` | `using-isolated-matter-workspaces` | Work in an isolated environment for risky or multi-step changes. | Keeps matter documents, review notes, and generated work product isolated by matter. |

## Foundation Skill Relationship

`skills/legal-document-review-tdd/SKILL.md` is the shared legal core. The renamed workflow skills should call into it whenever the work involves legal-document intake, analysis, drafting, review, issue spotting, or handoff.

The foundation skill does not replace the workflow skills. It defines the legal work-product discipline those skills rely on.

## Non-Negotiable Carryovers

- Apply the relevant skill before acting.
- Write the spec before substantive work.
- Write expected tests before final analysis.
- Verify behavior with fixtures and pressure scenarios.
- Do not claim completion without evidence.
- Preserve uncertainty instead of inventing certainty.

## Legal-Native Differences

- Source text replaces code behavior as the primary evidence surface.
- Expected findings replace unit tests for many review tasks.
- Pressure prompts test whether the agent resists unsafe legal shortcuts.
- Attorney-review handoff replaces final legal advice.
- Business/operator output is required alongside lawyer-facing work product when requested.
