
#!/bin/bash

# Linux Service Monitoring Script

set -u

if ! command -v systemctl >/dev/null 2>&1; then
    echo "ERROR: systemctl is not available."
    exit 1
fi

if [[ $# -eq 0 ]]; then
    echo "Usage: $0 service1 service2 service3"
    echo "Example: $0 nginx docker jenkins"
    exit 1
fi

FAILED=0

echo "===== SERVICE STATUS REPORT ====="
echo "Date: $(date)"
echo

for SERVICE in "$@"
do
    if systemctl is-active --quiet "$SERVICE"; then
        echo "[RUNNING] $SERVICE"
    else
        echo "[STOPPED] $SERVICE"
        FAILED=1
    fi
done

echo
echo "===== MONITORING COMPLETED ====="

exit "$FAILED"
