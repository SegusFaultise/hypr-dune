#!/bin/bash

eww --config ~/.config/hypr/eww/ kill
eww --config ~/.config/hypr/eww/ daemon

MONITOR_NAMES=$(hyprctl monitors -j | jq -r '.[].name')

for monitor in $MONITOR_NAMES; do
  eww --config ~/.config/hypr/eww/ open bar --screen "1" &
done
