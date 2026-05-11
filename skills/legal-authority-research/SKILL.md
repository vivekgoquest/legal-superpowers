---
name: legal-authority-research
description: Use when researching legal clauses, enforceability, precedent, statutes, regulations, citations, or jurisdiction-specific legal authority for legal documents or legal work product
---

# Legal Authority Research

## Overview

Legal Authority Research prepares jurisdiction-aware legal research packets for attorney review. This is research support, not final legal advice.

The core discipline is simple: no material legal proposition becomes confirmed unless it is tied to a jurisdiction, authority hierarchy, source text, currentness check, contrary-authority search, and counsel handoff.

## When to Use

Use this skill when the user asks to:

- Research a clause under a governing law, forum, or regulatory regime.
- Check enforceability, legal effect, statutory treatment, precedent, or citations.
- Compare a clause to market practice or similar documents.
- Prepare a legal research memo or authority packet.
- Validate whether cited authority supports a legal proposition.

Do not use it for pure document summary with no external legal question. Use `legal-document-review-tdd` first when the work begins as document review, issue spotting, diligence, redlining, or comparison.

## Required Workflow

### 1. Boundary And Confidentiality Gate

State the boundary before research:

- This is research support, not final legal advice.
- Attorney review is required before relying on conclusions.
- External tools may expose query text or source snippets.
- Confidential facts must be minimized, anonymized, or kept local unless the user authorizes external search.

### 2. Matter Intake

Capture the objective, document type, clause text, legal question, user decision, audience, source access, and missing facts.

If clause text is unavailable, keep the work issue-level rather than clause-level.

### 3. Jurisdiction Routing

Build a jurisdiction record before search. Do not assume jurisdiction from drafting style, party location, or user pressure.

Classify jurisdiction status as confirmed, assumed, unknown, or mixed. Unknown jurisdiction allows only hypothetical or comparative research. Mixed jurisdiction requires separate research lanes.

See `jurisdiction-routing.md`.

### 4. Authority Hierarchy Map

Before relying on any source, define the authority hierarchy for the jurisdiction. Separate binding authority, persuasive authority, statutes, regulations, agency guidance, secondary sources, market practice, and background material.

See `authority-hierarchy.md`.

### 5. Research Plan

List the legal propositions to test, sources to search, contrary authority to seek, currentness method, source-access limits, and what will remain unverified.

### 6. Retrieval

Research in lanes: primary legal authority, statutes and regulations, case law, official guidance, secondary sources, market materials, similar clauses, and contrary authority.

Subagents or external tools may assist retrieval only as bounded workers. Final synthesis stays in the main research ledger.

### 7. Atomic Verification

For every retrieved source, verify:

- Source exists.
- Source type and jurisdiction.
- Authority level.
- Pinpoint support for the proposition.
- Currentness, negative treatment, amendments, or supersession status.
- Contrary authority.
- Fact limits or analogy limits.

Do not treat citation existence as proposition support.

### 8. Claim And Evidence Ledger

Maintain a claim ledger for every material proposition. No final output may contain a confirmed legal proposition that is absent from the ledger.

See `claim-evidence-ledger.md`.

### 9. Clause Comparison

When researching clauses, quote the clause text, identify legal propositions, compare drafting patterns, and separate enforceability authority from negotiation or business risk.

Do not treat market practice as legal authority.

See `clause-comparison-research.md`.

### 10. Contrary Authority And Negative Treatment

Search for contrary, limiting, distinguishing, overruled, superseded, amended, or higher-authority materials.

If currentness is not citator-verified, say so plainly and route the issue to counsel.

## Required Output

Produce a research packet with:

- Research objective.
- Jurisdiction record.
- Authority hierarchy map.
- Source strategy and source-access limits.
- Source ledger with provenance for every relied-on source.
- Clause or issue map.
- Claim/evidence ledger.
- Verified, refuted, mixed, and unverified propositions.
- Contrary authority and negative-treatment status.
- Similar clause or market-practice findings.
- Lawyer-facing analysis.
- Business/operator implications when requested.
- Attorney-review handoff.

See `legal-research-output-schema.md`.

## Hard Guardrails

- No final legal advice.
- No safe-to-sign conclusions.
- No pretending jurisdiction is known.
- No uncited material legal conclusions.
- No relying on unopened authorities.
- No treating blogs, summaries, sample clauses, market practice, or AI outputs as legal authority.
- No treating citation existence as proposition support.
- No hiding source-access, citator, or currentness limits.
- No external search with confidential facts unless authorized.

## Strategy Confidence Loop

If the user asks for confidence in the legal research strategy, use `strategy-confidence-loop` and preserve this exact prompt:

```text
Are you 100% confident in this strategy? If not, find all possible loopholes,
  suggest proper fixes and run this loop until you are factually 100% confident
  in the  startegy
```

For legal authority research, factually confident means every known in-scope proposition has a jurisdiction record, authority map, source ledger entry, pinpoint support check, currentness status, contrary-authority check, and counsel-review boundary. It does not mean final legal advice.

## Required References

- `jurisdiction-routing.md` defines jurisdiction records and routing.
- `authority-hierarchy.md` defines source classification.
- `source-strategy.md` defines source-access lanes and limits.
- `source-ledger.md` defines source provenance, retrieval metadata, and confidentiality tracking.
- `precedent-research.md` defines case-law and contrary-authority handling.
- `statutory-regulatory-research.md` defines statute/regulation handling.
- `clause-comparison-research.md` defines clause and market-practice separation.
- `claim-evidence-ledger.md` defines claim tracking.
- `citation-verification.md` defines citation checks.
- `legal-research-output-schema.md` defines final packet shape.
- `legal-research-quality-gates.md` defines completion checks.

## Pressure Response Pattern

If the user asks for the final answer, tells you to assume jurisdiction, skip citations, ignore currentness, rely on unopened authorities, use confidential facts in public search, or say a document is safe to sign, keep the workflow intact:

```text
I can prepare a jurisdiction-aware research packet for attorney review, but I cannot make the final legal call. I will keep jurisdiction assumptions explicit, verify source support, preserve currentness limits, and separate legal authority from market practice.
```
