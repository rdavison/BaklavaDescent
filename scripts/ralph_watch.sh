#!/bin/bash
# ralph_watch.sh - Watch ralph_logs and pretty-print the latest Claude session
#
# Usage:
#   ./scripts/ralph_watch.sh          # print latest, then watch for updates
#   ./scripts/ralph_watch.sh -n 3     # print the 3rd iteration
#   ./scripts/ralph_watch.sh --tail   # follow mode (like tail -f)

set -euo pipefail

PROJECT="${PROJECT:-$(cd "$(dirname "$0")/.." && pwd)}"
LOG_DIR="$PROJECT/ralph_logs"
FOLLOW=false
SPECIFIC=""

while [[ $# -gt 0 ]]; do
    case "$1" in
        --tail|-f) FOLLOW=true; shift ;;
        -n) SPECIFIC="$2"; shift 2 ;;
        *) echo "Unknown arg: $1"; exit 1 ;;
    esac
done

pretty_print() {
    local jsonl_file="$1"
    python3 - "$jsonl_file" <<'PYEOF'
import json, sys, os, textwrap

RESET = "\033[0m"
BOLD = "\033[1m"
DIM = "\033[2m"
GREEN = "\033[32m"
YELLOW = "\033[33m"
BLUE = "\033[34m"
CYAN = "\033[36m"
RED = "\033[31m"
MAGENTA = "\033[35m"

def fmt_tool_use(tool):
    name = tool.get("name", "?")
    inp = tool.get("input", {})
    if name == "Read":
        return f"{CYAN}Read{RESET} {inp.get('file_path', '?')}"
    elif name == "Write":
        return f"{CYAN}Write{RESET} {inp.get('file_path', '?')}"
    elif name == "Edit":
        path = inp.get("file_path", "?")
        old = inp.get("old_string", "")
        preview = old[:60].replace("\n", "\\n")
        return f"{CYAN}Edit{RESET} {path} ({len(old)} chars)"
    elif name == "Bash":
        cmd = inp.get("command", "?")
        if len(cmd) > 120:
            cmd = cmd[:120] + "..."
        return f"{CYAN}Bash{RESET} {DIM}{cmd}{RESET}"
    elif name == "Glob":
        return f"{CYAN}Glob{RESET} {inp.get('pattern', '?')}"
    elif name == "Grep":
        return f"{CYAN}Grep{RESET} /{inp.get('pattern', '?')}/ {inp.get('path', '')}"
    elif name == "Agent":
        return f"{CYAN}Agent{RESET} [{inp.get('subagent_type', 'general')}] {inp.get('description', '')}"
    else:
        return f"{CYAN}{name}{RESET}"

def fmt_tool_result(result):
    content = result.get("content", "")
    if isinstance(content, list):
        parts = []
        for c in content:
            if isinstance(c, dict) and c.get("type") == "text":
                parts.append(c["text"])
        content = "\n".join(parts)
    if not isinstance(content, str):
        content = str(content)
    lines = content.split("\n")
    if len(lines) > 8:
        return "\n".join(lines[:4]) + f"\n{DIM}  ... ({len(lines) - 8} more lines) ...{RESET}\n" + "\n".join(lines[-4:])
    return content

file = sys.argv[1]
if not os.path.exists(file) or os.path.getsize(file) == 0:
    print(f"{RED}Empty or missing: {file}{RESET}")
    sys.exit(0)

iter_num = os.path.basename(file).replace("claude_", "").replace(".jsonl", "")
print(f"\n{BOLD}{'=' * 60}{RESET}")
print(f"{BOLD}  Ralph Loop — Iteration {iter_num}{RESET}")
print(f"{BOLD}{'=' * 60}{RESET}\n")

tool_uses = {}  # id -> description

for line in open(file):
    line = line.strip()
    if not line:
        continue
    try:
        d = json.loads(line)
    except:
        continue

    typ = d.get("type")

    if typ == "system" and d.get("subtype") == "init":
        model = d.get("model", "?")
        print(f"{DIM}Model: {model}{RESET}")
        continue

    if typ == "assistant":
        msg = d.get("message", {})
        if not isinstance(msg, dict):
            continue
        for c in msg.get("content", []):
            if not isinstance(c, dict):
                continue
            if c.get("type") == "text":
                text = c["text"].strip()
                if text:
                    print(f"\n{GREEN}{BOLD}Claude:{RESET} {text}")
            elif c.get("type") == "tool_use":
                desc = fmt_tool_use(c)
                tool_uses[c.get("id", "")] = desc
                print(f"\n  {YELLOW}▶{RESET} {desc}")
            # skip thinking blocks

    elif typ == "tool_result" or typ == "result":
        tool_id = d.get("tool_use_id", "")
        content = fmt_tool_result(d)
        if content.strip():
            # indent and dim tool output
            indented = "\n".join(f"    {DIM}{l}{RESET}" for l in content.split("\n")[:12])
            if content.count("\n") > 12:
                indented += f"\n    {DIM}... (truncated){RESET}"
            print(indented)

    elif typ == "system" and d.get("subtype") == "task_completed":
        task_id = d.get("task_id", "")[:8]
        print(f"\n  {MAGENTA}✓ Agent done{RESET} {DIM}({task_id}){RESET}")

print(f"\n{BOLD}{'=' * 60}{RESET}\n")
PYEOF
}

find_latest() {
    ls -t "$LOG_DIR"/claude_*.jsonl 2>/dev/null | head -1
}

if [[ -n "$SPECIFIC" ]]; then
    PAD=$(printf "%03d" "$SPECIFIC")
    FILE="$LOG_DIR/claude_${PAD}.jsonl"
    if [[ ! -f "$FILE" ]]; then
        echo "File not found: $FILE"
        exit 1
    fi
    pretty_print "$FILE"
    exit 0
fi

LATEST=$(find_latest)
if [[ -z "$LATEST" ]]; then
    echo "No claude logs found in $LOG_DIR"
    exit 1
fi

pretty_print "$LATEST"

if $FOLLOW; then
    echo "Watching for new logs in $LOG_DIR..."
    LAST="$LATEST"
    while true; do
        sleep 5
        NEW=$(find_latest)
        if [[ -n "$NEW" && "$NEW" != "$LAST" && -s "$NEW" ]]; then
            LAST="$NEW"
            pretty_print "$NEW"
        fi
    done
fi
