#!/bin/bash

# This script provides RAM usage for eww.
# It outputs a continuous stream of the RAM usage percentage.

# --- RAM Usage ---
# Calculates the percentage of used RAM.
# free: gets memory statistics.
# awk '/Mem/ {...}': processes the line starting with "Mem".
# printf("%d"), $3/$2*100: calculates and prints the percentage of used memory.
ram_usage=$(free | awk '/Mem/ {printf("%d"), $3/$2*100}')

# Prints the final value for eww.
echo "$ram_usage"
