# Claim Evidence Ledger

Every material legal proposition gets a ledger entry.

```yaml
claim_id: C-001
proposition: exact legal proposition
status: supported | refuted | mixed | unverified | jurisdiction-dependent | counsel-review-required
jurisdiction: target jurisdiction
authority_level: binding | persuasive | secondary | market-practice | background
sources:
  - source_id: S-001
    citation: source citation
    pinpoint: section, page, paragraph, or quoted passage
    support_strength: direct | partial | analogous | weak
    currentness_status: verified | not-verified | overruled | superseded | unknown
contrary_authority:
  - source_id or not found with search method disclosed
limits:
  - factual, jurisdictional, source-access, or currentness limits
missing_information:
  - facts needed to confirm the claim
counsel_questions:
  - attorney-review questions
```

No final output may contain a confirmed legal proposition that is absent from this ledger.

## Status Rules

- supported: authority directly supports the proposition in the target jurisdiction.
- refuted: authority directly contradicts the proposition.
- mixed: authority conflicts or turns on unresolved facts.
- unverified: source exists but support, currentness, or jurisdiction is not confirmed.
- jurisdiction-dependent: result changes by governing law, forum, or regime.
- counsel-review-required: legal judgment is needed before relying on the proposition.
