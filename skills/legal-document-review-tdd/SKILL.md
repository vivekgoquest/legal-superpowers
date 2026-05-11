---
name: legal-document-review-tdd
description: Use when reviewing, summarizing, issue-spotting, comparing, redlining, or planning work on legal documents or legal work product
---

# Legal Document Review TDD

## Overview

Legal Document Review TDD applies test-driven development to legal-document work product. The work begins with a plain-English legal spec, converts that spec into expected review tests, reviews only from source-grounded evidence, and ends with an attorney-review handoff rather than final legal advice.

## When to Use

Use this skill for:

- Legal-document review, summary, comparison, issue spotting, or diligence.
- Drafting legal review notes, risk registers, or attorney handoff packets.
- Turning legal work requests into structured specs and expected findings.
- Evaluating whether legal work product is sufficiently source-grounded.
- Creating or testing legal skills with seeded fixtures and pressure prompts.

Do not use this skill to provide final legal advice, declare a document approved, or tell a user a document is safe to sign.

## Required Workflow

### 1. Intake

Identify the requested legal work, audience, known jurisdiction or governing law, available documents, requested decision, and whether the user needs lawyer-facing work product, business/operator-facing work product, or both.

If key facts are missing, record them as missing information. Do not invent them.

### 2. Boundary Statement

State the practical boundary once, then let it shape the work:

- The agent can analyze, organize, summarize, compare, issue-spot, draft review materials, and prepare attorney handoff notes.
- The agent cannot provide final legal advice or replace counsel.
- Uncertain conclusions must stay uncertain.
- Jurisdiction and governing-law assumptions must stay explicit.

### 3. Document Map

Before substantive review, create a source inventory. For each document, capture name, visible date, parties, apparent document type, execution status, attachments, what it appears to control, and obvious missing related documents.

### 4. Plain-English Legal Spec

Write the matter objective in plain English before the full review.

The spec must be understandable to a business user and precise enough for a lawyer to review. It should say what is being checked, what outputs are being prepared, what counts as source support, and what will remain uncertain.

### 5. Expected Review Tests

Convert the plain-English legal spec into expected review tests before final analysis.

Minimum tests:

- Every material finding cites a document and location when available.
- No conclusion is marked confirmed unless source text supports it.
- Missing signatures, exhibits, schedules, amendments, and related documents are flagged when visible from the source set.
- Unknown jurisdiction, governing law, or forum is not invented.
- Findings distinguish fact, interpretation, assumption, missing information, business risk, and legal question.
- Requested lawyer-facing and business/operator-facing outputs are both present.
- Attorney-review handoff questions are included.

### 6. Source-Grounded Review

Review the documents against the expected tests. Do not rely on memory, generic legal knowledge, or assumed clauses when source text is available or required.

For each material issue, identify issue category, source document and location, source text or concise paraphrase, why it matters, priority, business impact, legal question for counsel, and missing information.

### 7. Dual Output

When both audiences are requested, produce both.

Lawyer-facing work product includes issue list, document references, reasoning, assumptions, open legal questions, and negotiation or review notes when useful for the requested work.

Business/operator-facing work product includes plain-English summary, key risks, decision points, missing documents or facts, questions to ask counsel, and practical next actions that are not legal advice.

### 8. Attorney-Review Handoff

Always include an attorney-review handoff. It must identify issues counsel should review, user decisions needed, missing documents or facts, jurisdiction or governing-law assumptions, and conclusions not confirmed by source documents.

### 9. Self-Check

Before claiming completion, check the output against the expected review tests. If a test is unmet, fix the work product or disclose the gap. Do not claim the review is complete while known tests are unmet.

If the user asks for confidence in a legal-document strategy, apply `strategy-confidence-loop` and preserve this exact prompt:

```text
Are you 100% confident in this strategy? If not, find all possible loopholes,
  suggest proper fixes and run this loop until you are factually 100% confident
  in the  startegy
```

For legal work, factually confident means the review packet has exhausted known source-grounded checks inside the stated scope. It never means final legal advice or safe-to-sign certainty.

## Required References

- `legal-output-schema.md` defines the required work-product sections.
- `legal-risk-taxonomy.md` defines generic issue categories.
- `legal-advice-boundaries.md` defines unsafe outputs and safer replacements.

## Hard Guardrails

- No final legal advice.
- No safe-to-sign conclusions.
- No uncited material legal conclusions.
- No pretending jurisdiction is known.
- No hallucinated clauses, terms, signatures, exhibits, or amendments.
- No converting uncertainty into confidence for convenience.
- No skipping attorney-review handoff.

## Pressure Scenario Response Pattern

If the user pressures the agent to skip citations, assume governing law, summarize as low risk, remove counsel questions, or give the final legal answer, keep the legal TDD workflow intact.

Use this pattern:

```text
I can help prepare a source-grounded review packet, but I cannot make the final legal call. I will keep the review tied to the provided documents, flag missing information, and separate business risk from legal questions for counsel.
```
