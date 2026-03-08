#!/bin/bash
# ralph_loop.sh - Automated porting loop for ChocolateDescent
#
# Workflow:
#   1. Regenerate call graph frontier (scripts/gen_callgraph.py)
#   2. Build OCaml bridge + C++ game (verify current state compiles)
#   3. Invoke Claude to port the easiest frontier function to OCaml
#   4. Update worklog.md, stage all changes, and git commit
#   5. Repeat
#
# Usage:
#   ./scripts/ralph_loop.sh [--max-iterations N]
#
# Environment:
#   PROJECT - project root (default: script's parent dir)
#   CLAUDE_MODEL - model to use (default: claude-opus-4-6)

set -euo pipefail

# Ensure we can launch Claude CLI (may be blocked if run from inside a Claude session)
unset CLAUDECODE 2>/dev/null || true

PROJECT="${PROJECT:-$(cd "$(dirname "$0")/.." && pwd)}"
LOG_DIR="$PROJECT/ralph_logs"
MAX_ITERATIONS=50
CLAUDE_MODEL="${CLAUDE_MODEL:-claude-opus-4-6}"

# Parse args
while [[ $# -gt 0 ]]; do
    case "$1" in
        --max-iterations) MAX_ITERATIONS="$2"; shift 2 ;;
        *) echo "Unknown arg: $1"; exit 1 ;;
    esac
done

mkdir -p "$LOG_DIR"

# Find next iteration number
ITER=$(ls "$LOG_DIR"/iteration_*.log 2>/dev/null | wc -l | tr -d ' ')
ITER=$((ITER + 1))

LAST_ITER=$((ITER + MAX_ITERATIONS - 1))

echo "=== Ralph Loop starting at iteration $ITER (running $MAX_ITERATIONS iterations) ==="
echo "    Project: $PROJECT"
echo ""

PROMPT_FILE=$(mktemp)
trap "rm -f $PROMPT_FILE" EXIT

for (( i=ITER; i<=LAST_ITER; i++ )); do
    PAD=$(printf "%03d" "$i")
    ITER_LOG="$LOG_DIR/iteration_${PAD}.log"
    CLAUDE_LOG="$LOG_DIR/claude_${PAD}.log"
    CLAUDE_JSONL="$LOG_DIR/claude_${PAD}.jsonl"
    CLAUDE_ERR="$LOG_DIR/claude_${PAD}.err"

    echo "=== Iteration $i ===" | tee "$ITER_LOG"

    # -- Step 1: Regenerate call graph frontier --
    echo "=== Regenerating call graph frontier ===" | tee -a "$ITER_LOG"
    FRONTIER_OUTPUT=$(python3 "$PROJECT/scripts/gen_callgraph.py" 2>&1 | tee -a "$ITER_LOG")

    # Extract frontier count
    FRONTIER_COUNT=$(echo "$FRONTIER_OUTPUT" | grep "^  Total:" | sed 's/.*Frontier: \([0-9]*\).*/\1/')
    echo "Frontier count: $FRONTIER_COUNT" | tee -a "$ITER_LOG"

    # Extract porting status line
    PORTING_STATUS=$(echo "$FRONTIER_OUTPUT" | grep "^  Total:")

    # Extract frontier list (functions to port)
    FRONTIER_LIST=$(echo "$FRONTIER_OUTPUT" | sed -n '/PORTING FRONTIER/,/^$/p' | tail -n +2)

    # Extract next-to-port list (simplest unported functions)
    NEXT_TO_PORT=$(echo "$FRONTIER_OUTPUT" | sed -n '/NEXT TO PORT/,$ p' | tail -n +2)

    # -- Step 2: Pre-iteration build (verify current state compiles) --
    echo "=== Building OCaml bridge ===" | tee -a "$ITER_LOG"
    (cd "$PROJECT/ox" && sh ../scripts/ox/build_bridge.sh) 2>&1 | tee -a "$ITER_LOG"

    echo "=== Building C++ (OCaml build) ===" | tee -a "$ITER_LOG"
    cmake --build "$PROJECT/build-ox" -j8 2>&1 | tail -5 | tee -a "$ITER_LOG"

    # -- Step 3: Invoke Claude to port the next function --
    echo "=== Invoking Claude (iteration $i) ===" | tee -a "$ITER_LOG"

    # Build the prompt
    if [[ "$FRONTIER_COUNT" != "0" ]]; then
        TASK_SECTION="## Your Task

Port the easiest frontier function to OCaml. The frontier functions (easiest first):
$FRONTIER_LIST"
    else
        TASK_SECTION="## Your Task

The frontier is empty. Port the simplest unported function from the list below.
Pick the one at the top (fewest dependencies, lowest complexity):

