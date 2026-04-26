#/bin/bash

set -euo pipefail

echo "[BASH] Adjust Date"
echo ".github/actions/adjust-date/worker.bash"

# 获取当前日期 (Asia/Shanghai 时区)
CURRENT_DATE=$(TZ='Asia/Shanghai' date +'%Y-%m-%d')

# 确定最终日期
FINAL_DATE=""

# 使用环境变量 IS_TODAY 进行逻辑判断
if [[ "$IS_TODAY" == *"今日"* ]]; then
    FINAL_DATE="$CURRENT_DATE"
    echo "检测到勾选今日，使用日期: $FINAL_DATE"
else
    FINAL_DATE="$INPUT_DATE"
fi

# 校验格式 YYYY-MM-DD
if [[ ! "$FINAL_DATE" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
    echo "错误: 日期格式无效或为空。当前获取日期: '$FINAL_DATE'"
    exit 1
fi

# 输出结果供后续步骤使用 (使用 GITHUB_OUTPUT 环境变量文件)
echo "date=$FINAL_DATE" >> $GITHUB_OUTPUT
echo "处理成功: $FINAL_DATE"


