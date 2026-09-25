#!/usr/bin/env bash
# Behavioural check that each skill triggers from its own description.
# Runs one headless `claude -p` session per row of triggers.tsv (costs model
# usage; not part of test-skills.sh). Usage: test-triggering.sh [skill-name]
set -uo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/../.." && pwd)"
HERE="$ROOT_DIR/tests/legal-superpowers"
LOGS="$(mktemp -d)"

fails=0
while IFS=$'\t' read -r skill prompt; do
  [ -n "${1:-}" ] && [ "$1" != "$skill" ] && continue
  # Fresh working folder per run, logs kept outside it, so no run sees another's output.
  work="$(mktemp -d)"
  cp "$HERE/fixtures/generic-service-agreement.md" "$work/agreement.md"
  printf '# Plan\n\n1. Define which deadlines are material in Section 6.\n2. Settle governing law (client to choose).\n3. Make confidentiality survive termination.\n' > "$work/plan.md"
  log="$LOGS/$skill.json"
  (cd "$work" && timeout 300 claude -p "${prompt//\{ROOT\}/$ROOT_DIR}" --plugin-dir "$ROOT_DIR" \
    --dangerously-skip-permissions --max-turns 6 --output-format stream-json --verbose >"$log" 2>&1)
  first="$(grep -oE '"skill":"[^"]*"' "$log" | head -1 | sed -E 's/"skill":"([^"]*:)?([^"]*)"/\2/')"
  if [ "$first" = "$skill" ]; then
    echo "PASS: $skill"
  else
    echo "FAIL: $skill (first skill loaded: ${first:-none}; log: $log)"
    fails=$((fails + 1))
  fi
done <"$HERE/triggers.tsv"

[ "$fails" -eq 0 ] || { echo "$fails trigger failure(s)"; exit 1; }
