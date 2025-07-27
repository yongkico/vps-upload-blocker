#!/bin/bash

# =============================================
# 🔐 Auto File Deletion by Stucklabs
# =============================================
# This script monitors sensitive directories and
# automatically deletes newly created files containing
# dangerous extensions (php, html, xml, py).
# Requires: inotify-tools
# =============================================

# 🗂️ Directories to monitor
WATCH_DIRS=(
    "/var/www/"
)

# 🚫 Forbidden keywords in file extensions
REJECTED_KEYWORDS=("html" "php" "xml" "py")

# 📄 Log file
LOG_FILE="/var/log/upload_blocker.log"

# 📌 Ensure log file exists and writable
touch "$LOG_FILE"
chmod 644 "$LOG_FILE"

# 🧾 Logging function
log_activity() {
    local message="$1"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $message" >> "$LOG_FILE"
}

# 🧹 Delete detected file
delete_invalid_file() {
    local file="$1"
    if [[ -f "$file" ]]; then
        log_activity "❌ Deleted: Forbidden file $file"
        rm -f "$file"
    fi
}

# 🚀 Start watching
for dir in "${WATCH_DIRS[@]}"
  do
    log_activity "📡 Monitoring directory: $dir"
    inotifywait -m -r -e create --format '%w%f' "$dir" | while read NEWFILE
    do
        extension="${NEWFILE##*.}"

        for keyword in "${REJECTED_KEYWORDS[@]}"; do
            if [[ "$extension" == *"$keyword"* ]]; then
                log_activity "⚠️ Detected forbidden extension: $NEWFILE"
                delete_invalid_file "$NEWFILE"
                break
            fi
        done
    done &
done

# ⏳ Wait for all background processes
wait
