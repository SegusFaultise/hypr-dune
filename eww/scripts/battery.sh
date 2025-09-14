#!/bin/bash

BATTERY_DEV=$(find /sys/class/power_supply/ -maxdepth 1 -name 'BAT*' | head -n 1)

if [ -z "$BATTERY_DEV" ] || [ ! -d "$BATTERY_DEV" ]; then
  echo '{"icon": "󰂭", "text": "N/A"}'
  exit 1
fi

CAPACITY=$(cat "$BATTERY_DEV/capacity")
STATUS=$(cat "$BATTERY_DEV/status")

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
  BASE_ICON=""
fi

ICON=""
if [ "$STATUS" = "Charging" ]; then
  ICON=" ${BASE_ICON}"
elif [ "$STATUS" = "Full" ]; then
  ICON=""
else # Discharging
  ICON="${BASE_ICON}"
fi

echo "$ICON ${CAPACITY}%"
