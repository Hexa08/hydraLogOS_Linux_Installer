#!/bin/bash
#
# Hydra Package System - File Encryptor
# Copyright (c) 2025-2045 Hydra Package System
# All rights reserved.
#
# This file is part of the Hydra Package System.
# See COPYRIGHT and LICENSE files for details.
#

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Generate a master key
MASTER_KEY=$(openssl rand -hex 32)
echo -e "${YELLOW}Generated Master Key: $MASTER_KEY${NC}"
echo -e "${RED}IMPORTANT: Save this key securely! You will need it to decrypt the files.${NC}"

# Save the master key to a secure file
echo "$MASTER_KEY" > .master_key
chmod 600 .master_key

# List of files to encrypt
FILES=(
    "hpkg"
    "hpkg-install"
    "hpkg-encrypt"
    "build-package.sh"
    "example-package/control/control.txt"
    "example-package/scripts/postinst.sh"
    "example-package/data/usr/bin/example-app"
)

# Create encrypted directory
mkdir -p encrypted

# Encrypt each file
for file in "${FILES[@]}"; do
    if [ -f "$file" ]; then
        echo -e "${BLUE}Encrypting $file...${NC}"
        ./hpkg-encrypt encrypt "$file"
        mv "${file}.enc" "encrypted/${file}.enc"
        mv "${file}.enc.sha256" "encrypted/${file}.enc.sha256"
    else
        echo -e "${RED}Warning: File not found - $file${NC}"
    fi
done

# Create a decryption script
cat > encrypted/decrypt.sh << 'EOF'
#!/bin/bash
#
# Hydra Package System - File Decryptor
# Copyright (c) 2025-2045 Hydra Package System
# All rights reserved.
#
# This file is part of the Hydra Package System.
# See COPYRIGHT and LICENSE files for details.
#

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Check if master key is provided
if [ -z "$1" ]; then
    echo -e "${RED}Error: Master key required${NC}"
    echo "Usage: $0 <master_key>"
    exit 1
fi

MASTER_KEY="$1"

# List of encrypted files
FILES=(
    "hpkg.enc"
    "hpkg-install.enc"
    "hpkg-encrypt.enc"
    "build-package.sh.enc"
    "example-package/control/control.txt.enc"
    "example-package/scripts/postinst.sh.enc"
    "example-package/data/usr/bin/example-app.enc"
)

# Decrypt each file
for file in "${FILES[@]}"; do
    if [ -f "$file" ]; then
        echo -e "${BLUE}Decrypting $file...${NC}"
        ../hpkg-encrypt decrypt "$file" "${file%.enc}" "$MASTER_KEY"
    else
        echo -e "${RED}Warning: File not found - $file${NC}"
    fi
done

echo -e "${GREEN}All files decrypted successfully!${NC}"
EOF

chmod +x encrypted/decrypt.sh

echo -e "${GREEN}All files encrypted successfully!${NC}"
echo -e "${YELLOW}Encrypted files are in the 'encrypted' directory${NC}"
echo -e "${YELLOW}To decrypt the files, use:${NC}"
echo "cd encrypted && ./decrypt.sh <master_key>" 