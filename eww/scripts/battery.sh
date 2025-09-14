#!/bin/bash

# A script to get the battery status and display it with an icon for eww.

# Find the first battery device automatically.
# This makes the script more portable across different laptops.
BATTERY_DEV=$(find /sys/class/power_supply/ -maxdepth 1 -name 'BAT*' | head -n 1)

# Check if a battery device was found
if [ -z "$BATTERY_DEV" ] || [ ! -d "$BATTERY_DEV" ]; then
  echo "No Battery"
  exit 1
fi

# Get battery percentage
CAPACITY=$(cat "$BATTERY_DEV/capacity")

# Get battery status (e.g., Charging, Discharging, Full)
STATUS=$(cat "$BATTERY_DEV/status")

# Determine the icon based on status and capacity
ICON=""

if [ "$STATUS" = "Charging" ]; then
  # Use a charging icon that changes with capacity
  if [ "$CAPACITY" -ge 95 ]; then
    ICON="󰂄"
  elif [ "$CAPACITY" -ge 80 ]; then
    ICON="󰂊"
  elif [ "$CAPACITY" -ge 60 ]; then
    ICON="󰂉"
  elif [ "$CAPACITY" -ge 40 ]; then
    ICON="󰂈"
  elif [ "$CAPACITY" -ge 20 ]; then
    ICON="󰂇"
  else
    ICON="󰂆"
  fi
elif [ "$STATUS" = "Full" ]; then
  ICON="󰁹" # Full icon
else       # Discharging or Unknown state
  if [ "$CAPACITY" -ge 95 ]; then
    ICON="󰁹"
  elif [ "$CAPACITY" -ge 80 ]; then
    ICON="󰂂"
  elif [ "$CAPACITY" -ge 70 ]; then
    ICON="󰂁"
  elif [ "$CAPACITY" -ge 60 ]; then
    ICON="󰂀"
  elif [ "$CAPACITY" -ge 50 ]; then
    ICON="󰁿"
  elif [ "$CAPACITY" -ge 40 ]; then
    ICON="󰁾"
  elif [ "$CAPACITY" -ge 30 ]; then
    ICON="󰁽"
  elif [ "$CAPACITY" -ge 20 ]; then
    ICON="󰁼"
  elif [ "$CAPACITY" -ge 10 ]; then
    ICON="󰁻"
  else
    ICON="󰂃" # Critical icon
  fi
fi

# Print the final output
echo "$ICON $CAPACITY%"
