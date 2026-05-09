#!/bin/bash

# 3 min - Screen off
# 5 min - Lock
# 30 min - Suspend

swayidle -w \
  timeout 180 'niri msg action power-off-monitors' \
    resume 'niri msg action power-on-monitors' \
	timeout 300 'swaylock -f' \
	timeout 1800 'systemctl suspend' \
	before-sleep 'swaylock -f' \
  after-resume 'niri msg action power-on-monitors'
