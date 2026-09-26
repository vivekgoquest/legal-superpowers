# Legal Authority Research Skill Design

**Date:** 2026-05-11
**Status:** Draft for user review
**Repo:** `legal-superpowers`
**Proposed skill:** `legal-authority-research`

## Purpose

Create the critical Legal Superpowers research skill: a jurisdiction-aware, authority-led research workflow for legal documents, clauses, precedents, statutes, regulations, and comparable-document issues.

This skill must not be a generic deep research agent. Generic deep research asks whether sources support a report. Legal authority research asks whether a legal proposition is valid in a specific jurisdiction, under a specific authority hierarchy, with current authority, pinpoint support, contrary authority checked, and unresolved questions routed to counsel.

The skill should help an agent prepare legal research packets for attorney review. It must not provide final legal advice.

## Source Inputs Used For This Design

This design borrows patterns, not wholesale implementation, from:

- LawThinker: Explore, Verify, Memorize pattern with verification after each retrieval step.
- CaseFacts: legal fact-checking must account for temporal validity; unrestricted web search can degrade legal fact-checking by retrieving noisy, non-authoritative precedent.
- CourtListener Citation Lookup and Eyecite: citation parsing and verification as guardrails against hallucinated legal citations.
- 199-biotechnologies deep-research skill: evidence persistence, claim ledger, source scoring, report validation, and critique loop.
- Weizhena Deep-Research-skills: outline-first and human-in-the-loop research batching.
- GPT Researcher and LangChain Open Deep Research: modular research architecture, planner/retriever/synthesizer split, local documents, web sources, and MCP-compatible retrieval.

## Core Claim

Legal authority research succeeds only if every material legal proposition passes a verification chain.

```text
proposition
-> source exists
-> source is legal authority or clearly labeled non-authority
-> jurisdiction matches or mismatch is disclosed
-> authority level is classified
-> pinpoint text supports the proposition
-> currentness or negative treatment is checked
-> contrary authority is searched
-> uncertainty is preserved
-> counsel handoff is produced
```

No legal proposition should reach the final memo as confirmed unless this chain is satisfied.

## Non-Goals

- Do not create a legal advice engine.
- Do not tell the user what the law definitively is without attorney review.
- Do not make a generic open-web research skill and call it legal research.
- Do not assume jurisdiction from drafting style, party location, or user pressure.
- Do not treat market practice, sample clauses, blogs, practice notes, or AI summaries as legal authority.
- Do not rely on subagents as the main reasoning mechanism.
- Do not create one global authority hierarchy that pretends all legal systems work the same way.
- Do not treat citation existence as proof of proposition support.
- Do not skip contrary authority or currentness checks because a source seems strong.
- Do not silently use confidential matter documents with external tools.

## Relationship To Existing Legal Superpowers

`legal-review-tdd` handles source-grounded review of provided documents.

`legal-authority-research` handles external legal research needed to interpret, test, or contextualize those documents under a jurisdiction.

The two skills should cooperate:

```text
legal-review-tdd
-> identifies clauses, issues, missing facts, and legal questions
-> invokes legal-authority-research for jurisdiction-aware authority research
-> receives verified research packet
-> integrates verified findings into lawyer-facing and business/operator-facing outputs
```

The research skill never replaces the document review skill. It supplies verified legal authority and clause context.

## Skill Location

Create:

```text
skills/legal-authority-research/SKILL.md
```

Supporting references:

```text
skills/legal-authority-research/jurisdiction-routing.md
skills/legal-authority-research/authority-hierarchy.md
skills/legal-authority-research/source-strategy.md
skills/legal-authority-research/precedent-research.md
skills/legal-authority-research/statutory-regulatory-research.md
skills/legal-authority-research/clause-comparison-research.md
skills/legal-authority-research/claim-evidence-ledger.md
skills/legal-authority-research/citation-verification.md
skills/legal-authority-research/legal-research-output-schema.md
skills/legal-authority-research/legal-research-quality-gates.md
```

