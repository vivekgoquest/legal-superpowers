# Jurisdiction Routing

Build a jurisdiction record before researching legal authority.

```yaml
jurisdiction:
  status: confirmed | assumed | unknown | mixed
  governing_law: stated law, user assumption, or not provided
  forum: stated forum or not provided
  regulatory_regime: named regime or not provided
  source_basis: document | user | assumption | absent
  effect_on_research: how the status limits conclusions
```

## Routing Rules

- Confirmed: source text or user instruction identifies the governing law, forum, or regime.
- Assumed: user asks for a jurisdiction hypothetically. Label every proposition as assumed.
- Unknown: do issue mapping only, or comparative research labeled hypothetical.
- Mixed: split the research lanes by governing law, forum, regulatory regime, or affected party.

Do not collapse mixed jurisdictions into one answer. Do not infer governing law from style, address, currency, court venue boilerplate, or party nationality without saying it is an assumption.

## Required Output

Every research packet must include:

- Jurisdiction status.
- Source basis for the status.
- Research lanes created.
- Conclusions blocked by missing or mixed jurisdiction facts.
- Questions for counsel.
