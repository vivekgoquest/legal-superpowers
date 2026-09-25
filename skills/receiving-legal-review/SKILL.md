---
name: receiving-legal-review
description: Use when comments, a markup, a redline, an issues list, or review results come back on a legal document, clause, or argument, from an independent reviewer, the other side, a colleague or supervising lawyer, or the client; before accepting, rejecting, countering, or making a change a comment asks for; when told to accept all comments, take their changes, reject everything the other side sent, or overrule a reviewer; when a comment says a clause is unenforceable, void, a penalty, illegal, required by law, or market standard, or cites a case or statute; when the drafter disputes a reviewer's failing row; when a partner or the client says to just make a change; or when a comment is unclear, names no failing scenario, conflicts with the client's instructions, or asks the client to concede a position.
---

# Receiving Legal Review

## Overview

A comment on legal work is a proposition, not an instruction. The other side's comment argues for its client. A reviewer's failing row is a claim about the text. A colleague's view is a view. Only the client decides the client's positions.

**Core principle:** check every point against the text, the test table and the authority before anything changes. No performative agreement, no reflexive rejection. The text and the tests decide, not who sent the comment or how soon they want an answer.

## The Iron Law

```
NO CHANGE FROM A COMMENT UNTIL IT IS CHECKED AGAINST THE TEXT, THE TEST TABLE AND THE AUTHORITY
NO ACCEPTANCE OR REJECTION THAT IS NOT A ROW IN THE TEST TABLE
```

The test table from `legal-test-driven-work` is the matter's single record. Each point challenges a row's result, adds a row, or proposes text that is run against the rows. Its disposition is written in those rows. Keep no comments log or response memo beside it.

## Process

No brief or test table yet? Write them first (`legal-matter-brief`, `legal-test-driven-work`).

1. **Read all of it before responding.** Split the feedback into points, one proposition each, labeled by source ("Other side 1"). Quote the clause each point touches word for word, with its cite. A point that misdescribes the text (quotes words that are not there, names a term the document never uses) gets that said first. Feedback known only from someone's summary is labeled as reported: what the commenter quoted or cited stays unknown, and no misdescription call is made, until the markup is seen; ask for it. A reported point that can mean more than one change is run on each. Every line you write follows `legal-test-driven-work` (Text, not law; Fail or Blocked), with inferences labeled as `legal-verification-before-completion` sets out.
2. **Restate each point as a test:** the scenario and the result the commenter wants. Cannot restate it? It is unclear: ask, and hold every point linked to it, the clear ones included. A point that names no scenario the text fails ("add a standard indemnity", "tighten this") is asked for one; with none, it is a preference, or a commercial ask if it moves a position. A point that turns on an open word ("confidential", "material", "reasonable") goes to `legal-wittgenstein` first.
3. **Classify.** Split a point that is more than one class: a correct diagnosis whose proposed fix moves a position is a text point plus a commercial ask.

   | Class | What it claims | Checked against | Decided by |
   |---|---|---|---|
   | Text or fact | Our text fails a scenario, misquotes, breaks a cross-reference, or rests on a wrong fact; includes a reviewer's failing row | The quoted text, the file, the brief's facts | The text. If it fails, it fails |
   | Legal point | The law requires, forbids, or invalidates something | Authority verified current for the confirmed governing law at the relevant date, through `legal-authority-research` | The authority. Unverified means Blocked |
   | Commercial ask | Moves money, time, risk, scope, or rights | Our-objective rows; the brief's non-negotiables and fallbacks | The client (step 5: Client decision, with your recommendation). Until it concedes, our current text stands |
   | Preference | Different words, same legal effect | A rerun of the affected rows on the proposed words | The owning craft. If a row moves, it is a commercial ask |

4. **Verify.**
   - Grade each row on the current text first (`legal-test-driven-work`: Fail or Blocked; Dependent rows); a row whose answer a missing exhibit could supply links to that exhibit's row.
   - Run the proposed text, or the point's scenario, against every row it touches, and add the rows it brings, such as a their-reading row the suite missed. Name the point in each row's Evidence. State each Failure consequence after the exits, remedies and cross-references the document already gives.
   - Before rebutting a point, build the commenter's best case: run its scenario through the linked clauses (`legal-test-driven-work` step 4), cite them in its row's Evidence, and link their rows.
   - A legal claim is a law row (`legal-test-driven-work`, Text, not law). A cited authority is a lead: open it and check jurisdiction and currentness through `legal-authority-research`. No confirmed governing law, or no authority verified from official or free public sources: the row is Blocked. Never delete or rewrite a clause on an unverified legal claim, and never dismiss one either: verified, it is a Fail.
   - A fact asserted by the other side is their statement until the file or our side confirms it.
   - Searches as `legal-authority-research` step 7 sets out.
