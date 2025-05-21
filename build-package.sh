#!/bin/bash

# Build script for .hpkg packages

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if package directory exists
if [ ! -d "example-package" ]; then
    echo -e "${RED}Error: example-package directory not found${NC}"
    exit 1
fi

echo -e "${YELLOW}Building example-package.hpkg...${NC}"

# Make scripts executable
chmod +x example-package/scripts/*.sh
chmod +x example-package/data/usr/bin/*

# Create package
cd example-package
tar czf ../example-package.hpkg *

echo -e "${GREEN}Package built successfully: example-package.hpkg${NC}"
echo -e "${YELLOW}To install the package, run:${NC}"
echo "sudo ./hpkg-install example-package.hpkg"
 