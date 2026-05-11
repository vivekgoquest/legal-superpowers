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
  local dir="$1"
  local pattern="$2"
  local minimum="$3"
  local count
  count=$(find "$dir" -type f -name "$pattern" 2>/dev/null | wc -l | tr -d ' ')
  [ "$count" -ge "$minimum" ] || fail "expected at least $minimum files matching $dir/$pattern, found $count"
}

run_skill_checks() {
  local skill="skills/legal-authority-research/SKILL.md"
  assert_file "$skill"
  assert_contains "$skill" "name: legal-authority-research"
  assert_contains "$skill" "description: Use when"
  assert_contains "$skill" "# Legal Authority Research"
  assert_contains "$skill" "This is research support, not final legal advice"
  assert_contains "$skill" "Jurisdiction Routing"
  assert_contains "$skill" "Authority Hierarchy Map"
  assert_contains "$skill" "Atomic Verification"
  assert_contains "$skill" "Claim And Evidence Ledger"
  assert_contains "$skill" "Contrary Authority And Negative Treatment"
  assert_contains "$skill" "No final legal advice"
  assert_contains "$skill" "No safe-to-sign conclusions"
  assert_contains "$skill" "Do not assume jurisdiction"
  assert_contains "$skill" "Do not treat market practice as legal authority"
  assert_contains "$skill" "Do not treat citation existence as proposition support"
  assert_contains "$skill" "legal-document-review-tdd"
  assert_contains "$skill" "jurisdiction-routing.md"
  assert_contains "$skill" "authority-hierarchy.md"
  assert_contains "$skill" "source-strategy.md"
  assert_contains "$skill" "precedent-research.md"
  assert_contains "$skill" "statutory-regulatory-research.md"
  assert_contains "$skill" "clause-comparison-research.md"
  assert_contains "$skill" "claim-evidence-ledger.md"
  assert_contains "$skill" "citation-verification.md"
  assert_contains "$skill" "legal-research-output-schema.md"
  assert_contains "$skill" "legal-research-quality-gates.md"
  assert_contains "$skill" "source-ledger.md"
  pass "legal-authority-research skill checks"
}

run_spec_checks() {
  local spec="docs/legal-superpowers/specs/2026-05-11-legal-authority-research-design.md"
  assert_file "$spec"
  assert_contains "$spec" "source-ledger.md"
  assert_contains "$spec" "not citator-verified cannot be marked supported"
  assert_contains "$spec" "mandatory local law"
  assert_contains "$spec" "procedural law"
  assert_contains "$spec" "unpublished or non-precedential"
  assert_contains "$spec" "retroactivity"
  assert_contains "$spec" "sanitized query"
  pass "legal-authority-research spec checks"
}

run_reference_checks() {
  local base="skills/legal-authority-research"
  assert_file "$base/jurisdiction-routing.md"
  assert_file "$base/authority-hierarchy.md"
  assert_file "$base/source-strategy.md"
  assert_file "$base/precedent-research.md"
  assert_file "$base/statutory-regulatory-research.md"
  assert_file "$base/clause-comparison-research.md"
  assert_file "$base/claim-evidence-ledger.md"
  assert_file "$base/citation-verification.md"
  assert_file "$base/legal-research-output-schema.md"
  assert_file "$base/legal-research-quality-gates.md"
  assert_file "$base/source-ledger.md"

  assert_contains "$base/jurisdiction-routing.md" "confirmed | assumed | unknown | mixed"
  assert_contains "$base/jurisdiction-routing.md" "split the research lanes"
  assert_contains "$base/jurisdiction-routing.md" "mandatory local law"
  assert_contains "$base/jurisdiction-routing.md" "procedural law"
  assert_contains "$base/authority-hierarchy.md" "Binding primary authority"
  assert_contains "$base/authority-hierarchy.md" "Market practice and sample documents"
  assert_contains "$base/source-strategy.md" "CourtListener"
  assert_contains "$base/source-strategy.md" "Eyecite"
  assert_contains "$base/source-strategy.md" "No approved source strategy exists"
  assert_contains "$base/precedent-research.md" "contrary authority"
  assert_contains "$base/precedent-research.md" "unpublished or non-precedential"
  assert_contains "$base/statutory-regulatory-research.md" "amendments"
  assert_contains "$base/statutory-regulatory-research.md" "retroactivity"
  assert_contains "$base/clause-comparison-research.md" "market practice is not legal authority"
  assert_contains "$base/claim-evidence-ledger.md" "No final output may contain a confirmed legal proposition"
  assert_contains "$base/claim-evidence-ledger.md" "not citator-verified cannot be marked supported"
  assert_contains "$base/citation-verification.md" "Citation existence does not prove proposition support"
  assert_contains "$base/source-ledger.md" "access timestamp"
  assert_contains "$base/source-ledger.md" "retrieval query"
  assert_contains "$base/source-ledger.md" "confidentiality status"
  assert_contains "$base/legal-research-output-schema.md" "Jurisdiction Record"
  assert_contains "$base/legal-research-quality-gates.md" "No confirmed legal proposition unless"
  assert_contains "$base/legal-research-quality-gates.md" "Currentness not verified means counsel-review-required"
  assert_contains "$base/legal-research-quality-gates.md" "recorded authorization and sanitized query"
  pass "legal-authority-research reference checks"
}

run_pressure_checks() {
  local dir="tests/legal-superpowers/authority-research/pressure"
  assert_count_at_least "$dir" "*.prompt.txt" 6
  assert_contains "$dir/assume-jurisdiction-final-answer.prompt.txt" "Assume New York law"
  assert_contains "$dir/blog-as-authority.prompt.txt" "Treat it as the answer"
  assert_contains "$dir/skip-currentness.prompt.txt" "Do not waste time checking"
  assert_contains "$dir/unopened-citations.prompt.txt" "Use these citations"
  assert_contains "$dir/confidential-search.prompt.txt" "search the exact party names"
  assert_contains "$dir/safe-to-sign.prompt.txt" "safe to sign"
  assert_contains "$dir/public-source-currentness.prompt.txt" "CourtListener found it"
  assert_contains "$dir/unpublished-case.prompt.txt" "unpublished"
  pass "legal-authority-research pressure prompt checks"
}

case "$MODE" in
  skill)
    run_skill_checks
    ;;
  spec)
    run_spec_checks
    ;;
  references)
    run_reference_checks
    ;;
  pressure)
    run_pressure_checks
    ;;
  all)
    assert_executable "tests/legal-superpowers/test-legal-authority-research.sh"
    run_skill_checks
    run_spec_checks
    run_reference_checks
    run_pressure_checks
    ;;
  *)
    fail "unknown mode: $MODE"
    ;;
esac
