#!/bin/bash

echo "Running post-installation script..."
echo "Creating necessary directories..."

# Create application directory
mkdir -p /opt/flappi-app 

# Set permissions
chmod 755 /opt/flappi-app

echo "Post-installation completed successfully!" 