#!/bin/bash

# Check if an argument (subnet) is passed
if [ -z "$1" ]; then
    echo "Usage: $0 <subnet>"
    echo "Example: $0 192.168.1"
    exit 1
fi

# Subnet passed as an argument (e.g., 192.168.1)
subnet=$1

# Loop through the range of possible hosts
for i in {1..254}; do
    # Ping the IP and suppress output, only caring about success or failure
    ping -c 1 -W 1 "$subnet.$i" > /dev/null 2>&1

    if [ $? -eq 0 ]; then
        echo "Host $subnet.$i is up."
    else
        echo "Host $subnet.$i is down."
    fi
done