5. **Decide each point** and record it in the row's Result:
   - **Accept:** the text or fact point is confirmed, the legal point is verified, or the preference moves no row.
   - **Reject:** name the row that shows why. A rejection resting on a Blocked row is conditional: say what flips it.
   - **Counter:** a change that meets their stated concern, run on every row it touches. A counter that narrows or gives up any right in our current text, one failing on the file supplied included, is a concession, and a client decision.
   - **Client decision:** Blocked until decided. Give the options, each with its draft text (brackets for values the client supplies), whether it concedes, and the IDs of the rows it moves to Pass and to Fail (results stay in the rows); then your recommendation.
   - **Blocked:** name what unblocks it: verified authority, a confirmed fact, or the client decision.

   Work in this order: legal points; non-negotiables; risk allocation; mechanics; definitions and cross-references; wording.
6. **Route and rerun.** Each accepted change goes to the craft that owns the clause (`legal-craft-delegation`), which drafts it through `legal-test-driven-work` and reruns every row it touches; the parent does not redraft a craft's clause. A settled edit (`legal-matter-brief`) runs solo and still reruns its rows. Refresh the Wittgenstein version of the changed text (`legal-wittgenstein`). Then the fix-round run of `requesting-legal-review` (step 7), with its fallback and run labels, and `legal-verification-before-completion`.
7. **Respond** from the table (below).

## Who Sent It

| Source | Its points are | Handle |
|---|---|---|
| Independent reviewer (`requesting-legal-review`) | Results on quoted text | Rerun its scenario on the quoted clause. A reading outside the their-reading bounds of `legal-test-driven-work` (writing-legal-tests.md) is rejected with the clause that rules it out. A finding with no quote or test ID goes back for one |
| The other side | Arguments for their client | Checked like any point. Their facts stay their statements until confirmed |
| Colleague or supervising lawyer | Views, or directions on our position | A view on the text or the law is checked like any point. A direction on a position is an instruction: record who gave it |
| The client | Decisions on its own positions | Its comments on the text or the law are checked like any point |

## Client Decisions

- Conceding a position, accepting a risk, moving a non-negotiable or fallback, or changing the objective belongs to the client: put it as a client decision (step 5).
- A fallback the brief already approves is applied without asking; say which one.
- Once decided, rewrite the affected our-objective row openly with who decided, the reason and the date ("Conceded on the user's instruction; client instruction not seen"), and rerun it. User acting for the client and silent on its instructions? Ask once and record the answer: an accuracy label, not a gate. A decision changes the objective, never a result: a row that still fails on the law or the text stays Fail.

## When Told to Accept All, Reject All, or Overrule

- **"Accept all their comments", or any push to close or send:** an instruction about the outcome, not leave to skip the check. Open with the verdict line for that goal (`legal-test-driven-work`, Readiness Verdicts); its deciding rows include rows no comment raised. Then per point: its class, its verdict, and the IDs of the rows accepting it moves to Pass and to Fail. Never call the goal unaffected while a row is open. Each commercial ask is a client decision (step 5), the accept-all wording among its options. End with one question, concede all anyway or send the recommended responses (and has the client instructed?); the markup, if unseen, and each document the file lacks go in the ask (`legal-matter-brief`, Delivery order). If accept all stands, make the changes through the owning crafts and record each concession as above. A legal claim accepted this way stays recorded as unverified.
- **"Reject everything, they're the other side":** run the same check. Rejecting a commercial ask keeps our current text, which is the default; conceding any part of it is the client's call. A correct text or legal point is correct whoever made it; rejecting it leaves our own draft failing that row. Say which points to reject, which are right, and what fixing them takes, which may differ from the fix they proposed.
- **"I drafted it; overrule the reviewer":** a result is a fact about the text, not a vote, and whoever drafted a clause never grades it. Rerun the reviewer's scenario on the quoted text. If the row fails, it stays Fail and goes back to the owning craft. The user may still send the draft; the row goes with it, showing Fail.

## Responding

**To the user:** per point, the class, the verdict, the row IDs, and what is needed; each result and its evidence appear once, in the table. No "You're absolutely right", "Great point", or thanks. When a comment is right, state the fix: "Confirmed: §2.4 uses 'Products', which is undefined. TM-2 Fail; sent to the trademark lawyer craft." If you pushed back and were wrong, say what you checked, correct the row, and move on.

