#!/usr/bin/env bash
# Structural checks for every skill. Behaviour is tested separately with the
# pressure prompts and the corpus (see skills/writing-legal-skills/SKILL.md).
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT_DIR"

fail() { echo "FAIL: $*" >&2; exit 1; }
pass() { echo "PASS: $*"; }

expected="executing-legal-work-plans
legal-authority-research
legal-craft-delegation
legal-issue-tracing
legal-matter-brief
legal-test-driven-work
legal-verification-before-completion
legal-wittgenstein
legal-work-planning
receiving-legal-review
requesting-legal-review
writing-legal-skills"

actual="$(find skills -mindepth 1 -maxdepth 1 -type d -exec basename {} \; | sort)"
[ "$actual" = "$expected" ] || fail "skill folders differ from the expected set:
$(diff <(echo "$expected") <(echo "$actual") || true)"
pass "skill set is exactly the 12 expected skills"

for dir in $expected; do
  f="skills/$dir/SKILL.md"
  [ -f "$f" ] || fail "missing $f"
  [ "$(head -1 "$f")" = "---" ] || fail "$f does not start with frontmatter"
  fm="$(awk 'NR==1{next} /^---$/{exit} {print}' "$f")"
  grep -qx "name: $dir" <<<"$fm" || fail "$f frontmatter name is not $dir"
  desc="$(sed -n 's/^description: //p' <<<"$fm")"
  [[ "$desc" == *"Use when "* ]] || fail "$f description has no 'Use when' triggers"
  [ "${#desc}" -le 400 ] || fail "$f description is ${#desc} characters (max 400; harnesses share a small budget)"
  ls "tests/legal-superpowers/$dir/pressure/"*.prompt.txt >/dev/null 2>&1 || fail "no pressure prompts for $dir"
done
pass "frontmatter, descriptions and pressure prompts"

refs="$(grep -rhoE '`[a-z]+(-[a-z]+)*-(legal|research|review|brief|work|tracing|delegation|wittgenstein|completion|plans|planning|skills)[a-z-]*`' skills | tr -d '`' | sort -u)"
for r in $refs; do
  [ -d "skills/$r" ] || fail "skills refer to a skill that does not exist: $r"
done
removed='using-legal-superpowers|legal-matter-intake|legal-review-tdd|legal-review-planning|executing-legal-review-plans|subagent-driven-legal-review|dispatching-parallel-legal-reviewers|requesting-legal-work-product-review|receiving-legal-review-feedback|finishing-legal-matter-packet|using-isolated-matter-workspaces|strategy-confidence-loop|legal-document-review-tdd'
if grep -rnE "$removed" skills; then fail "skills mention removed skills"; fi
pass "every skill reference resolves"

forbidden='production code|implementation code|code review|code quality|feature branch|development branch|pull request|merge to main|npm test|pytest|cargo test|go test|frontend|backend'
if grep -rniE "$forbidden" skills; then fail "skills contain coding-workflow phrases"; fi
pass "no coding-workflow phrases"

corpus="tests/legal-superpowers/corpus"
for f in "$corpus"/*/*.md; do
  grep -Fq "\`${f#"$corpus"/}\`" "$corpus/README.md" || fail "corpus file missing from $corpus/README.md: $f"
done
pass "corpus index lists every corpus file"