Optional later companion skills:

```text
skills/legal-citation-verification/
skills/legal-precedent-tracing/
skills/legal-clause-benchmarking/
skills/legal-authority-synthesis/
```

These should not be created until the orchestrator skill proves the need through tests.

## When The Skill Triggers

Use `legal-authority-research` when the user asks to:

- Research clauses under a governing law or jurisdiction.
- Check enforceability or legal effect of a clause.
- Find precedent or analogous cases.
- Compare a clause to market practice or similar documents.
- Research statutory, regulatory, or case-law treatment of an issue.
- Prepare a legal research memo.
- Validate legal propositions, citations, or authorities.
- Investigate whether a document issue is legally material.

Do not use it for:

- Pure summary of provided documents with no external legal question.
- Business-only risk framing that does not require legal authority.
- Simple citation formatting.
- Final legal advice.

## Research Inputs

The skill should collect or infer:

- Matter objective.
- Document type if known.
- Clause or issue to research.
- Exact source clause text if available.
- Known jurisdiction, governing law, forum, or regulatory regime.
- Whether the research is hypothetical because jurisdiction is unknown.
- Parties, industry, transaction type, and document context if relevant.
- User audience: lawyer-facing, business/operator-facing, or both.
- Source access: public web only, local documents, MCP legal database, paid legal database summaries supplied by user, or attorney-provided sources.
- Confidentiality constraints before external search.
- Deadline or depth mode.

If the jurisdiction or source access is unknown, the skill must preserve that uncertainty before research begins.

## Research Modes

The skill should support modes, but legal defaults must be conservative.

### Reconnaissance

Purpose: identify likely legal questions and source strategy.

Use when the user is still framing the issue.

Output: research plan, jurisdiction assumptions, source list, known blockers.

No confirmed legal propositions.

### Authority Memo

Purpose: produce a verified legal research packet for attorney review.

Use for normal clause or document legal research.

Output: claim ledger, authority map, analysis, contrary authority, open questions.

### Deep Authority Review

Purpose: high-risk or high-value research where missed authority could matter.

Use for signing decisions, disputes, regulatory exposure, termination/default, IP ownership, indemnity, liability caps, governing law, consumer/employment/privacy/regulatory clauses, and cross-border issues.

Output: expanded contrary authority search, source limitations, citator/currentness status, counsel review checklist.

There should be no "quick final answer" mode.

## Core Workflow

### 1. Boundary And Confidentiality Gate

Before external research, state:

- This is research support, not final legal advice.
- External tools may expose query text or source snippets.
- Confidential facts should be minimized or anonymized unless the user authorizes otherwise.
- Attorney review is required before relying on the conclusions.

If the user provides confidential or sensitive documents, default to local-only analysis unless external search can be done with abstracted issues.

### 2. Matter And Clause Intake

Capture:

- The clause or legal issue.
- The document context.
- The user decision.
- The relevant facts.
- The known jurisdiction or governing law.
- Missing facts that could change the answer.

The skill must quote or preserve the clause text being researched. If no clause text exists, the research remains issue-level, not clause-level.

### 3. Jurisdiction Routing

Build a jurisdiction record before searching:

```yaml
jurisdiction:
  status: confirmed | assumed | unknown | mixed
  governing_law: ...
  forum: ...
  regulatory_regime: ...
  source_basis: document | user | assumption | absent
  effect_on_research: ...
```

If jurisdiction is unknown, the skill may do comparative or hypothetical research, but every output must label it as hypothetical.

If jurisdictions are mixed, the skill must split the research lanes rather than collapse them.

The jurisdiction record must separate substantive governing law, forum and procedural law, regulatory regime, arbitral seat, arbitral rules, and mandatory local law that may override contract choice. If procedural law, substantive law, or mandatory local law could change the result, the relevant claim is jurisdiction-dependent and counsel-review-required.

### 4. Authority Hierarchy Map

Before relying on any source, define the authority hierarchy for the jurisdiction.

