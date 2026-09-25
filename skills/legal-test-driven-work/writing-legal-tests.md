# Writing Legal Tests

Read this before writing or changing the tests for a legal document or argument.

## Name the Break

Before keeping a test, answer:

1. What reading, event, or drafting change would make this test fail? Cannot name one: it is not a test.
2. Which source sets the expected result: the law, our objective, or their reading?
3. Does the result matter to the side we act for? No: drop it.
4. Would a differently worded clause with the same legal effect still pass? No: it is a wording check, not a legal test. Test the effect.

A test that does not apply is not written.

## The Test Statement

> **Given** [facts and prerequisites], **when** [triggering event], **then** [actor, result, deadline, evidence, consequence], because [source].

Example: Given an undisputed invoice with the required records, when the customer receives it, then payment is due within 30 days, and a disputed amount may be withheld only through the stated dispute notice while the undisputed balance stays payable, because the client needs predictable cash flow without waiving genuine disputes.

This tests a mechanism. It does not prescribe clause text.

## The Three Sources

- **The law:** mandatory or default authority for the confirmed jurisdiction at the relevant date, verified through `legal-authority-research`. Market practice, model forms, and reviewer preference are not law.
- **Our objective:** express instruction, term sheet, agreed negotiating point, approved fallback, and confirmed operations (who will actually perform, verify, and enforce).
- **Their reading:** the most hostile reading the words can bear that no other clause rules out on its face, from a counterparty or a court. Write it as what they can argue; whether it wins is a law row. Its expected result asks only that the text give a determinate answer that holds against it: an outcome our side wants (a cure period, payment on exit) is an Our objective row, "Our objective (assumed)" if the client never stated it. A clause that seems to settle an open word elsewhere gets its own row, run on the text. Inconsistent definitions, broken cross-references, ambiguity, and a missing exhibit, schedule, or signature page the text relies on belong here, because that is what a hostile reader uses.

Do not promote a source above its place. A preference is not an objective until the client adopts it.

## Atomic, Not Artificial

One test proves one outcome. Split a test when its parts could pass or fail on their own. Keep a mechanism together when splitting it would hide how it works: due date, dispute notice, and payment of the undisputed amount are one payment outcome.

Avoid tests for every sentence, tests that restate the clause, vague goals ("indemnity is robust"), tests detached from our side and this deal, duplicates that report one defect twice, and a suite so large it buries the few material failures.

## Scenarios That Change the Result

For each material mechanism, pick the scenarios that could change the outcome:

- ordinary performance;
- nonperformance, delay, or partial performance, including notice in advance that performance will not come;
- the main exception or carve-out;
- the case most favorable and most adverse to our side;
- a timing or notice boundary;
- termination, expiry, and survival;
- conflict with another clause, schedule, or incorporated document;
- a jurisdiction-specific edge case supported by verified authority.

Use scenarios grounded in the deal facts, the authority, or a material consequence, not every case that is imaginable.

## Where Tests Hide

Walk the document against these families. Absence is a trigger: a data contract silent on personal data still needs the data tests.

- **Validity and execution:** authority and capacity to sign, approvals, consents, signatures, dates, witnesses, filings, formalities.
- **Document set:** exhibits, schedules, amendments, side letters, referenced policies, versions; entire agreement; definitions, precedence, cross-references.
- **Governing law and disputes:** governing law, forum, arbitration, limitation periods, remedies, enforcement.
- **Mechanics:** actor, trigger, act, standard, deadline, evidence, exception, consequence for each obligation; deliverables, acceptance, service levels, change control; subcontracting and the parties' relationship (independent contractor).
- **Money:** amount, invoicing, due date, late payment, tax, setoff, currency, audit.
- **Risk allocation:** warranties, indemnities, caps, carve-outs, exclusions, insurance.
- **Lifecycle:** term, renewal, cure, suspension, termination, survival, post-termination duties.
- **IP and data:** ownership, licenses, confidentiality, personal data, security.
- **Compliance:** sector rules, sanctions, anti-bribery, employment, consumer.
- **Edge cases:** insolvency, force majeure, change of control, assignment, invalid provision.

## Exact-Text Tests

Test exact words only when they are prescribed by verified law, a fixed negotiated phrase, a required notice, legend, or execution formula, a number, date, or cross-reference, or text the user has protected. Record where the wording comes from and what variation is allowed.

## The Evidence Cell

- **Document text:** a short quote with its cite.
- **Instruction or fact:** its source, labeled as `legal-verification-before-completion` (Work-Product Checks) sets out.
- **Authority:** the Evidence cell of `legal-authority-research`.

## Review the Suite Before Drafting

- Drop tests with no material consequence; merge duplicates.
- Find tests whose expected results conflict, and put the conflict to the client.
- Check every law row against `legal-authority-research`.
- Check the suite covers the brief and nothing outside it.
- Flag tests that need a client decision.

After drafting, run every affected test against the final text and record the evidence. A clean scan for defined terms and cross-references does not replace running the scenarios through the document as a whole.
