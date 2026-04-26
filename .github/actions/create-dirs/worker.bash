#!/bin/bash
set -euo pipefail

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

BASE_PATH="adjust/$YEAR/$MONTH"
echo "BASE_PATH=$BASE_PATH" >> "$GITHUB_ENV"

mkdir -p "$BASE_PATH"
touch "$BASE_PATH/.gitkeep"
mkdir -p "$BASE_PATH/log"
touch "$BASE_PATH/log/.gitkeep"
mkdir -p "$BASE_PATH/graph"
touch "$BASE_PATH/graph/.gitkeep"

