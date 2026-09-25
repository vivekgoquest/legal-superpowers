---
name: writing-legal-skills
description: Use when creating a new skill for legal work or changing an existing one, including its description, rules, examples, or supporting files; when a skill gave a wrong, weak, hedged, or invented result on a matter, or did not fire when it should have; when writing or editing pressure prompts, or evaluating skills on fixture or corpus agreements; when deciding whether a skill works or can be relied on; when asked for a new skill covering one legal field, clause type, or document type; or when told to skip testing, just write the SKILL.md, make a quick wording tweak without rerunning, grade the runs yourself, skip the judges or the corpus, or write several skills at once.
---

# Writing Legal Skills

## Overview

A skill is tested the way a clause is. The pressure scenario is the test, the skill is the text under test, and what an agent does with and without it is the result. Write the scenario, watch an agent fail it without the skill, write the skill, and watch the behavior hold under pressure and under independent judges.

**Core principle:** if you did not watch an agent fail without the skill, you do not know what the skill teaches, or whether it teaches anything.

**Violating the letter of the rules is violating the spirit of the rules.**

"Test" means three things in this package. Legal tests (the test card and test table of `legal-test-driven-work`) are the product. Work-product checks belong to `legal-verification-before-completion`. This skill covers the third: skill pressure tests, which show whether a skill makes an agent do the legal work right when pushed not to.

## The Iron Law

```
NO SKILL WITHOUT A FAILING PRESSURE SCENARIO FIRST
NO EDIT WITHOUT RERUNNING THE SKILL'S SCENARIOS
```

Wrote the skill first? Set it aside. Run the baseline without it and write the skill from what failed, not from the draft; a draft kept "as reference" gets adapted and passes the scenarios written around it. This holds for new skills and for every edit: a description phrase, one red flag, an example, a supporting file.

## The Pressure Scenario

| Part | Content |
|---|---|
| Material | The fixture (`tests/legal-superpowers/fixtures/generic-service-agreement.md`), a corpus agreement (`tests/legal-superpowers/corpus/<type>/`, indexed in its README), or, for a skill about skills, this package |
| Position | Whom the agent acts for in the transaction, and against whom. Leave it out only when the missing side is the pressure, or when the material is this package |
| Pressure | What pushes the agent to skip the discipline. Combine three or more for a discipline skill |
| Expected behavior | What a Pass must show, written before the first run from the material's own text, applying the work-product checks of `legal-verification-before-completion` and the linked-clause rows of `legal-test-driven-work` step 4 to the clauses it relies on, conditions included |
| Result | Pass, Fail, Partial, or Blocked, with the output quoted |

One scenario per file, at `tests/legal-superpowers/<skill>/pressure/<short-name>.prompt.txt`. The file holds only what the user would type: a first line with the material's path unless it is the fixture or this package, then position, task, and pressure in a legal professional's words. Never name the skill under test: its description must make it fire. Expected behavior and results go in the run record. Owner not yet known? File it under the likeliest owner and move it after RED.

| Pressure | The user's words |
|---|---|
| Time | "The client call is in ten minutes." |
| Authority | "The partner already gave me these citations." |
| Sunk cost | "I already redrafted Section 6." |
| Cost | "Just use one general contracts lawyer. It's cheaper." |
| Shortcut | "Skip the tests, just give me the clause." "Don't ask me any questions." |
| Assumption | "Assume New York law." "Exhibit A is our standard SOW." |
| Cosmetic | "I need an all-green table." |
| Confidentiality | "Search the web however you need to." |

Make the agent act ("Redline this for us today"), never recite ("What does the skill say?"). A quiz shows the agent read the skill, not that it follows it.

## The Cycle

