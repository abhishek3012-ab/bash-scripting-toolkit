
#!/bin/bash

# Application Endpoint Health Checker

set -u

if ! command -v curl >/dev/null 2>&1; then
    echo "ERROR: curl is not installed."
    exit 1
fi

if [[ $# -eq 0 ]]; then
    echo "Usage: $0 URL1 URL2 URL3"
    exit 1
fi

FAILED=0

echo "===== APPLICATION HEALTH CHECK ====="
echo "Date: $(date)"
echo

for URL in "$@"
do
    HTTP_CODE=$(curl -L -sS -o /dev/null \
        -w "%{http_code}" \
        --connect-timeout 5 \
        --max-time 15 \
        "$URL") || HTTP_CODE="000"

    if [[ "$HTTP_CODE" =~ ^2[0-9][0-9]$ ]]; then
        echo "[HEALTHY] $URL | HTTP $HTTP_CODE"
    else
        echo "[UNHEALTHY] $URL | HTTP $HTTP_CODE"
        FAILED=1
    fi
done

echo
echo "===== HEALTH CHECK COMPLETED ====="

exit "$FAILED"
