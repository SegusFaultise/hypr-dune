#!/bin/bash

ram_usage=$(free | awk '/Mem/ {printf("%d"), $3/$2*100}')

echo "$ram_usage"
