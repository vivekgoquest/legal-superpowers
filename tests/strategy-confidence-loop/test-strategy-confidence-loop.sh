#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT_DIR"

fail() {
  echo "FAIL: $*" >&2
  exit 1
}

pass() {
  echo "PASS: $*"
}

assert_file() {
  local path="$1"
  [ -f "$path" ] || fail "missing file: $path"
}

assert_contains() {
  local path="$1"
  local needle="$2"
  grep -Fq "$needle" "$path" || fail "$path does not contain: $needle"
}

assert_executable() {
  local path="$1"
  [ -x "$path" ] || fail "file is not executable: $path"
}

run_skill_checks() {
  local skill="skills/strategy-confidence-loop/SKILL.md"
  assert_file "$skill"
  assert_contains "$skill" "name: strategy-confidence-loop"
  assert_contains "$skill" "description: Use when"
  assert_contains "$skill" "Are you 100% confident in this strategy? If not, find all possible loopholes,"
  assert_contains "$skill" "  suggest proper fixes and run this loop until you are factually 100% confident"
  assert_contains "$skill" "  in the  startegy"
  assert_contains "$skill" "Factually 100% confident means bounded by evidence"
  assert_contains "$skill" "Do not claim 100% confidence for open-ended"
  assert_contains "$skill" "loophole ledger"
  assert_contains "$skill" "Fix-And-Recheck Loop"
  pass "strategy-confidence-loop skill checks"
}

run_integration_checks() {
  local files=(
    "skills/brainstorming/SKILL.md"
    "skills/brainstorming/spec-document-reviewer-prompt.md"
    "skills/writing-plans/SKILL.md"
    "skills/writing-plans/plan-document-reviewer-prompt.md"
    "skills/verification-before-completion/SKILL.md"
    "skills/writing-skills/SKILL.md"
    "skills/requesting-code-review/SKILL.md"
    "skills/requesting-code-review/code-reviewer.md"
    "skills/receiving-code-review/SKILL.md"
    "skills/legal-document-review-tdd/SKILL.md"
    "skills/legal-authority-research/SKILL.md"
  )

  for file in "${files[@]}"; do
    assert_file "$file"
    assert_contains "$file" "strategy-confidence-loop"
  done

  pass "strategy-confidence-loop integration checks"
}

assert_executable "tests/strategy-confidence-loop/test-strategy-confidence-loop.sh"
run_skill_checks
run_integration_checks
