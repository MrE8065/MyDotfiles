#!/bin/bash

STATE_FILE="/tmp/waybar_arrow_state"

# Si el archivo no existe, se crea con valor "left"
if [ ! -f "$STATE_FILE" ]; then
    echo "left" > "$STATE_FILE"
fi

# Leer estado actual
STATE=$(cat "$STATE_FILE")

# Alternar estado
if [ "$1" = "toggle" ]; then
    if [ "$STATE" = "left" ]; then
        echo "right" > "$STATE_FILE"
    else
        echo "left" > "$STATE_FILE"
    fi
fi

# Mostrar ícono en función del estado
STATE=$(cat "$STATE_FILE")
if [ "$STATE" = "left" ]; then
    echo '{"text": "", "tooltip": "Show tray"}'
else
    echo '{"text": "", "tooltip": "Hide tray"}'
fi
