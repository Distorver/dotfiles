#!/bin/bash

# Check if the "Ali" connection is active
if nmcli con show --active | grep -q "Ali"; then
    nmcli con down Ali
    notify-send "Hotspot" "Hotspot 'Ali' has been DISABLED" -i ~/Pictures/icons/hotspotoff.svg 
else
    # Ensure Wi-Fi isn't hard-blocked
    if nmcli con up Ali; then
        notify-send "Hotspot" "Hotspot 'Ali' is now ACTIVE" -i ~/Pictures/icons/hotspot.svg 
    else
        notify-send "Hotspot" "Failed to start Hotspot" -u critical -i network-error
    fi
fi