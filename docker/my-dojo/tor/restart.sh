#!/bin/bash
set -e

# Set permissions for sliced
echo "## Set permissions on /var/lib/tor dir ###"
chmod 750 /var/lib/tor

echo "## Start tor #############################"
tor