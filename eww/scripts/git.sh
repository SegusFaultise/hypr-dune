#!/bin/bash

# This script finds and counts all directories named ".git" within the user's home directory.
# The '2>/dev/null' part suppresses any "Permission denied" errors from the find command.
find ~ -type d -name ".git" 2>/dev/null | wc -l
