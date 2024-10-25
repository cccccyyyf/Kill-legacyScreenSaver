#!/bin/zsh

# 在日志文件中记录时间
# Record current time in log files
echo "Script ran at $(date)" >> /your\routine/kill_LSS.log

# 进程名
# Process name
PROCESS_NAME="legacyScreenSaver"

# 获取进程的 PID
# Get the PID of the process
PROCESS_PID=$(pgrep "$PROCESS_NAME")

# 检查进程是否存在
# Check if the process exists
if [ -z "$PROCESS_PID" ]; then
    echo "Process $PROCESS_NAME not found." >> /Users/charleschen/scripts/kill_LSS.log
    exit 0
fi

# 使用 ps 获取进程的实际内存使用量 (RSS，以 KB 为单位)
# Use ps to get the actual memory usage of the process (RSS, in KB)
MEM_USAGE_KB=$(ps -p "$PROCESS_PID" -o rss=)
MEM_USAGE_MB=$(echo "scale=2; $MEM_USAGE_KB / 1024" | bc)

# 设置允许的最大内存使用量 (1GB)
# Set the maximum allowed memory usage (1GB)
MAX_MEM_USAGE=1024.0

# 比较实际内存使用量和最大限制
# Compare actual memory usage with maximum limits
if (( $(echo "$MEM_USAGE_MB >= $MAX_MEM_USAGE" | bc -l) )); then
    # 如果内存大于等于 1GB，强制结束该进程
    # If memory is greater than or equal to 1GB, force the process to end
    pkill -9 "$PROCESS_NAME"
    if [ $? -eq 0 ]; then
        echo "Process $PROCESS_NAME has been terminated due to high memory usage (${MEM_USAGE_MB} MB)." >> /Users/charleschen/scripts/kill_LSS.log
    else
        echo "Failed to terminate process $PROCESS_NAME." >> /Users/charleschen/scripts/kill_LSS.log
    fi
else
    # 如果内存小于 1GB，保留进程
    # If memory is less than 1GB, retain the process
    echo "Process $PROCESS_NAME is using ${MEM_USAGE_MB} MB, below 1GB. No action taken." >> /Users/charleschen/scripts/kill_LSS.log
fi
