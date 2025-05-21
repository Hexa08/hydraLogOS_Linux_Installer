# HydraLogOS Linux Installer

A powerful and secure Linux package management system with advanced encryption capabilities.

## ⚠️ Important Notice

**This repository is private and proprietary.**
- Forking is strictly prohibited
- Unauthorized copying, modification, distribution, or use of this software is strictly prohibited
- All rights are reserved by the copyright holder
- Any unauthorized use will be subject to legal action

## Features

- Custom `.hapk` package format
- AES-256-CBC encryption for package security
- SHA-256 hash verification
- Package dependency management
- Post-installation scripts support
- Command-line interface for package management
- Windows and Linux support

## Installation

```bash
# Clone the repository
git clone https://github.com/Hexa08/hydraLogOS_Linux_Installer.git
cd hydraLogOS_Linux_Installer

# Make scripts executable
chmod +x hapk hapk-install hapk-encrypt build-package.sh
```

## Usage

### Building Packages
```bash
# On Windows
powershell -ExecutionPolicy Bypass -File build-package.ps1

# On Linux
./build-package.sh
```

### Installing Packages
```bash
sudo ./hapk-install package.hapk
```

### Managing Packages
```bash
./hapk list                    # List installed packages
./hapk info package-name       # Show package information
./hapk remove package-name     # Remove a package
```

### Encrypting Packages
```bash
# Windows
.\encrypt-windows.ps1

# Linux
./encrypt-all.sh
```

## Security Features

- AES-256-CBC encryption
- SHA-256 hash verification
- Master key protection
- File integrity checks

## License

This project is proprietary software. All rights reserved.
See [LICENSE](LICENSE) file for details.

## Copyright

Copyright (c) 2025-2045 Hydra Package System. All rights reserved.
See [COPYRIGHT](COPYRIGHT) file for details.

## Legal Notice

1. This software is protected by copyright law
2. Unauthorized copying, modification, distribution, or use is strictly prohibited
3. Any attempt to fork, copy, or modify this repository without explicit permission will result in legal action
4. For licensing inquiries, please contact the copyright holder

## Contact

For any inquiries regarding licensing or permissions, please contact the repository owner. 