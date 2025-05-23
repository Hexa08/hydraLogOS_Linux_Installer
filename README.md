# Hydra Package Manager (hapk)

A custom package manager for HydraLogOS that handles .hapk packages.

## Features

- Install .hapk packages
- Remove installed packages
- List installed packages
- Show package information
- Package database management

## Installation

```bash
# Clone the repository
git clone https://github.com/yourusername/hapk.git

# Install the package manager
cd hapk
sudo ./hapk hapk-install
```

## Usage

```bash
# Install a package
sudo hapk -i package.hapk

# Remove a package
sudo hapk -rf package-name

# List installed packages
hapk -ls

# Show package information
hapk -info package-name

# Show help
hapk -h
```

## Package Structure

A .hapk package should have the following structure:

```
package.hapk/
├── META-INF/
│   ├── MANIFEST.MF
│   └── postinst.sh (optional)
└── assets/
    └── (package files)
```

The MANIFEST.MF file should contain:

```
Manifest-Version: 1.0
Package-Name: package-name
Version: 1.0
Author: Your Name
Description: Package description
```

## License

Copyright (c) 2025-2045 Hydra Package System
All rights reserved.

This project is part of the Hydra Package System.
See COPYRIGHT and LICENSE files for details. 