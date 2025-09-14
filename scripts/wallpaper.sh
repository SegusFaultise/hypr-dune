#!/bin/bash

WALLPAPER_DIR="$HOME/.config/hypr/wallpapers"

CHANGE_INTERVAL="30m"

TRANSITION_TYPE="fade" # wipe, fade, grow, any, random
TRANSITION_ANGLE="30"  # Angle for the wipe transition
TRANSITION_STEP="90"   # Step size for transitions

while true; do
  WALLPAPERS=("$WALLPAPER_DIR"/*.jpeg "$WALLPAPER_DIR"/*.jpg "$WALLPAPER_DIR"/*.png)

  if [ ${#WALLPAPERS[@]} -eq 0 ]; then
    echo "No wallpapers found in $WALLPAPER_DIR. Exiting."
    exit 1
  fi

  RANDOM_WALLPAPER="${WALLPAPERS[RANDOM % ${#WALLPAPERS[@]}]}"

  swww img "$RANDOM_WALLPAPER" \
    --transition-type "$TRANSITION_TYPE" \
    --transition-angle "$TRANSITION_ANGLE" \
    --transition-step "$TRANSITION_STEP"

  sleep "$CHANGE_INTERVAL"
done
