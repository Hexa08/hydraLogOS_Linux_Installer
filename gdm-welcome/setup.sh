#!/bin/bash

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}HydraLogOS GDM Welcome Screen Installer${NC}"
echo "----------------------------------------"

# Check if running as root
if [ "$EUID" -ne 0 ]; then 
    echo -e "${RED}Please run as root${NC}"
    exit 1
fi

# Create necessary directories
echo -e "${YELLOW}Creating directories...${NC}"
mkdir -p /usr/local/share/hydralog-gdm-welcome
mkdir -p /usr/local/share/hydralog-gdm-welcome/hapk

# Copy files
echo -e "${YELLOW}Copying files...${NC}"
cp gdm.css /usr/local/share/hydralog-gdm-welcome/
cp welcome.js /usr/local/share/hydralog-gdm-welcome/
cp welcome.html /usr/local/share/hydralog-gdm-welcome/

# Create .hapk package
echo -e "${YELLOW}Creating .hapk package...${NC}"
cd /usr/local/share/hydralog-gdm-welcome/hapk

# Create package structure
mkdir -p META-INF
mkdir -p assets

# Create manifest
cat > META-INF/MANIFEST.MF << EOL
Manifest-Version: 1.0
Package-Name: hydralog-gdm-welcome
Version: 1.0
Author: HydraLogOS
Description: Custom GDM Welcome Screen with multilingual greetings
EOL

# Copy files to assets
cp ../gdm.css assets/
cp ../welcome.js assets/
cp ../welcome.html assets/

# Create package
cd /usr/local/share/hydralog-gdm-welcome
zip -r hydralog-gdm-welcome.hapk hapk/*

# Backup original GDM theme
echo -e "${YELLOW}Backing up original GDM theme...${NC}"
cp /usr/share/gnome-shell/gnome-shell-theme.gresource /usr/share/gnome-shell/gnome-shell-theme.gresource.backup

# Create temporary directory
TEMP_DIR=$(mktemp -d)
cd $TEMP_DIR

# Extract current GDM theme
echo -e "${YELLOW}Extracting GDM theme...${NC}"
glib-compile-resources --sourcedir=/usr/share/gnome-shell/theme --target=gnome-shell-theme.gresource.xml /usr/share/gnome-shell/gnome-shell-theme.gresource

# Copy custom files
echo -e "${YELLOW}Injecting custom welcome screen...${NC}"
cp /usr/local/share/hydralog-gdm-welcome/gdm.css .
cp /usr/local/share/hydralog-gdm-welcome/welcome.js .
cp /usr/local/share/hydralog-gdm-welcome/welcome.html .

# Compile new GDM theme
echo -e "${YELLOW}Compiling new GDM theme...${NC}"
glib-compile-resources gnome-shell-theme.gresource.xml

# Install new theme
echo -e "${YELLOW}Installing new theme...${NC}"
cp gnome-shell-theme.gresource /usr/share/gnome-shell/

# Cleanup
echo -e "${YELLOW}Cleaning up...${NC}"
rm -rf $TEMP_DIR

echo -e "${GREEN}Installation complete!${NC}"
echo -e "${YELLOW}The .hapk package is located at: /usr/local/share/hydralog-gdm-welcome/hydralog-gdm-welcome.hapk${NC}"
echo -e "${YELLOW}Would you like to restart GDM now? (y/n)${NC}"
read -r response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    systemctl restart gdm
    echo -e "${GREEN}GDM restarted!${NC}"
else
    echo -e "${YELLOW}Please restart GDM manually to see the changes.${NC}"
fi 