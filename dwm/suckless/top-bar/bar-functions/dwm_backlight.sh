#!/bin/sh

# A dwm_bar module to display the current backlight brightness with brightnessctl
# Petar Djuraskovic (petar@hello.com)
# GNU GPLv3

# Dependencies: brightnessctl

dwm_backlight () {
    printf "☀ %.0f%s\n" "$(brightnessctl get)" "$SEP2"
}

dwm_backlight

