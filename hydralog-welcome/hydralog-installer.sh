#!/bin/bash

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}HydraLogOS Welcome Screen Installer${NC}"
echo "----------------------------------------"

# Check if running as root
if [ "$EUID" -ne 0 ]; then 
    echo -e "${RED}Please run as root${NC}"
    exit 1
fi

# Create necessary directories
echo -e "${YELLOW}Creating directories...${NC}"
mkdir -p /usr/local/share/hydralog-welcome
mkdir -p /usr/local/share/hydralog-welcome/hapk

# Copy files
echo -e "${YELLOW}Copying files...${NC}"
cp gdm.css /usr/local/share/hydralog-welcome/
cp welcome.js /usr/local/share/hydralog-welcome/
cp welcome.html /usr/local/share/hydralog-welcome/

# Create .hapk package
echo -e "${YELLOW}Creating .hapk package...${NC}"
cd /usr/local/share/hydralog-welcome/hapk

# Create package structure
mkdir -p META-INF
mkdir -p assets

# Create manifest
cat > META-INF/MANIFEST.MF << EOL
Manifest-Version: 1.0
Package-Name: hydralog-welcome
Version: 1.0
Author: HydraLogOS
Description: Custom Welcome Screen with multilingual greetings
EOL

# Copy files to assets
cp ../gdm.css assets/
cp ../welcome.js assets/
cp ../welcome.html assets/

# Create package
cd /usr/local/share/hydralog-welcome
zip -r hydralog-welcome.hapk hapk/*

# Create desktop shortcut
echo -e "${YELLOW}Creating desktop shortcut...${NC}"
cat > /usr/share/applications/hydralog-welcome.desktop << EOL
[Desktop Entry]
Name=HydraLogOS Welcome
Comment=HydraLogOS Welcome Screen
Exec=xdg-open /usr/local/share/hydralog-welcome/welcome.html
Icon=system-help
Terminal=false
Type=Application
Categories=Utility;
EOL

# Set permissions
echo -e "${YELLOW}Setting permissions...${NC}"
chmod 644 /usr/local/share/hydralog-welcome/*
chmod 755 /usr/local/share/hydralog-welcome
chmod 644 /usr/share/applications/hydralog-welcome.desktop

echo -e "${GREEN}Installation complete!${NC}"
echo -e "${YELLOW}The .hapk package is located at: /usr/local/share/hydralog-welcome/hydralog-welcome.hapk${NC}"
echo -e "${YELLOW}You can find the welcome screen in your applications menu.${NC}"

$response = Read-Host "Would you like to open the welcome screen now? (y/n)"
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    xdg-open /usr/local/share/hydralog-welcome/welcome.html
fi 