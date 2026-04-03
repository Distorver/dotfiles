#!/bin/bash

PREV_FILE="/tmp/last_power_profile"
CURRENT=$(powerprofilesctl get)

if [ "$CURRENT" = "power-saver" ]; then
    # Restore previous or default to balanced
    TARGET=$(cat "$PREV_FILE" 2>/dev/null || echo "balanced")
    powerprofilesctl set "$TARGET"
    notify-send "Power Profile" "Active: $TARGET" -i ~/Pictures/icons/rocket.svg  -h string:x-canonical-private-synchronous:power-profile
else
    # Save current and go to power-saver
    echo "$CURRENT" > "$PREV_FILE"
    powerprofilesctl set power-saver
    notify-send "Power Profile" "Mode: Power Saver" -i ~/Pictures/icons/leaf.svg -h string:x-canonical-private-synchronous:power-profile
fi

# Force SwayNC to reload the UI state if needed (optional)
swaync-client -rs