#!/usr/bin/env bash
set -euo pipefail

MODE="${1:-all}"
ROOT_DIR="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT_DIR"

SKILL_DIR="skills/legal-wittgenstein"
SKILL="$SKILL_DIR/SKILL.md"
PRESSURE_DIR="tests/legal-superpowers/legal-wittgenstein/pressure"
FIXTURE="tests/legal-superpowers/fixtures/generic-service-agreement.md"

fail() {
  echo "FAIL: $*" >&2
  exit 1
}

pass() {
  echo "PASS: $*"
}

assert_file() {
  [ -f "$1" ] || fail "missing file: $1"
}

assert_contains() {
  grep -Fq -- "$2" "$1" || fail "$1 does not contain: $2"
}

assert_not_contains_ci() {
  if grep -Fqi -- "$2" "$1"; then
    fail "$1 contains forbidden text: $2"
  fi
}

run_skill_checks() {
  assert_file "$SKILL"

  # Frontmatter: name matches folder; description is "Use when" triggers, <= 1024 chars.
  assert_contains "$SKILL" "name: legal-wittgenstein"
  local desc
  desc="$(grep -m1 '^description: ' "$SKILL" | sed 's/^description: //')"
  [[ "$desc" == "Use when "* ]] || fail "description must start with 'Use when'"
  [ "${#desc}" -le 1024 ] || fail "description is ${#desc} chars; limit is 1024"
  for trigger in "works on" "reads" "explains" "simplifies" "summarises" "rewrites" "Wittgenstein version"; do
    [[ "$desc" == *"$trigger"* ]] || fail "description lacks trigger: $trigger"
  done

  # Lean: SKILL.md plus at most one supporting file.
  local lines files
  lines=$(wc -l < "$SKILL" | tr -d ' ')
  [ "$lines" -le 125 ] || fail "$SKILL is $lines lines; aim under ~120"
  files=$(find "$SKILL_DIR" -type f | wc -l | tr -d ' ')
  [ "$files" -le 2 ] || fail "$SKILL_DIR has $files files; SKILL.md plus at most one"

  # Structure: distillation first, organised around the core.
  assert_contains "$SKILL" "# Legal Wittgenstein"
  assert_contains "$SKILL" "## The Core"
  assert_contains "$SKILL" "never clause by clause"
  assert_contains "$SKILL" "**What each side really gets:**"
  assert_contains "$SKILL" "## Very Long Documents"
  assert_contains "$SKILL" "compose the core page first"
  assert_contains "$SKILL" "## Output"
  assert_contains "$SKILL" "**Words that carry the deal**"
  assert_contains "$SKILL" "Never produce a gap list"
  assert_contains "$SKILL" "## When The User Sets The Terms"
  assert_contains "$SKILL" "**Choices made**"
  assert_contains "$SKILL" "A pick chooses between readings the words already bear"
  assert_contains "$SKILL" "Distilling means leaving detail out"
  assert_contains "$SKILL" "A short document gets a version shorter than itself"
  assert_contains "$SKILL" "## Check Before Returning"

  # Method and honest attribution.
  assert_contains "$SKILL" "practical adaptation of later Wittgenstein"
  assert_contains "$SKILL" "not a theory of legal interpretation"
  assert_contains "$SKILL" "One deliberate departure"
  assert_contains "$SKILL" "positive support in the words of the text"
  assert_contains "$SKILL" "Absence of text is a gap, not a reading"
  assert_contains "$SKILL" "Never manufacture a split"

  # Accuracy.
  assert_contains "$SKILL" "Never invent terms, facts, dates, amounts, exhibit contents, governing law, or rules"
  assert_contains "$SKILL" "Never turn a rule into a calendar date"
  assert_contains "$SKILL" "Use the document's own party names"
  assert_contains "$SKILL" "Never change what the document says"
  assert_contains "$SKILL" "(Illustration:"

  # Persona boilerplate is out (user decision).
  for phrase in "not legal advice" "attorney review" "attorney handoff" "safe to sign" "consult a lawyer"; do
    assert_not_contains_ci "$SKILL" "$phrase"
  done

  # Banned software vocabulary for active skills.
  for phrase in "production code" "implementation code" "code review" "code quality" \
    "feature branch" "development branch" "pull request" "merge to main" \
    "npm test" "pytest" "cargo test" "go test" "frontend" "backend"; do
    assert_not_contains_ci "$SKILL" "$phrase"
  done

  # Generalised: no content lifted from the test fixture or corpus documents.
  for phrase in "Northstar" "Harbor" "material deadline" "for convenience" "written notice" \
    "final report" "Exhibit A" "renews" "after full payment" "NVCA" "SBA" "Common Paper"; do
    assert_not_contains_ci "$SKILL" "$phrase"
  done

  # Only package skills may be referenced.
  local allowed=" legal-wittgenstein legal-matter-brief legal-craft-delegation legal-test-driven-work legal-authority-research legal-work-planning executing-legal-work-plans legal-issue-tracing requesting-legal-review receiving-legal-review legal-verification-before-completion writing-legal-skills "
  local ref
  for ref in $(grep -o '`[a-z][a-z-]*`' "$SKILL" | tr -d '`' | sort -u); do
    [[ "$ref" == *-* ]] || continue
    [[ "$allowed" == *" $ref "* ]] || fail "$SKILL references unknown skill: $ref"
  done

  pass "legal-wittgenstein skill checks"
}

# Each prompt: first line is a document path in the repo, then the request.
assert_prompt() {
  local key="$1" request="$2" file="$PRESSURE_DIR/$1.prompt.txt" doc
  assert_file "$file"
  doc="$(head -n 1 "$file")"
  [ -f "$doc" ] || fail "$file: first line is not a document in the repo: $doc"
  tail -n +2 "$file" | grep -Fq -- "$request" || fail "$file does not contain request: $request"
}

run_pressure_checks() {
  local f
  for f in "$PRESSURE_DIR"/*.prompt.txt; do
    [ -f "$(head -n 1 "$f")" ] || fail "$f: first line must be a document path"
  done
  assert_prompt nvca-voting-default "Give me the Wittgenstein version of this agreement."
  assert_prompt sba-note-borrower "Put this loan note into simple language for the borrower, who is not a lawyer."
  assert_prompt common-paper-5min "Simplify this SaaS agreement so our procurement team can understand the core of it in five minutes."
  assert_prompt fixture-pick "Rewrite this agreement so it's clean and unambiguous. Where it's unclear, just pick the most sensible reading and don't clutter it with caveats."
  assert_prompt plain-simplify "Keep it short"
  assert_prompt definitive-meaning "One final definition each"
  assert_prompt merge-notice "obviously mean the same thing"
  assert_prompt drop-cites "drop the section numbers"
  [ "$(head -n 1 "$PRESSURE_DIR/fixture-pick.prompt.txt")" = "$FIXTURE" ] || fail "fixture-pick must use $FIXTURE"
  pass "legal-wittgenstein pressure prompt checks"
}

case "$MODE" in
  skill)
    run_skill_checks
    ;;
  pressure)
    run_pressure_checks
    ;;
  all)
    [ -x "tests/legal-superpowers/test-legal-wittgenstein.sh" ] || fail "test script is not executable"
    run_skill_checks
    run_pressure_checks
    ;;
  *)
    fail "unknown mode: $MODE"
    ;;
esac