1. **Find the owner.** Name the failing behavior and the skill that owns it. The package has no skill per legal field: indemnity, tax, or licensing expertise is a craft chosen at runtime (`legal-craft-delegation`) and tested through `legal-test-driven-work`. A failure is almost always a gap in an existing skill. Write a new skill only when the baseline fails and no existing skill can own the fix.
2. **Write the prompts first.** Three or more for a discipline skill, each combining pressures, before any skill text. The fixture carries seeded gaps; its expected-findings file predates these conventions, so write expected behavior from the text, not from that file. Corpus agreements bring length, real parties, redactions, and blanks.
3. **RED: run without the skill.** One fresh agent per prompt, the same material, the rest of the package installed as skills. For an edit, the baseline is the current version. Record what the agent did and its rationalizations word for word. Baseline passes? There is nothing to fix: "no change needed". Stop.
4. **GREEN: write the smallest skill that fixes those failures.** Address what you saw, not what you imagine. Match the form to the failure. Apply the package conventions.
5. **Rerun with the skill.** Same prompts, same material, fresh agents, the whole package installed, three or more runs per prompt. Read every output. One pass can be luck. A run where the skill never loaded is a description failure: fix the triggers, not the body.
6. **Break it.** Independent judges who did not write the skill get each run through [judge-brief.md](judge-brief.md) and try to fail it; each also writes one new prompt aimed at a weak point. Run those prompts too. Whoever wrote the skill never grades it.
7. **REFACTOR: close each hole.** Each new failure gets an explicit counter: a rule, a red flag, a rationalization row in the agent's own words, or a sharper description trigger. Ask the failing agent how the skill could have made the right choice clear: "it was clear" means strengthen the core rule; a missing line means add it; a missed section means move it up. Rerun every prompt for the skill, not only the one that failed. Stop when a round of judges finds no new failure.
8. **Corpus evaluation.** For a skill that shapes work on documents, take corpus agreements, take a side in each, and run the package for that side. Judges check that the result works in that party's favor and invents nothing. Run at least one agreement from both opposing sides: the same findings and changes for both parties mean the skill is not taking a side. One agent per agreement and side, separate judges, an orchestrated fan-out with no cap.
9. **Report the run record:** one row per scenario with its prompt, expected behavior, baseline result and quoted rationalization, with-skill results, and the judges' findings, each Pass, Fail, Partial, or Blocked. A scenario never run is Blocked with its cause (no subagent tool, user direction, environment), never Pass; all Blocked for one cause is one line. Name steps, never their numbers ("the corpus evaluation", not "step 8"). The package keeps the prompt files; run outputs stay in a working folder outside it.

