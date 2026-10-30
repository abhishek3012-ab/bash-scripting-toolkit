
#!/bin/bash

# Log Error Analyzer

set -Eeuo pipefail

LOG_FILE="${1:-}"

if [[ -z "$LOG_FILE" ]]; then
    echo "Usage: $0 /path/to/application.log"
    exit 1
fi

if [[ ! -f "$LOG_FILE" || ! -r "$LOG_FILE" ]]; then
    echo "ERROR: Log file does not exist or is not readable."
    exit 1
fi

REPORT="log_report_$(date +%Y%m%d_%H%M%S).txt"

echo "===== LOG ANALYSIS REPORT =====" | tee "$REPORT"
echo "File: $LOG_FILE" | tee -a "$REPORT"
echo "Date: $(date)" | tee -a "$REPORT"

echo | tee -a "$REPORT"

echo "===== ERROR COUNT =====" | tee -a "$REPORT"

ERROR_COUNT=$(grep -Eic 'ERROR|CRITICAL|FATAL' "$LOG_FILE" || true)

echo "$ERROR_COUNT" | tee -a "$REPORT"

echo "===== ERROR DETAILS =====" | tee -a "$REPORT"

grep -Ein 'ERROR|CRITICAL|FATAL' "$LOG_FILE" \
    | tail -n 50 | tee -a "$REPORT" || true

echo
echo "Report saved to: $REPORT"
