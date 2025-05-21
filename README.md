# HydraLogOS Linux Installer

A powerful and secure Linux package management system with advanced encryption capabilities.

## Features

- Custom `.hpkg` package format
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
chmod +x hpkg hpkg-install hpkg-encrypt build-package.sh
```

## Usage

### Building Packages
```bash
./build-package.sh
```

### Installing Packages
```bash
sudo ./hpkg-install package.hpkg
```

### Managing Packages
```bash
./hpkg list                    # List installed packages
./hpkg info package-name       # Show package information
./hpkg remove package-name     # Remove a package
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

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Copyright

Copyright (c) 2025-2045 Hydra Package System. All rights reserved.
See [COPYRIGHT](COPYRIGHT) file for details.

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request 