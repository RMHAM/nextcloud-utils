#!/usr/bin/bash

# Check if an IP argument was provided
if [ -z "$1" ]; then
    echo "Usage: $0 <IP_ADDRESS>"
    exit 1
fi

IP=$1

echo "--- Checking Active Decisions for $IP ---"
sudo cscli decisions list -i "$IP"

echo ""
echo "--- Checking Historical Alerts for $IP ---"
sudo cscli alerts list -i "$IP"
