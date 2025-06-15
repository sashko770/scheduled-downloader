#!/bin/bash
# מעבר לתיקיית הסקריפט
cd /home/yoelc/Desktop/scheduled-downloader || exit 1

# ייצוא משתני סביבה לקובץ לוג (לבדיקת בעיות עם cron)
env >> logs/cron-env.txt

# הגדרות נתיבים
DOWNLOAD_DIR="/home/yoelc/Desktop/scheduled-downloader/downloads"
LOG_DIR="/home/yoelc/Desktop/scheduled-downloader/logs"
LOG_FILE="$LOG_DIR/download_$(date +'%Y-%m-%d_%H-%M-%S').log"
URLS_FILE="/home/yoelc/Desktop/scheduled-downloader/urls.txt"

# יצירת תיקיות במידת הצורך
mkdir -p "$DOWNLOAD_DIR" "$LOG_DIR"

# בדיקת קיום קובץ urls.txt
if [ ! -f "$URLS_FILE" ]; then
    echo "Error: $URLS_FILE not found" >> "$LOG_FILE"
    exit 1
fi

# התחלה
echo "Start Download: $(date)" >> "$LOG_FILE"
echo "==============================" >> "$LOG_FILE"

# קריאת כתובות מהקובץ תוך התעלמות משורות ריקות או הערות
grep -v '^#' "$URLS_FILE" | grep -v '^$' | while read -r url; do
    echo "Download: $url" >> "$LOG_FILE"

    # ניסיון הורדה עם שמירת הפלט ללוג
    if wget -c "$url" -P "$DOWNLOAD_DIR" >> "$LOG_FILE" 2>&1; then
        FILE_NAME=$(basename "$url")
        FILE_PATH="$DOWNLOAD_DIR/$FILE_NAME"
        if [ -f "$FILE_PATH" ]; then
            FILE_SIZE=$(du -h "$FILE_PATH" | cut -f1)
            echo "✓ Success – Size: $FILE_SIZE" >> "$LOG_FILE"
        else
            echo "✓ Success – Size: unknown" >> "$LOG_FILE"
        fi
    else
        echo "✗ Failure" >> "$LOG_FILE"
    fi
    echo "------------------------------" >> "$LOG_FILE"
done

# סיום
echo "סיום: $(date)" >> "$LOG_FILE"
echo "==============================" >> "$LOG_FILE"
echo "ההורדה הסתיימה." >> "$LOG_FILE"