**To the other side:** read off the table, never the table itself. Never reveal objectives, fallbacks, non-negotiables, the client's reasons, or internal analysis. Give each point a reason they may see: the text and verified law. While the law row is Blocked, answer a legal claim with what the text says and does not say, and draw no legal conclusion from it; never describe a clause in a way a linked clause undercuts. Never state what a comment contains (its wording, citations or authority) while it is known only as reported: "We have not seen authority supporting this comment; if you rely on any, please send it." Never tell the other side a document is missing or incomplete when only the file supplied lacks it; ask the user for it before the reply goes out.

## Red Flags: Stop and Check the Point

- "Agreed" or "accepted" before the clause is quoted
- A clause deleted or rewritten because a comment calls it unenforceable, with no verified authority
- A rebuttal written before the commenter's best case was run through the linked clauses
- A point rejected because of who sent it
- A failing row marked Pass because someone, its drafter included, disagrees
- A concession with no decision, or recorded as the client's when only the user gave it
- Telling the user they can close or send while rows Fail or are Blocked
- An option, counter or accept-all shown with only its passes, or only its failures
- "Nothing says", "owns nothing" or "fails as drafted" where only the file supplied is silent
- Clear points changed while linked unclear points wait
- The parent redrafting a craft's clause
- A comments log or response memo kept beside the table
- A reply to the other side that shows fallbacks or internal rows, says what a reported comment cites, or calls a document missing that only the file supplied lacks
- A change made with no rerun and no refreshed Wittgenstein version

## Rationalizations

| Excuse | Reality |
|---|---|
| "Opposing counsel knows the law." / "They cited a case." | Their comment argues for their client. A legal claim is a law row, Blocked until verified; a citation is a lead. |
| "The user said accept all, so the client decided." | The user's instruction is recorded as the user's. Whether the client instructed is a fact: ask once, label it. |
| "Accepting everything gets us closed today." | Rows no comment raised can still fail, and a concession nobody decided reopens the deal. Say which rows stay open first. |
| "It's a small change; just make it." | A shorter notice period or one word of scope moves a position. Run it on the rows. |
| "They're the other side, so it's wrong." | A correct point is correct whoever made it. Rejecting it leaves our draft failing. |
| "The partner says so." | A view on the law or the text is checked like any point. A direction on our position is recorded as the partner's. |
| "I drafted it, I know what it means." | The drafter never grades. The result comes from the text. |
| "Agreeing keeps the negotiation friendly." | Performative agreement is a concession nobody decided. |

## Example (illustrative)

We act for the licensor under a trademark license that names its governing law. Licensee's counsel sends three points: (1) the royalty audit in §11 breaches data protection law and must be deleted; (2) royalty reports should be quarterly, not monthly; (3) §2 uses "Products" and "Licensed Products" interchangeably. The rows they touch (TM: trademark lawyer craft; COM: commercial contracts lawyer craft):

| ID | Source | Rule or objective | Scenario | Expected result | Evidence | Failure consequence | Result |
|---|---|---|---|---|---|---|---|
| TM-7 | The law | The §11 audit is lawful under the governing law | Licensor audits the licensee's sales records | Audit lawful | Licensee point 1, no authority cited; §11.1 "books and records relating to Net Sales" | Audit right lost | Blocked: sent to `legal-authority-research` |
| TM-3 | Our objective | Licensor can verify royalties | Licensee under-reports Net Sales | Licensor audits and recovers the shortfall | §11.1; brief: audit is non-negotiable | Under-reporting goes undetected | Pass (provisional; independent run pending). Point 1's deletion fails it: reject unless TM-7 comes back Fail, then client decision |
| COM-4 | Our objective | Monthly cash visibility | Sales spike in the first month of a quarter | Licensor sees it that month | Licensee point 2; brief fallback: quarterly reports with monthly sales data | Late visibility | Point 2's text fails. Counter with the approved fallback; rerun: Pass (drafter; independent run pending) |
| TM-2 | Their reading | One defined product set | Licensee calls an unlicensed variant a "Product" under §2.4 | Only Licensed Products carry the mark | Licensee point 3; §2.1 "Licensed Products"; §2.4 "Products", undefined | License scope disputed | Fail, confirmed. Accept; sent to the trademark lawyer craft; rerun: Pass (drafter; independent run pending) |

Point 1 was two points: a legal claim (TM-7) and a commercial ask (TM-3). Only the second is the client's to concede.
