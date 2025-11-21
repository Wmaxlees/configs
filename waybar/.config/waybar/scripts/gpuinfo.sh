#!/bin/bash

# Get GPU utilization from nvidia-smi
GPU_UTIL=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits | tr -d '\n')

# Output in Waybar's JSON format
echo "{\"text\": \"${GPU_UTIL}%\", \"tooltip\": \"GPU Utilization: ${GPU_UTIL}%\"}"
