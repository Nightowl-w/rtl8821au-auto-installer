#!/bin/bash

echo "====================================="
echo " 🔧 Realtek WiFi Adapter Setup Script "
echo "====================================="

# Step 1: System Update & Upgrade
echo "[1/6] 🧼 Updating and Upgrading system..."
sudo apt update && sudo apt upgrade -y

# Step 2: Install required packages
echo "[2/6] 📦 Installing required packages (bc, build-essential, linux-headers)..."
sudo apt install -y bc build-essential dkms linux-headers-$(uname -r) git

# Step 3: Clone the driver repository
echo "[3/6] ⬇️ Cloning Realtek driver from GitHub..."
git clone https://github.com/morrownr/8821au-20210708.git

# Step 4: Change directory to cloned repo
cd 8821au-20210708 || { echo "❌ Folder not found!"; exit 1; }

# Step 5: Run the install script
echo "[4/6] 🚀 Installing driver..."
chmod +x install-driver.sh
sudo ./install-driver.sh

# Step 6: Final check
echo "[5/6] 🔁 Restarting NetworkManager..."
sudo systemctl restart NetworkManager

echo "[6/6] ✅ Setup Complete. Please reboot the system if WiFi does not appear."

# Optional: Show interface info
echo ""
echo "📡 Current Network Interfaces:"
ip a | grep wlan

echo "====================================="
echo " 🟢 Realtek WiFi Driver Installation Completed"
echo "====================================="