$NEXT_TO_PORT"
    fi

    cat > "$PROMPT_FILE" <<EOF
You are continuing the ChocolateDescent C-to-OCaml port. Here is the current state:

## Call Graph Status
$PORTING_STATUS

$TASK_SECTION

## Steps

1. Read the C implementation of the target function carefully
2. Implement it in the appropriate ox/ox_*.ml file, faithfully translating every branch, condition, and computation from the C code
3. Wire up any new effects in ox-bridge/*.ml and ox-bridge/bridge.c
4. Update scripts/gen_callgraph.py: add the function to PORTED_FUNCTIONS (and any new deps to EFFECT_FUNCTIONS or INTRINSICS)
5. Build the OCaml bridge: cd ox && sh ../scripts/ox/build_bridge.sh
6. Build the C++ game: cmake --build build-ox -j8
7. If the build fails, fix the errors and rebuild until it passes

## Verification

Your ONLY verification is that the full build passes (both OCaml bridge and C++ game).
Do NOT run headless replay or compare state logs — we are focused on mechanical porting speed right now.
Do NOT try to fix parity divergences — just port the C logic faithfully and move on.

## Porting Guidelines

- Translate the C code as directly as possible. Match every branch, every condition, every arithmetic operation.
- For C functions/globals not yet available in OCaml, use algebraic effects to call back into C.
- Don't skip edge cases or simplify logic — port it exactly as written in C.
- Follow the project's porting philosophy in CLAUDE.md: port whole functions, use effects for side effects, never add sync/read-back hacks.
EOF

    # Run Claude Code
    claude \
        --model "$CLAUDE_MODEL" \
        --output-format stream-json \
        --verbose \
        --max-budget-usd 5 \
        --allowedTools "Read,Write,Edit,Glob,Grep,Bash,Agent" \
        --dangerously-skip-permissions \
        -p "$(cat "$PROMPT_FILE")" \
        > "$CLAUDE_JSONL" 2> "$CLAUDE_ERR" || true

    # Extract Claude's text output for the human-readable log
    python3 -c "
import json, sys
with open('$CLAUDE_JSONL') as f:
    for line in f:
        try:
            d = json.loads(line)
            if d.get('type') == 'assistant':
                msg = d.get('message', '')
                if isinstance(msg, str):
                    print(msg)
                elif isinstance(msg, dict):
                    for c in msg.get('content', []):
                        if isinstance(c, dict) and c.get('type') == 'text':
                            print(c['text'])
        except:
            pass
" > "$CLAUDE_LOG" 2>/dev/null || true

    # -- Step 4: Update worklog and commit --
    echo "=== Updating worklog and committing ===" | tee -a "$ITER_LOG"

    # Re-run callgraph to get updated porting status after Claude's changes
    POST_STATUS=$(python3 "$PROJECT/scripts/gen_callgraph.py" 2>&1 | grep "^  Total:" || echo "unknown")

    # Extract what function was ported from Claude's log (look for PORTED_FUNCTIONS additions)
    PORTED_FUNC=$(cd "$PROJECT" && git diff --cached --diff-filter=M -- scripts/gen_callgraph.py 2>/dev/null | grep "^+" | grep -oE '"[a-zA-Z_][a-zA-Z0-9_]*"' | head -5 | tr '\n' ', ' | sed 's/,$//' || echo "unknown")
    if [ -z "$PORTED_FUNC" ]; then
        PORTED_FUNC=$(cd "$PROJECT" && git diff --diff-filter=M -- scripts/gen_callgraph.py 2>/dev/null | grep "^+" | grep -oE '"[a-zA-Z_][a-zA-Z0-9_]*"' | head -5 | tr '\n' ', ' | sed 's/,$//' || echo "unknown")
    fi

    # Append to worklog
    cat >> "$PROJECT/worklog.md" <<WEOF

### Ralph Loop Iteration $i ($(date +%Y-%m-%d))
- **Ported:** $PORTED_FUNC
- **Status:** $POST_STATUS
- **Log:** ralph_logs/claude_${PAD}.log
WEOF

    # Stage all changes and commit
    cd "$PROJECT"
    git add -A
    if git diff --cached --quiet; then
        echo "No changes to commit" | tee -a "$ITER_LOG"
    else
        git commit -m "$(cat <<CEOF
Ralph loop iteration $i: port $PORTED_FUNC

$POST_STATUS
CEOF
        )"
        echo "Committed iteration $i" | tee -a "$ITER_LOG"
    fi

    echo "=== Iteration $i complete ===" | tee -a "$ITER_LOG"
    echo "Claude log: $CLAUDE_LOG" | tee -a "$ITER_LOG"
    echo "" | tee -a "$ITER_LOG"

    # Brief pause between iterations
    sleep 2
done

echo "=== Ralph Loop finished ==="
