
# Scheduled Downloader Script

A Bash script to automate downloading multiple files from a list of URLs, with logging, error handling, and file size reporting.

## 📁 Features

- Reads URLs from a `urls.txt` file (ignores empty lines and comments)
- Logs each download attempt with timestamp and result
- Shows success or failure for each URL
- Records the size of each successfully downloaded file
- Creates required folders automatically (`downloads/` and `logs/`)
- Suitable for manual use or scheduled via `cron`

## 🚀 How to Use

1. Clone the repository or copy the script to your desired folder:
    ```bash
    git clone https://github.com/your-username/scheduled-downloader.git
    cd scheduled-downloader
    ```

2. Add your URLs to the file `urls.txt`. One URL per line. You can add comments using `#` and leave empty lines.

3. Make sure the script is executable:
    ```bash
    chmod +x downloader.sh
    ```

4. Run the script:
    ```bash
    ./downloader.sh
    ```

## 📝 Log Output Example

```text
Start Download: 2025-06-16 14:00
==============================
Download: https://example.com/file1.zip
✓ Success – Size: 12M
------------------------------
Download: https://invalid-url.com/file2.zip
✗ Failure
------------------------------
Download: https://example.com/file3.mp4
✓ Success – Size: 95M
------------------------------
ההורדה הסתיימה.
==============================
