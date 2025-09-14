#!/bin/bash

# Find the correct battery device
BATTERY_DEV=$(find /sys/class/power_supply/ -maxdepth 1 -name 'BAT*' | head -n 1)

# Exit if no battery is found
if [ -z "$BATTERY_DEV" ] || [ ! -d "$BATTERY_DEV" ]; then
  # Output JSON with an error message
  echo '{"icon": "󰂭", "text": "N/A"}'
  exit 1
fi

# Get battery status and capacity
CAPACITY=$(cat "$BATTERY_DEV/capacity")
STATUS=$(cat "$BATTERY_DEV/status")

# 1. Determine the base icon based on capacity
BASE_ICON=""
if [ "$CAPACITY" -ge 95 ]; then
  BASE_ICON=""
elif [ "$CAPACITY" -ge 80 ]; then
  BASE_ICON=""
elif [ "$CAPACITY" -ge 50 ]; then
  BASE_ICON=""
elif [ "$CAPACITY" -ge 30 ]; then
  BASE_ICON=""
elif [ "$CAPACITY" -ge 10 ]; then
  BASE_ICON=""
else
  # Using a warning icon for very low battery
  BASE_ICON=""
fi

# 2. Add a charging indicator or use the base icon
ICON=""
if [ "$STATUS" = "Charging" ]; then
  # Prepend a lightning bolt to the capacity icon
  ICON=" ${BASE_ICON}"
elif [ "$STATUS" = "Full" ]; then
  # Use a simple full icon when status is Full
  ICON=""
else # Discharging
  # Use the capacity icon directly
  ICON="${BASE_ICON}"
fi

# 3. Output the final result as a JSON object
echo "$ICON ${CAPACITY}%"
