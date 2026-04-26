#!/bin/bash
set -euo pipeline

echo "[BASH] Create Directorys"
echo "./github/actions/worker.bash"

INPUT_DATE=$1

if [ -z "$INPUT_DATE" ]; then
    TARGET_DATE=$(TZ='Asia/Shanghai' date +%Y-%m-%d)
else
    TARGET_DATE=$INPUT_DATE
fi

YEAR=$(echo "$TARGET_DATE" | cut -d'-' -f1)
MONTH=$(echo "$TARGET_DATE" | cut -d'-' -f2)

BASE_PATH=“adjust/$YEAR/$MONTH"
LOG_PATH="$BASE_PATH/log"
GRAPH_PATH="$BASE_PATH/graph"

mkdir -p "$LOG_PATH"
mkdir -p "$GRAPH_PATH"

echo "BASE_PATH=$BASE_PATH" >> "$GITHUB_ENV"