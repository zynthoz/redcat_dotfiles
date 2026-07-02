#!/bin/bash

rofi -show drun -show-icons &
ROFI_PID=$!

sleep 0.5

socat -u UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | \
while read -r line; do
    if [[ "$line" == activewindow* ]]; then
        CLASS=$(echo "$line" | awk -F',' '{print $1}' | awk -F'>>' '{print $2}')
        if [ -n "$CLASS" ] && [ "$CLASS" != "rofi" ]; then
            kill $ROFI_PID 2>/dev/null
            pkill socat
            break
        fi
    fi
done
