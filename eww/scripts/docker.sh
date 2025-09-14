#!/bin/bash

if docker info >/dev/null 2>&1; then
  docker ps -q | wc -l
else
  echo "0"
fi
