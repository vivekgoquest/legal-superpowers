# Legal Output Schema

Use this schema for source-grounded legal-document review work product.

## 1. Legal-Work Objective

- Requested work.
- User decision or use case.
- Audience: lawyer-facing, business/operator-facing, or both.
- Known jurisdiction, governing law, or forum.
- Known missing facts.

## 2. Source/Document Map

For each source:

- Document name or filename.
- Date if visible.
- Parties if visible.
- Apparent document type.
- Execution or signature status if visible.
- Attachments, schedules, exhibits, or amendments.
- What the document appears to control.
- Missing related documents suggested by the source set.

## 3. Plain-English Legal Spec

State what the review will check, what output will be produced, what counts as source support, and what uncertainty will remain open.

## 4. Expected Review Tests

List the tests the final work product must satisfy. Include citation, uncertainty, missing-information, dual-audience, and attorney-handoff tests.

## 5. Lawyer-Facing Findings

For each issue:

- Issue title.
- Issue category.
- Source document and location.
- Source text or concise paraphrase.
- Why it matters.
- Priority.
- Assumptions.
- Missing information.
- Questions for counsel.

## 6. Business/Operator Summary

- Plain-English summary.
- Key risks.
- Deal blockers or decision points.
- Missing documents or facts.
- Questions to ask counsel.
- Practical next actions that are not legal advice.

## 7. Missing Information

List missing facts, documents, exhibits, signatures, schedules, amendments, governing-law information, and related materials.

## 8. Attorney-Review Handoff

- Issues counsel should review.
- Decisions the user needs to make.
- Missing documents or facts.
- Jurisdiction, governing-law, or forum assumptions.
- Conclusions not confirmed by source documents.

## 9. Self-Check

For each expected review test, mark:

- `Pass` when satisfied.
- `Gap disclosed` when not fixable from the provided source set.
- `Needs revision` when the work product must be corrected before delivery.
