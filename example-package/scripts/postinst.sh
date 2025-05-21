#!/bin/bash

echo "Running post-installation script..."
echo "Creating necessary directories..."

# Create application directory
mkdir -p /opt/example-app

# Set permissions
chmod 755 /opt/example-app

echo "Post-installation completed successfully!" 