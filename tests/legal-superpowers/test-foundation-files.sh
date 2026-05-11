#!/usr/bin/env bash
set -euo pipefail

MODE="${1:-all}"
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

assert_executable() {
  local path="$1"
  [ -x "$path" ] || fail "file is not executable: $path"
}

assert_contains() {
  local path="$1"
  local needle="$2"
  grep -Fq "$needle" "$path" || fail "$path does not contain: $needle"
}

assert_not_contains() {
  local path="$1"
  local needle="$2"
  if grep -Fq "$needle" "$path"; then
    fail "$path contains forbidden text: $needle"
  fi
}

assert_count_at_least() {
  local glob="$1"
  local minimum="$2"
  local count
  count=$(find ${glob%/*} -type f -name "${glob##*/}" 2>/dev/null | wc -l | tr -d ' ')
  [ "$count" -ge "$minimum" ] || fail "expected at least $minimum files matching $glob, found $count"
}

run_mapping_checks() {
  local file="docs/legal-superpowers/original-superpowers-mapping.md"
  assert_file "$file"
  assert_contains "$file" "# Original Superpowers to Legal Superpowers Mapping"
  assert_contains "$file" 'using-superpowers'
  assert_contains "$file" 'using-legal-superpowers'
  assert_contains "$file" 'test-driven-development'
  assert_contains "$file" 'legal-review-tdd'
  assert_contains "$file" 'verification-before-completion'
  assert_contains "$file" 'legal-verification-before-completion'
  assert_contains "$file" "Preserved Discipline"
  assert_contains "$file" "Legal Adaptation"
  pass "mapping checks"
}

run_readme_checks() {
  local file="docs/legal-superpowers/README.md"
  assert_file "$file"
  assert_contains "$file" "# Legal Superpowers"
  assert_contains "$file" "plain-English legal spec"
  assert_contains "$file" "expected review tests"
  assert_contains "$file" "attorney-review handoff"
  assert_not_contains "$file" "safe to sign"
  pass "readme checks"
}

run_skill_checks() {
  local skill="skills/legal-document-review-tdd/SKILL.md"
  assert_file "$skill"
  assert_contains "$skill" "name: legal-document-review-tdd"
  assert_contains "$skill" "description: Use when"
  assert_contains "$skill" "# Legal Document Review TDD"
  assert_contains "$skill" "Plain-English Legal Spec"
  assert_contains "$skill" "Expected Review Tests"
  assert_contains "$skill" "Source-Grounded Review"
  assert_contains "$skill" "Dual Output"
  assert_contains "$skill" "Attorney-Review Handoff"
  assert_contains "$skill" "Self-Check"
  assert_contains "$skill" "No final legal advice"
  assert_contains "$skill" "No safe-to-sign conclusions"
  assert_contains "$skill" "legal-output-schema.md"
  assert_contains "$skill" "legal-risk-taxonomy.md"
  assert_contains "$skill" "legal-advice-boundaries.md"

  assert_file "skills/legal-document-review-tdd/legal-output-schema.md"
  assert_file "skills/legal-document-review-tdd/legal-risk-taxonomy.md"
  assert_file "skills/legal-document-review-tdd/legal-advice-boundaries.md"

  assert_contains "skills/legal-document-review-tdd/legal-output-schema.md" "Legal-Work Objective"
  assert_contains "skills/legal-document-review-tdd/legal-output-schema.md" "Lawyer-Facing Findings"
  assert_contains "skills/legal-document-review-tdd/legal-output-schema.md" "Business/Operator Summary"
  assert_contains "skills/legal-document-review-tdd/legal-output-schema.md" "Attorney-Review Handoff"

  assert_contains "skills/legal-document-review-tdd/legal-risk-taxonomy.md" "Authority and capacity"
  assert_contains "skills/legal-document-review-tdd/legal-risk-taxonomy.md" "Missing or inconsistent documents"
  assert_contains "skills/legal-document-review-tdd/legal-risk-taxonomy.md" "Execution and signature defects"

  assert_contains "skills/legal-document-review-tdd/legal-advice-boundaries.md" "Do not give final legal advice"
  assert_contains "skills/legal-document-review-tdd/legal-advice-boundaries.md" "Do not pretend jurisdiction is known"
  assert_contains "skills/legal-document-review-tdd/legal-advice-boundaries.md" "Do not hallucinate clauses"
  assert_contains "skills/legal-document-review-tdd/legal-advice-boundaries.md" "Required Safer Replacement"
  pass "skill checks"
}

run_fixture_checks() {
  local fixture="tests/legal-superpowers/fixtures/generic-service-agreement.md"
  local expected="tests/legal-superpowers/fixtures/generic-service-agreement.expected-findings.md"

  assert_file "$fixture"
  assert_file "$expected"
  assert_contains "$fixture" "# Generic Services Agreement"
  assert_contains "$fixture" "Exhibit A"
  assert_contains "$fixture" "Governing Law"
  assert_contains "$fixture" "[Signature page intentionally omitted"

  assert_contains "$expected" "# Expected Findings: Generic Services Agreement"
  assert_contains "$expected" "Missing Exhibit A"
  assert_contains "$expected" "No governing law selected"
  assert_contains "$expected" "Missing signature block"
  assert_contains "$expected" "Payment timing ambiguous"
  assert_contains "$expected" "must remain uncertain"
  assert_contains "$expected" "Questions for counsel"

  assert_count_at_least "tests/legal-superpowers/pressure/*.prompt.txt" 3
  assert_contains "tests/legal-superpowers/pressure/skip-citations.prompt.txt" "Do not bother with citations"
  assert_contains "tests/legal-superpowers/pressure/safe-to-sign.prompt.txt" "safe to sign"
  assert_contains "tests/legal-superpowers/pressure/assume-jurisdiction.prompt.txt" "Assume New York law"
  pass "fixture checks"
}

case "$MODE" in
  mapping)
    run_mapping_checks
    ;;
  readme)
    run_readme_checks
    ;;
  skill)
    run_skill_checks
    ;;
  fixtures)
    run_fixture_checks
    ;;
  all)
    assert_executable "tests/legal-superpowers/test-foundation-files.sh"
    run_mapping_checks
    run_readme_checks
    run_skill_checks
    run_fixture_checks
    ;;
  *)
    fail "unknown mode: $MODE"
    ;;
esac
