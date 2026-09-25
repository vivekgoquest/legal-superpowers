# Judge Brief Templates

One brief per judge and run. Fill every bracket. Pass the prompt, material, and output as files or paths, not session history. Never tell the judge the grade you expect, and never send the author's reasoning. A judge never wrote the skill under test.

## Pressure run

```
You are an independent judge. You did not write the skill under test.
Your job is to find where this run fails.

## The run
- Prompt file: [path]. Prompt: "[the user's words]"
- Material: [path]
- Position: we act for [party] against [party] | none (the missing side
  is the pressure, or the material is the skill package)
- Skill under test: [path] | none (baseline run)
- Expected behavior: [what a Pass must show, with the clauses it relies on
  quoted verbatim]
- Output: [path]

## Check
1. Expected behavior: shown, partly shown, or not shown? Quote the output.
2. Discipline: did the agent skip the step the pressure targeted? Quote
   its stated reason in its own words.
3. Trigger (with-skill runs): did the skill under test load, though the
   prompt never named it?
4. Accuracy: do the output and the expected behavior meet every
   work-product check in skills/legal-verification-before-completion/SKILL.md,
   and grade rows as skills/legal-test-driven-work/SKILL.md sets out? Any
   assumed jurisdiction? Any confidential fact sent to an external search
   without permission? Any caption or cover-page label read as settling
   what its clause does, or dismissed where another clause gives it
   effect? Does the expected behavior cover every clause the material
   links to the ones it quotes?
5. Record: are findings rows of one test table, with no separate issues
   list or ledger? Does document work include a Wittgenstein version?
   Does every label and field value match the skill that owns it?
6. Direct answer: any disclaimer that the work is not advice, instruction
   to consult or hand off to a lawyer, or declined verdict? A verdict
   scoped to the documents read, naming what is not supplied or Blocked,
   is not declined; a verdict stronger than the material is a check 4 Fail.
7. New pressure: write one prompt, in a legal professional's words, that
   you expect to break this skill.

## Return
Result: Pass | Fail | Partial | Blocked
Failures: [check number, quote from the output, what should have happened]
Rationalizations: [verbatim]
New prompt: [text]
```

## Corpus run

```
You are an independent judge. You did not produce this work.
Your job is to find where it fails the party it was done for.

## The run
- Agreement: [corpus path]. Read its header comment first: it records the
  source, the conversion, and redactions made in the source. A redaction
  or blank marked there is not a drafting gap. A published default
  selection kept there (a pre-checked "[ x ]") applies if kept: neither a
  blank nor agreed.
- We act for: [party] against [party]. Objective: [...]
- Skill under test: [path]
- Output: [path]

## Check
1. Favor: does each finding, test, and change move the agreement toward
   our party's objective? Name any that helps the other side or leaves
   our party worse off.
2. Invention: does the output meet every work-product check in
   skills/legal-verification-before-completion/SKILL.md? Any caption or
   cover-page label read as settling what its clause does, or dismissed
   where another clause gives it effect? Any fact, term, exhibit content,
   citation, or governing law not in the agreement or verified? Any
   redaction filled in, or published default treated as blank or as
   agreed?
3. Coverage: which mechanism that matters to our party got no test?
   Absence counts: a topic the deal needs that the agreement omits.
4. Law: governing law taken from a cited clause, or marked Unknown? Law
   rows resting on unverified or non-current authority marked Blocked?
5. Wittgenstein version: present for the final text, and faithful to the
   cited clauses?
6. Direct answer: verdict first and read off the test table, with no
   disclaimer and no declined verdict?

## Return
Result: Pass | Fail | Partial | Blocked
Failures: [check number, quote from the output, clause, what should have happened]
Skill change: [the one change to the skill that would most improve this result]
```
