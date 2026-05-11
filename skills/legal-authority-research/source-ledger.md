# Source Ledger

The source ledger records provenance for every source used in the research packet, including access timestamp, retrieval query, source version, and confidentiality status.

## Required Fields

```yaml
source_id: S-001
title: source title
citation_or_identifier: citation, URL, docket, statute section, or document name
source_type: case | statute | regulation | guidance | secondary | market-practice | background | user-supplied
jurisdiction: source jurisdiction
authority_level: binding | persuasive | secondary | market-practice | background | unknown
access_timestamp: ISO 8601 timestamp or local run date
retrieval_query: search query, database query, or local document path
provenance: official source, public database, paid database excerpt, user-supplied document, or open web
source_version: effective date, version date, publication date, or unknown
confidentiality_status: public | anonymized | confidential-local-only | user-authorized-external
sanitized_query_used: yes | no | not-applicable
opened_or_inspected: yes | no
pinpoint_checked: yes | no
currentness_checked: yes | no | citator-unavailable
limits:
  - source-access, coverage, currentness, or citation limits
```

## Rules

- A source absent from the source ledger cannot support a confirmed claim.
- A source marked opened_or_inspected: no cannot support a confirmed claim.
- A source with confidential facts may be used externally only when confidentiality status records user authorization and the retrieval query was sanitized when possible.
- Public database coverage limits must be disclosed in the source ledger and the final packet.
