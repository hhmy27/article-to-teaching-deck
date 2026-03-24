#!/usr/bin/env bash
set -euo pipefail

if [ $# -lt 1 ]; then
  echo "Usage: $0 <deck-path> [port]" >&2
  exit 1
fi

DECK_PATH="$1"
PORT="${2:-3032}"
LOG_DIR="${TMPDIR:-/tmp}/article-to-teaching-deck"
PID_FILE="$LOG_DIR/slidev-${PORT}.pid"
LOG_FILE="$LOG_DIR/slidev-${PORT}.log"
mkdir -p "$LOG_DIR"

if [ ! -f "$DECK_PATH" ]; then
  echo "Deck not found: $DECK_PATH" >&2
  exit 1
fi

if lsof -nP -iTCP:"$PORT" -sTCP:LISTEN >/dev/null 2>&1; then
  echo "ALREADY_RUNNING http://localhost:${PORT}/"
  exit 0
fi

if [ -x "./node_modules/.bin/slidev" ]; then
  CMD=(./node_modules/.bin/slidev "$DECK_PATH" --port "$PORT")
elif command -v pnpm >/dev/null 2>&1; then
  CMD=(pnpm exec slidev "$DECK_PATH" --port "$PORT")
elif command -v npx >/dev/null 2>&1; then
  CMD=(npx @slidev/cli "$DECK_PATH" --port "$PORT")
else
  echo "Slidev CLI not found. Install Node.js and Slidev first." >&2
  exit 1
fi

nohup "${CMD[@]}" >"$LOG_FILE" 2>&1 &
PID=$!
echo "$PID" > "$PID_FILE"

for _ in $(seq 1 30); do
  if lsof -nP -iTCP:"$PORT" -sTCP:LISTEN >/dev/null 2>&1; then
    echo "STARTED http://localhost:${PORT}/"
    echo "LOG $LOG_FILE"
    exit 0
  fi
  sleep 1
done

echo "FAILED $LOG_FILE" >&2
exit 1
