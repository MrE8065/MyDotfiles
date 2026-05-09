#!/bin/bash

if pgrep -x "sunsetr" >/dev/null; then
  pkill sunsetr
else
  sunsetr
fi
