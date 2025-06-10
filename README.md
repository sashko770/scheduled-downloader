
Scheduled Downloader – Bash Script
Overview

This repository contains a simple Bash script for automated downloading of files from a list of URLs. The script is designed to be used as-is without any need for external installations, and it can be run manually or scheduled via cron.

Features
 	Downloads files from a text list of URLs (urls.txt)  
 	Skips empty lines and comments  
 	Saves all downloaded files in a /downloads folder  
 	Generates a detailed log for each run in the /logs folder  
 	Supports scheduled execution using cron  
 	Minimal dependencies (works out-of-the-box on most Linux distributions)

Project Structure
scheduled-downloader/
├── download.sh ← Main Bash script
├── urls.txt ← Text file with list of URLs
├── logs/ ← Auto-generated logs with timestamp
├── downloads/ ← Folder where downloaded files are saved
└── README.md ← This documentation file

Requirements
 	Bash (included in most Linux systems)
 	wget
 	cron (for scheduled runs – optional)

No additional packages or setup required.

How to Use
1. Clone the repository or download the script:
git clone https://github.com/YOUR_USERNAME/scheduled-downloader.git
cd scheduled-downloader
2. Add URLs to the file urls.txt (one per line):
Cisco product images
https://example.com/cisco1.jpg
https://example.com/cisco2.iso

3. Make the script executable:
chmod +x download.sh

4. Run the script manually:
./download.sh

5. Check results:
Files will appear in the downloads/ folder
Logs will be saved in the logs/ folder with timestamp in filename

6. Schedule with cron (optional)
To run the script automatically every day at 15:00:
crontab -e
Then add:
* * *  15 00 full/path/to/download.sh >> /full/path/to/logs/cron.log 2>&1
Replace /full/path/to/ with the actual path to your script.

Possible Extensions
Email notifications upon success/failure
GUI menu with dialog or zenity
Delete old downloads automatically
Support for FTP/SFTP/rsync

License
MIT License – Feel free to use, modify and share.

Author
Created by Alex
GitHub: https://github.com/sashko770












