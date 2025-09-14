#!/bin/bash

# This script counts the number of running Docker containers.
# It checks if the docker daemon is running first.
if docker info >/dev/null 2>&1; then
  docker ps -q | wc -l
else
  echo "0"
fi
