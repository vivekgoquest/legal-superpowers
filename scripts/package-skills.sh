#!/usr/bin/env bash
# Build the download bundles for claude.ai and ChatGPT from skills/ into dist/.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
OUT="$ROOT/dist"
rm -rf "$OUT"
mkdir -p "$OUT/claude" "$OUT/chatgpt"
cd "$ROOT/skills"

# claude.ai takes one skill per ZIP, with the skill folder at the top of the ZIP.
for s in */; do
  s="${s%/}"
  zip -qr "$OUT/claude/$s.zip" "$s" -x '*.DS_Store'
done
(cd "$OUT/claude" && zip -q ../legal-superpowers-for-claude-ai.zip ./*.zip)

# ChatGPT Projects take flat files, so each file is renamed after its skill.
# writing-legal-skills is left out: it is for people changing the package.
for s in */; do
  s="${s%/}"
  [ "$s" = writing-legal-skills ] && continue
  for f in "$s"/*; do
    n="$(basename "$f")"
    if [ "$n" = SKILL.md ]; then cp "$f" "$OUT/chatgpt/$s.md"; else cp "$f" "$OUT/chatgpt/$s--$n"; fi
  done
done
cat > "$OUT/chatgpt/PROJECT-INSTRUCTIONS.txt" <<'TXT'
You are assisting a legal professional. The files in this project are the Legal Superpowers skills.
A file named <skill>.md is the skill <skill>. A file named <skill>--<name>.md is the file <name> that the skill <skill> links to.
Before any legal work (review, redline, drafting, research, summary or explanation of a legal document), read the description at the top of every skill file, then follow every skill whose description fits, exactly as it directs. Start with legal-matter-brief, and give a Wittgenstein version (legal-wittgenstein) of every document you work on.
You cannot start separate AI sessions. Where a skill asks for a specialist or an independent reviewer as a separate session, follow that skill's rule for when no subagent tool is available, and label the result as it says.
TXT
(cd "$OUT/chatgpt" && zip -q ../legal-superpowers-for-chatgpt.zip ./*)

ls -1 "$OUT"/*.zip
