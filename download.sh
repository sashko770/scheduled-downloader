

#!/bin/bash
cd /home/kali/Desktop/scheduled-downloader
env >> /home/kali/Desktop/scheduled-downloader/logs/cron-env.txt

# תיקיות
DOWNLOAD_DIR="/home/kali/Desktop/scheduled-downloader/downloads"
LOG_FILE="/home/kali/Desktop/scheduled-downloader/logs/download_$(date +'%Y-%m-%d_%H-%M-%S').log"

# בדיקת קיום תיקיות
mkdir -p "$DOWNLOAD_DIR" "$(dirname "$LOG_FILE")"

echo "התחלת הורדה: $(date)" >> "$LOG_FILE"

# קריאה מהקובץ urls.txt, התעלמות מהערות או שורות ריקות
grep -v '^#' /home/kali/Desktop/scheduled-downloader/urls.txt | grep -v '^$' | while read -r url; do
    echo "מוריד: $url" >> "$LOG_FILE"
    
    # נסה להוריד
    if wget -c "$url" -P "$DOWNLOAD_DIR" >> "$LOG_FILE" 2>&1; then
        echo "✓ הצלחה" >> "$LOG_FILE"
    else
        echo "✗ כשלון" >> "$LOG_FILE"
    fi

    echo "------------------------------" >> "$LOG_FILE"
done

echo "סיום: $(date)" >> "$LOG_FILE"
