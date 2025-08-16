#!/bin/bash

# Check if swaync is running
if pgrep -x "swaync" > /dev/null; then
  # If running, kill the swaync process
  pkill -x "swaync"
  swaync
else
  # If not running, start swaync
  swaync
fi
