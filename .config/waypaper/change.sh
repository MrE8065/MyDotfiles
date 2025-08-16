#!/bin/bash

wallpaper=$1

wal -i $wallpaper -n --cols16
swaync-client --reload-css
pywalfox update
