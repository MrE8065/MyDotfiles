#!/bin/bash

if pgrep -x "hyprsunset" >/dev/null; then
  killall -9 hyprsunset
else
  hyprsunset --temperature 4800 # Less value to increase color warmth. In my laptop I use 3000
fi