**No subagent tool?** A baseline run by the agent writing the skill is contaminated. Give the user the prompt files (no file tool: each prompt's text inline under its target path) and the steps to run each in a fresh session, and report those scenarios Blocked until the results come back.

**Told to skip testing?** They want the result fast. Write the prompt files and run the baselines in parallel in the same turn, without stopping to ask first. Deliver first what the baselines yield: "no change needed" when they pass; when they fail, the edit to the owning skill, or a new SKILL.md only when no existing skill can own the fix. Then, in the reply, one or two lines per scenario and one line for all Blocked on one cause; the full expected behavior stays in the run record file. If the user, told that an untested skill teaches guesses, still directs no runs, report every scenario Blocked, "not run (user direction)", then write the skill. A skill per legal field reverses the package's accepted decision that experts are discovered at runtime, with no skill per field: say so first, in one line; if the user still directs it, record the reversal in the goal spec and in the skill set of `tests/legal-superpowers/test-skills.sh`, then write the skill.

## Match the Form to the Failure

| Baseline failure | Right form | Wrong form |
|---|---|---|
| Knows the rule, skips it under pressure | Core rule, red flags, rationalization table | Soft advice ("consider...") |
| Complies, but the output has the wrong shape | A recipe: the output's parts, in order | A list of don'ts |
| Leaves out a required element | A required slot in the template it fills | A reminder in prose |
| Behavior should depend on a condition | A conditional on something observable ("if the brief names the side") | A blanket rule with exemptions |

No nuance clauses ("don't X unless it matters"); they reopen the negotiation. A real exception gets its own conditional.

## Package Conventions

Check every skill against these before the rerun:

- **Frontmatter:** `name` matches the folder. `description` starts "Use when" and lists only triggering situations (the tasks in the words lawyers use, the symptoms, the words users type when pushing past the discipline), never the workflow, in at most 1024 characters. There are no hooks or routers: the description alone makes the skill fire. A description that summarizes the workflow gets followed instead of the skill.
- **Names and vocabulary:** other skills by exact name, in backticks, no namespace prefix, and only skills that exist in the package. The package's words, never a synonym: test card, test table, craft, craft brief, Wittgenstein version, Pass, Fail, Partial, Blocked, open Pass, run label, Not supplied, Clock line.
- **One record:** the test table is the matter's record. No skill creates a separate issues list, ledger, memo, or packet.
- **Wittgenstein version:** every skill that works on a document delivers one for the final text, through `legal-wittgenstein`.
- **Direct answers:** users are legal professionals, for any legal purpose. No disclaimers that the work is not advice, no instruction to consult or hand off to a lawyer, no declined verdicts. Verdicts come first, derived from the evidence. A verdict scoped to what was read ("No indemnity in the main text as supplied; Schedule 2 Not supplied; default-law recovery Blocked") is a verdict, not a declined one; a bare "No" that outruns the documents is an invention.
- **Accuracy:** a skill points to the accuracy rules by owner (work-product checks: `legal-verification-before-completion`; grading and Text, not law: `legal-test-driven-work`; jurisdiction: `legal-authority-research`) and never restates them.
- **One owner per rule:** each rule, label and field value lives in the skill that owns it. Another skill, or a brief or prompt sent to a subagent, points to it in one line by skill name (a subagent brief also gives the file path) and copies only matter data (the brief's governing-law, external-search and Clock lines). A second or conflicting copy is a defect, even one that agrees today.
- **No material facts:** never put fixture or corpus facts (party names, clause numbers, a document's wording or gaps) into a skill. Examples are generic, and a generic example never sits in quotation marks where it could be taken for a document's words.
- **Resources:** no cap on fan-out. No paid research database: official and free public sources only.
- **Lean:** SKILL.md under about 150 lines. A supporting file only for a template the agent fills or heavy reference. Legal vocabulary only: translate the software terms of an upstream source.
- **Porting an upstream Superpowers skill:** keep its core rule, ordered process, red flags, and rationalization table, translated into legal work.

Mechanical rules are checked by script, not by judges: `bash tests/legal-superpowers/test-skills.sh` checks the skill set, frontmatter, skill references, banned software-workflow phrases, and that each skill has pressure prompts. Run it and quote what it prints; never predict its result. Check length with `wc -l`.

## Red Flags: Stop and Go Back to RED

- Skill text written before any baseline run
- "It's only a wording change, no need to rerun"
- Baseline and rerun on different prompts or material
- A prompt that names the skill under test, or quizzes instead of asking for work
- A prompt on a document with no position, when the side is not the pressure
- The author grading its own runs
- One passing run called done
- A description that summarizes the workflow
- A fix that makes the agent hedge, decline a verdict, or hand off
- A corpus redaction, blank, or published default selection misread (filled in, read as a drafting gap, or treated as agreed; a default applies if kept), or a caption or label read as settling what its clause does, or dismissed where another clause gives it effect
- An expected behavior softened so a run passes, or covering fewer clauses than the material links to the ones it quotes
- Several skills written before the first is tested
- Judges or corpus runs cut to save cost

**All of these mean: stop, go back to RED, and run the scenarios.**

## Rationalizations

| Excuse | Reality |
|---|---|
| "The skill is obviously clear" | Clear to its author is not clear to an agent with a client call in ten minutes. Run it. |
| "I know what agents get wrong" | Then the baseline will show it. A skill written from guesses fixes guesses. |
| "It's only a wording change" | The wording is the skill. Rerun its scenarios. |
| "It passed once" | One run can be luck. Three or more runs, then judges try to break it. |
| "I read the outputs; they look fine" | The author reads what it meant to write. Independent judges grade. |
| "Name the skill in the prompt so it loads" | In the field nothing names it. If the description does not fire it, the skill does not exist. |
| "The fixture passed, the corpus is overkill" | The fixture is short and seeded. A long agreement for a real party shows whether the skill takes a side and invents nothing. |
| "A caveat makes the skill safer" | Hedging is a failure here. The fix is evidence in the test table, not a disclaimer. |
| "This field needs its own skill" | Fields are crafts chosen at runtime. Run the baseline with the existing skills first. |
| "Soften the expected behavior; it's an edge case" | Revise the skill. Change an expectation only when it was wrong, and say why in the run record. |
| "Judges are expensive" | No cap on fan-out. An untested skill costs every matter that uses it. |
| "I'll write all the skills, then test them together" | One untested skill hides another's failure. Test each before the next. |
