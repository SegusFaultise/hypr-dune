#!/bin/bash
# This script continuously monitors Hyprland workspaces and outputs JSON for Eww.

workspaces() {
  hyprctl workspaces -j | jq -c 'sort_by(.id) | map({id: .id, windows: .windows, class: .id == ('$(hyprctl activeworkspace -j | jq '.id')') ? "active" : ""})'
}

# Initial output
workspaces

# Listen for Hyprland events and update on change
socat -u UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | while read -r line; do
  workspaces
done
