#!/usr/bin/bash

# Check if an IP argument was provided
if [ -z "$1" ]; then
    echo "Usage: $0 <IP_ADDRESS>"
    exit 1
fi

IP=$1

echo "Attempting to remove ban for: $IP"
sudo cscli decisions delete -i "$IP"

if [ $? -eq 0 ]; then
    echo "Success: Decision for $IP has been deleted."
else
    echo "Error: Failed to remove ban for $IP."
    exit 1
fi
