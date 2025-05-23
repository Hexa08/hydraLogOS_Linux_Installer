# HydraLogOS GDM Welcome Screen

A beautiful Apple-style multilingual welcome screen for GDM login screen with blur effect.

## Features

- Blurred background effect
- Animated multilingual "Hello" text
- Smooth transitions between languages
- Apple-style design
- Automatic installation

## Supported Languages

- English (Hello)
- Bengali (হ্যালো)
- Hindi (नमस्ते)
- Japanese (こんにちは)
- Korean (안녕하세요)
- Arabic (مرحبا)
- French (Bonjour)
- Spanish (Hola)
- Italian (Ciao)
- Portuguese (Olá)
- German (Hallo)

## Installation

1. Make sure you have the required dependencies:
   ```bash
   sudo apt install glib2.0-tools
   ```

2. Run the setup script as root:
   ```bash
   sudo ./setup.sh
   ```

3. When prompted, choose whether to restart GDM immediately.

## Uninstallation

To restore the original GDM theme:
```bash
sudo cp /usr/share/gnome-shell/gnome-shell-theme.gresource.backup /usr/share/gnome-shell/gnome-shell-theme.gresource
sudo systemctl restart gdm
```

## Customization

You can modify the following files to customize the welcome screen:

- `gdm3.css` - Change styles and animations
- `welcome.js` - Modify language list and timing
- `welcome.html` - Change HTML structure

## Requirements

- GNOME Shell 3.36 or later
- glib2.0-tools package

## License

MIT License - See LICENSE file for details 