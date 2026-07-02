#!/bin/bash
while true; do
    if ! pgrep pavucontrol > /dev/null; then
        exit
    fi
    active=$(hyprctl activewindow -j | grep '"class"' | awk -F'"' '{print $4}')
    if [ "$active" != "org.pulseaudio.pavucontrol" ]; then
        pkill pavucontrol
        exit
    fi
    sleep 0.2
done
