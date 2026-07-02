#!/bin/bash
if pgrep pavucontrol > /dev/null; then
    pkill pavucontrol
else
    pavucontrol &
    sleep 0.8
    hyprctl dispatch focuswindow class:org.pulseaudio.pavucontrol
    ~/.config/hypr/scripts/pavucontrol-clickout.sh &
fi