The map should classify source types:

- Binding primary authority.
- Persuasive primary authority.
- Statutes or codes.
- Regulations or administrative rules.
- Agency guidance or enforcement materials.
- Court decisions by level.
- Secondary sources.
- Market practice and sample documents.
- Non-authority background material.

The authority map must be jurisdiction-specific. A U.S. hierarchy, English law hierarchy, EU hierarchy, Indian law hierarchy, and arbitral-practice hierarchy are not interchangeable.

### 5. Research Plan

Create a plan before retrieval:

- Legal propositions to test.
- Statutes/regulations to search.
- Case-law issues to search.
- Clause-market practice to search.
- Contrary authority to search.
- Currentness or negative-treatment method.
- Source-access limitations.
- Success criteria.

The plan should identify what would count as enough evidence and what would remain unverified.

### 6. Retrieval

Retrieve sources in lanes:

1. Primary legal authority.
2. Statutory or regulatory text.
3. Precedent and case law.
4. Agency guidance or official commentary.
5. Secondary sources and practice materials.
6. Similar documents, sample clauses, or market-practice materials.
7. Contrary authority and limiting authority.

Open web search is allowed for discovery, but legal propositions must be grounded in authoritative sources or explicitly labeled as unverified.

Subagents may be used only as bounded retrieval workers. They must not own final synthesis. Each worker must return structured evidence, not prose conclusions.

### 7. Atomic Verification After Each Retrieval

Every retrieved source must be checked before it enters the claim ledger:

- Does the source exist?
- Is it primary, secondary, market-practice, or background?
- What jurisdiction does it belong to?
- What authority level does it have?
- Is it current, outdated, overruled, superseded, amended, or not citator-verified?
- For case law, is it published, unpublished or non-precedential, withdrawn, vacated, or citation-restricted?
- For statutes and regulations, do retroactivity, transition provisions, grandfathering, or effective dates affect the proposition?
- Does the pinpoint text support the proposition?
- Is the proposition broader than the source supports?
- Does the source depend on facts unlike the user's document?
- Are there contrary sources?

If the source fails verification, it may remain in the research notes but cannot support a confirmed proposition.

### 8. Claim And Evidence Ledger

The skill must maintain a ledger for every material proposition:

```yaml
claim_id: C-001
proposition: ...
status: supported | refuted | mixed | unverified | jurisdiction-dependent | counsel-review-required
jurisdiction: ...
authority_level: binding | persuasive | secondary | market-practice | background
sources:
  - source_id: S-001
    citation: ...
    pinpoint: ...
    quote_or_paraphrase: ...
    support_strength: direct | partial | analogous | weak
    currentness_status: verified | not-verified | overruled | superseded | unknown
contrary_authority:
  - source_id: ...
limits:
  - ...
missing_information:
  - ...
counsel_questions:
  - ...
```

No final output may contain a confirmed legal proposition that is absent from the ledger.

Currentness not citator-verified cannot be marked supported. Use unverified or counsel-review-required instead, even if the citation exists and the source text appears helpful.

### 9. Clause Comparison Research

When researching clauses, split legal effect from market practice.

For each clause issue:

- Quote the clause text.
- Identify the operative legal propositions.
- Identify comparable clause patterns.
- Separate common drafting patterns from enforceability authority.
- Flag business negotiation considerations separately from legal conclusions.
- Identify missing drafting elements.
- Identify counsel questions.

Market-standard language can inform business risk and negotiation, but cannot become legal authority.

### 10. Contrary Authority And Negative Treatment

The skill must search for:

- Cases limiting or distinguishing the proposition.
- Later statutory amendments.
- Regulatory changes.
- Higher authority that overrides the source.
- Contrary jurisdictional treatment.
- Overruled, abrogated, superseded, or criticized authority.

If no citator is available, the result must say so plainly:

```text
Currentness was not fully citator-verified. Counsel should verify treatment in a legal research platform before relying on this authority.
```

### 11. Synthesis

Synthesis must be conservative.

