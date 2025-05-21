#!/bin/bash
#
# Hydra Package Builder
# Copyright (c) 2025-2045 Hydra Package System
# All rights reserved.
#
# This file is part of the Hydra Package System.
# See COPYRIGHT and LICENSE files for details.
#

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Check if package directory exists
if [ ! -d "example-package" ]; then
    echo -e "${RED}Error: example-package directory not found${NC}"
    exit 1
fi

# Create temporary build directory
BUILD_DIR=$(mktemp -d)
echo -e "${BLUE}Created temporary build directory: $BUILD_DIR${NC}"

# Copy package contents
echo -e "${YELLOW}Copying package contents...${NC}"
cp -r example-package/* "$BUILD_DIR/"

# Create package archive
echo -e "${YELLOW}Creating package archive...${NC}"
cd "$BUILD_DIR"
tar -czf ../example.hapk *

# Clean up
cd - > /dev/null
rm -rf "$BUILD_DIR"

echo -e "${GREEN}Package built successfully: example.hapk${NC}"
 