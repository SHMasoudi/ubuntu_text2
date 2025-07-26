#!/bin/bash
# ----------------------------
# 🧠 Ubuntu Server Setup Script
# برای اجرای پروژه Django + Next.js
# ----------------------------

set -e  # اگر هر دستوری خطا داد، اسکریپت قطع بشه

# ✅ ۱. بروزرسانی سیستم
sudo apt update && sudo apt upgrade -y

# ✅ ۲. ابزارهای پایه
sudo apt install -y curl git build-essential software-properties-common ufw htop net-tools

# ✅ ۳. نصب Python برای Django
sudo apt install -y python3 python3-pip python3-venv

# ✅ ۴. نصب Node.js (نسخه ۱۸)
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs

# ✅ ۵. نصب Nginx
sudo apt install -y nginx

# ✅ ۶. نصب PM2 برای اجرای دائمی Next.js
sudo npm install -g pm2

# ✅ ۷. نصب Microsoft SQL Server Driver (ODBC 18) برای Django
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /usr/share/keyrings/microsoft-prod.gpg > /dev/null
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft-prod.gpg] https://packages.microsoft.com/ubuntu/22.04/prod jammy main" | sudo tee /etc/apt/sources.list.d/mssql-release.list
sudo apt update
sudo ACCEPT_EULA=Y apt install -y msodbcsql18 unixodbc-dev

# ✅ ۸. فعال‌سازی فایروال UFW
sudo ufw allow OpenSSH
sudo ufw allow 80
sudo ufw allow 443
sudo ufw --force enable

# 🟡 پایان نصب پایه

echo -e "\n✅ نصب اولیه Ubuntu Server کامل شد!"
echo -e "🔧 حالا می‌تونی پروژه‌ت رو کلون کنی و بخش بعدی (راه‌اندازی پروژه) رو انجام بدی."
echo -e "برای راه‌اندازی بک‌اند Django و فرانت Next.js فقط بگو تا اسکریپتش رو هم بسازم."