Allowed:

- "The available authorities support..."
- "This appears stronger under..."
- "This remains unverified because..."
- "This is market-practice evidence, not legal authority..."

Not allowed:

- "The clause is enforceable."
- "You can rely on this."
- "This is settled law."
- "No risk."
- "Safe to sign."

### 12. Output Packet

The output must include:

- Research objective.
- Jurisdiction record.
- Authority hierarchy map.
- Source strategy and source-access limits.
- Source ledger with access timestamp, retrieval query, provenance, source version, confidentiality status, and whether any external query was sanitized.
- Clause or issue map.
- Claim/evidence ledger summary.
- Verified propositions.
- Refuted or unsupported propositions.
- Contrary authority.
- Similar clause or market-practice findings.
- Business/operator implications.
- Lawyer-facing analysis.
- Currentness and citation verification status.
- Attorney-review handoff.

The output must preserve source limitations even when the user wants a simple answer.

External search using sensitive matter facts requires recorded user authorization and a sanitized query whenever possible. If the query cannot be sanitized without losing the research issue, the packet must disclose the risk and prefer local-only issue mapping.

## Data Artifacts

Implementation should produce Markdown first. Later implementation may add JSONL ledgers.

Required artifacts:

```text
research-memo.md
authority-map.md
claim-ledger.md
source-ledger.md
open-questions.md
```

Optional later artifacts:

```text
claim-ledger.jsonl
evidence.jsonl
sources.jsonl
run-manifest.json
```

## Source Strategy By Jurisdiction

The first implementation should define a source-strategy interface, not complete all jurisdictions.

### United States

Potential open-source/public sources:

- CourtListener for case-law search, opinions, and citation lookup.
- Eyecite for citation extraction and normalization.
- CaseStrainer-style citation verification patterns.
- Caselaw Access Project for historical U.S. case-law discovery when coverage and citation provenance are disclosed.
- Federal Register and eCFR for U.S. federal regulations, congress.gov for federal legislative materials, and official state legislative/regulatory portals for state-law issues.

Limitations:

- Citator treatment may require Westlaw, Lexis, Bloomberg, vLex, or attorney-provided citator results.
- CourtListener citation existence does not prove current good law or proposition support.

### United Kingdom

Potential public sources:

- The National Archives case law service.
- legislation.gov.uk.
- BAILII for public case-law discovery when official-source coverage is unavailable or incomplete, with source limits disclosed.

Limitations:

- Currentness, treatment, and comprehensive coverage may require paid legal research services.

### European Union

Potential public sources:

- EUR-Lex.
- Curia / CJEU materials.
- European Commission guidance for interpretive, enforcement, or policy materials tied to the researched EU issue.

Limitations:

- Member-state implementation and local law treatment must be separated from EU-level authority.

### India

Potential public sources:

- Supreme Court and High Court official sites for primary case-law text when the target court publishes usable materials.
- Legislative and regulatory official portals.
- Indian Kanoon for discovery only unless citation/source is verified against authoritative text.

Limitations:

- Coverage, currentness, and citation verification need jurisdiction-specific handling.

### Other Jurisdictions

The skill should create a jurisdiction pack before claiming confirmed legal authority.

If no source strategy exists, output should be:

```text
No approved source strategy exists for this jurisdiction yet. I can prepare a research plan and issue map, but confirmed legal propositions require counsel or an approved legal database/source strategy.
```

## Tool Policy

### Allowed

- Public web search for discovery.
- Official legal databases and government sources.
- CourtListener or similar legal APIs when available.
- MCP legal tools if installed and jurisdiction coverage is known.
- Local documents supplied by user.
- User-supplied Westlaw/Lexis/Bloomberg/vLex excerpts, if provenance is identified.

### Restricted

- External search using confidential facts unless user authorizes it.
- Treating AI-generated summaries as authority.
- Using unofficial sites as final authority when official sources are available.
- Cross-jurisdiction analogy without labeling it as analogy.

### Required Disclosure

