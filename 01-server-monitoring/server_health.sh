
#!/bin/bash

# Server Health Monitoring Script

set -euo pipefail

echo "=================================="
echo "       SERVER HEALTH REPORT"
echo "=================================="

echo "Hostname: $(hostname)"
echo "Date: $(date)"
echo

# CPU Information
echo "----- CPU INFORMATION -----"
echo "CPU Cores: $(nproc)"
echo "Load Average: $(uptime | awk -F'load average:' '{print $2}')"
echo

# Memory Information
echo "----- MEMORY USAGE -----"
free -h
echo

# Disk Information
echo "----- DISK USAGE -----"
df -h -x tmpfs -x devtmpfs
echo

# Top 5 Memory Consuming Processes
echo "----- TOP 5 MEMORY PROCESSES -----"

ps aux --sort=-%mem | head -n 6

echo
echo "=================================="
echo "       HEALTH CHECK COMPLETED"
echo "=================================="
