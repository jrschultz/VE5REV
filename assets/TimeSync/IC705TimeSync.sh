#!/bin/bash
# Fetch GPS time from gpsd and set system clock with 1-second latency compensation

# Disable automatic time synchronization
sudo timedatectl set-ntp false

# Fetch GPS time
TIME=$(gpspipe -w -n 10 | grep -m 1 "time" | jq -r '.time')
if [ -n "$TIME" ]; then
    # Add 1 second to the GPS time and convert to format timedatectl expects
    FORMATTED_TIME=$(date -d "$TIME + 1 second" '+%Y-%m-%d %H:%M:%S')
    echo "Setting system time to: $FORMATTED_TIME (GPS time + 1 second)"
    sudo timedatectl set-time "$FORMATTED_TIME"
    echo "Computer time is now in sync with the IC-705 GPS"
else
    echo "No valid GPS time received."
    exit 1
fi

# Re-enable automatic synchronization (optional, remove if not needed)
# sudo timedatectl set-ntp true
