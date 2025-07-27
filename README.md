<h1 align="center">🛡️ Auto Upload Blocker for Ubuntu VPS</h1>
<p align="center">
  <b>Automatic real-time security script to delete forbidden file uploads instantly.</b><br>
  Protect your server from <code>.php</code>, <code>.html</code>, <code>.xml</code>, <code>.py</code>, and similar file threats.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Script-Shell-green?style=flat-square">
  <img src="https://img.shields.io/badge/Platform-Ubuntu%20%7C%20Debian-orange?style=flat-square">
  <img src="https://img.shields.io/badge/License-MIT-blue?style=flat-square">
  <img src="https://img.shields.io/badge/Maintained-Yes-success?style=flat-square">
</p>

---

## 🚀 Overview

This script provides a plug-and-play solution for automatic file monitoring and deletion based on extension keywords:

- ✅ Realtime monitoring using `inotifywait`
- 🔐 Auto delete files with extensions like `.php`, `.html`, `.xml`, `.py`
- 🧠 Smart keyword match (e.g. blocks `1.gsdshtml`, `abc.asaphp`)
- 📝 All activity logged to `/var/log/upload_blocker.log`
- 🧩 Fully customizable watched folders and extensions

---

## 📦 Requirements

- Ubuntu 20.04+ / Debian-based VPS
- `inotify-tools` must be installed

Install with:

    sudo apt update && sudo apt install -y inotify-tools

---

## ⚙️ Installation

Clone the repository:

    git clone https://github.com/YOUR_USERNAME/upload-blocker.git && cd upload-blocker

Make the script executable:

    chmod +x upload-blocker.sh

Run the script:

    sudo ./upload-blocker.sh

> ✅ Script will keep running and monitoring in realtime. For background use, run it inside `screen`, `tmux`, or create a `systemd` service.

---

## 📁 File Structure

| File              | Description                             |
|-------------------|------------------------------------------|
| `upload-blocker.sh` | Main shell script for realtime blocking |
| `README.md`       | Documentation and usage                  |

---

## 🔍 Example Log Output

    2025-07-27 01:02:11 - 📡 Monitoring directory: /var/www/
    2025-07-27 01:03:25 - ⚠️ Detected forbidden extension: /var/www/html/hacktool.gsdshtml
    2025-07-27 01:03:25 - ❌ Deleted: Forbidden file /var/www/html/hacktool.gsdshtml

---

## 🤝 Credits

Made with ❤️ by **Stucklabs** — automating your VPS defense.

---

## 📝 License

This project is licensed under the [MIT License](LICENSE).

> Built for VPS warriors and web defenders everywhere.
