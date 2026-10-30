
#!/bin/bash

# Automated Backup Script with Retention

set -Eeuo pipefail

SOURCE_DIR="${1:-}"
BACKUP_DIR="${2:-}"
RETENTION_DAYS="${3:-7}"

if [[ -z "$SOURCE_DIR" || -z "$BACKUP_DIR" ]]; then
    echo "Usage: $0 SOURCE_DIR BACKUP_DIR [RETENTION_DAYS]"
    exit 1
fi

if [[ ! -d "$SOURCE_DIR" ]]; then
    echo "ERROR: Source directory does not exist."
    exit 1
fi

if [[ "$RETENTION_DAYS" =~ ^[0-9]+$ ]] &&
   (( RETENTION_DAYS > 0 )); then
    :
else
    echo "ERROR: Retention days must be a positive integer."
    exit 1
fi

mkdir -p "$BACKUP_DIR"

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

echo "Starting backup..."
echo "Source: $SOURCE_DIR"

tar -czf "$BACKUP_FILE" -C "$(dirname "$SOURCE_DIR")" \
    "$(basename "$SOURCE_DIR")"

echo "Backup created: $BACKUP_FILE"

echo "Removing backups older than $RETENTION_DAYS days..."

find "$BACKUP_DIR" -maxdepth 1 \
    -type f -name 'backup_*.tar.gz' \
    -mtime +"$RETENTION_DAYS" -delete

echo "Backup process completed successfully."
