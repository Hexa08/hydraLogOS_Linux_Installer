#!/bin/bash

# GDM theme path
GDM_THEME_DIR="/usr/share/gnome-shell/theme"

# Backup original files
echo "[INFO] Backing up original GDM files..."
sudo cp "$GDM_THEME_DIR/gdm.css" "$GDM_THEME_DIR/gdm.css.bak"
sudo cp "$GDM_THEME_DIR/gnome-shell.css" "$GDM_THEME_DIR/gnome-shell.css.bak"

# Copy new assets
echo "[INFO] Copying new GDM assets..."
sudo cp assets/gdm.css "$GDM_THEME_DIR/"
sudo cp assets/welcome.js "$GDM_THEME_DIR/"
sudo cp assets/welcome.html "$GDM_THEME_DIR/"

# Update gresource if needed (Optional advanced step – not required unless repacking .gresource)
# echo "[INFO] Rebuilding gnome-shell-theme.gresource..."
# sudo glib-compile-resources gnome-shell-theme.gresource.xml --target="$GDM_THEME_DIR/gnome-shell-theme.gresource" --sourcedir="$GDM_THEME_DIR"

# Set permissions
echo "[INFO] Setting correct permissions..."
sudo chmod 644 "$GDM_THEME_DIR/gdm.css"
sudo chmod 644 "$GDM_THEME_DIR/welcome.js"
sudo chmod 644 "$GDM_THEME_DIR/welcome.html"

# Restart GDM to apply changes
echo "[INFO] Restarting GDM (this will close all sessions)..."
read -p "Press Enter to restart GDM or Ctrl+C to cancel..."
sudo systemctl restart gdm 