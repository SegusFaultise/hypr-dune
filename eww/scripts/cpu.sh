#!/bin/bash

# This script provides CPU usage for eww.
# It outputs a continuous stream of the CPU percentage.

# --- CPU Usage ---
# Calculates the total CPU usage (user + system).
# top -bn1: runs top in batch mode for one iteration.
# grep "Cpu(s)": filters for the CPU summary line.
# awk '{print $2 + $4}': sums the user (%us) and system (%sy) percentages.
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')

# Prints the final integer value for eww.
printf "%.0f\n" "$cpu_usage"
