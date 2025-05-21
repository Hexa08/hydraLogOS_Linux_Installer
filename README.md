# Hydra Package (.hpkg) System

A custom Linux package format similar to .deb packages, providing a dpkg-like package management system.

## Features

- Custom package format (.hpkg)
- dpkg-like command line interface
- Dependency management
- Package database tracking
- Pre/post installation scripts
- Colored terminal output
- Package status tracking

## Installation

```bash
# Clone the repository
git clone https://github.com/yourusername/hydra-package-system.git
cd hydra-package-system

# Make scripts executable
chmod +x hpkg hpkg-install

# Move to system directory (optional)
sudo mv hpkg hpkg-install /usr/local/bin/
```

## Usage

```bash
# Install a package
sudo hpkg install package.hpkg

# Remove a package
sudo hpkg remove package-name

# List installed packages
hpkg list

# Show package information
hpkg info package-name

# Show help
hpkg help
```

## Package Structure

```
package.hpkg
├── control/
│   └── control.txt         # Package metadata
├── data/
│   └── usr/
│       └── bin/           # Executables
└── scripts/
    ├── preinst.sh         # Pre-installation script
    └── postinst.sh        # Post-installation script
```

## Creating Packages

1. Create package structure:
```bash
mkdir -p mypackage/control
mkdir -p mypackage/data/usr/bin
mkdir -p mypackage/scripts
```

2. Add control file (control/control.txt):
```
Package: myapp
Version: 1.0.0
Architecture: amd64
Maintainer: Your Name <your.email@example.com>
Depends: python3, curl
Description: My awesome application
```

3. Add your files to data/ directory

4. Add installation scripts if needed

5. Build package:
```bash
cd mypackage
tar czf ../mypackage.hpkg *
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Future Plans

- Package repository support
- GUI installer
- Package signature verification
- Package update system
- Cross-platform support 