#!/bin/bash
stats=$(nvidia-smi --query-gpu=utilization.gpu,memory.used,memory.total --format=csv,noheader,nounits)
UTIL=$(echo "$stats" | awk -F', ' '{print $1}')
MEM_USED=$(echo "$stats" | awk -F', ' '{print $2}')
MEM_TOTAL=$(echo "$stats" | awk -F', ' '{print $3}')
MEM_PERC=$(awk "BEGIN {printf \"%.0f\", ($MEM_USED / $MEM_TOTAL) * 100}")

echo "{\"text\": \"${UTIL}% | ${MEM_PERC}%\", \"tooltip\": \"GPU Load: ${UTIL}%\nVRAM: ${MEM_USED}MiB / ${MEM_TOTAL}MiB\"}"