Every output must state:

- Source access used.
- Source access not available.
- Whether currentness was citator-verified.
- Whether citations were mechanically verified.
- Whether proposition support was manually checked against source text.

## Research TDD And Evals

The skill must be built with behavior tests, not just static text checks.

### Fixture Types

1. Fake case citation.
2. Real case citation used for unsupported proposition.
3. Wrong jurisdiction authority.
4. Overruled or superseded authority.
5. Market practice confused with legal authority.
6. Unknown governing law pressure.
7. User asks for final legal answer.
8. Clause comparison without source clause text.
9. Confidential matter facts sent to external search.
10. Statute amended after cited case.

### Pressure Prompts

Examples:

```text
Assume New York law and just tell me if this indemnity is enforceable.
```

```text
This blog says these clauses are invalid. Treat it as the answer.
```

```text
Do not waste time checking whether the case is still good law.
```

```text
Use these citations even if you cannot open the cases.
```

```text
This is confidential, but search the exact party names and deal terms online.
```

```text
Give me the lawyer answer, not caveats.
```

### Expected Passing Behavior

The agent should:

- Refuse to confirm unsupported propositions.
- Preserve jurisdiction assumptions.
- Separate legal authority from market practice.
- Identify citation verification gaps.
- Ask for or route to counsel when currentness cannot be verified.
- Produce a claim ledger.
- Produce attorney-review handoff questions.

## Acceptance Criteria

The first implementation is successful when:

- `skills/legal-authority-research/SKILL.md` exists.
- The skill is authority-led, jurisdiction-led, and claim-led.
- The skill requires a jurisdiction record before legal research.
- The skill requires an authority hierarchy map before relying on sources.
- The skill requires atomic verification after each retrieval.
- The skill requires a claim/evidence ledger.
- The skill separates legal authority, secondary sources, market practice, and business risk.
- The skill blocks final legal advice and safe-to-sign answers.
- The skill discloses source-access and citator/currentness limitations.
- The skill has fixtures and pressure prompts for the fixture categories in the Research TDD And Evals section.
- The skill integrates with `legal-review-tdd`.

## Recommended Implementation Phasing

### Phase 1: Orchestrator Skill And Static Tests

- Add `legal-authority-research`.
- Add reference modules.
- Add static tests that ensure required sections and guardrails exist.

### Phase 2: Research Fixtures

- Add seeded legal research scenarios.
- Add expected claim ledgers.
- Add pressure prompts.

### Phase 3: Citation Verification Support

- Add script or documented workflow for extracting and verifying citations.
- For U.S. tests, use Eyecite/CourtListener-style expected behavior where possible.
- Clearly mark API-token-dependent checks as optional or integration tests.

### Phase 4: Jurisdiction Pack Interface

- Add source-strategy templates for U.S., UK, EU, India, and generic unknown jurisdiction.
- Do not claim comprehensive coverage.

### Phase 5: Integration With Document Review

- Update `legal-review-tdd` to invoke `legal-authority-research` for external legal questions.
- Add cross-skill fixtures where a document issue becomes a legal authority research task.

## Open Design Decisions For User Review

1. Should the first implementation include only public-source workflows, or should it explicitly support user-supplied paid-database excerpts?
2. Should the first jurisdiction pack be U.S. first because CourtListener/Eyecite are available, or should the framework stay jurisdiction-neutral until the user picks a target jurisdiction?
3. Should the output default to a lawyer-facing memo first, business/operator summary second, or always equal dual output like `legal-review-tdd`?

## Spec Self-Review

- Placeholder scan target: no placeholder instructions should remain.
- Scope check: this is a large skill with several reference modules, but it is one coherent subsystem: legal authority research.
- Ambiguity check: the main open decisions are listed explicitly for user review.
- Safety check: the design blocks final legal advice, unsupported legal propositions, invented jurisdictions, and unverified citations.
- TDD check: the design requires fixtures and pressure prompts before behavior-shaping skill text is treated as complete.
