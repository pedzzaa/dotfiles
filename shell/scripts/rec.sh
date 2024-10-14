#!/bin/bash

# Default FPS
FPS=21
RESOLUTION="1920x1080"
AUDIO_BITRATE="128k"
VIDEO_CODEC="libx264"
QUALITY="medium"
AUDIO_CODEC="aac"
VIDEO_OUTPUT="$HOME/Videos/output.mp4"

# Audio device
# I use pipewire because I have Hyprland along with DWM.
echo "You can run 'pactl list sources short' to see available audio sources"
echo -e "In my case it is 0\n"
AUDIO_SOURCE=0

read -p "Enter framerate (default $FPS): " input
FPS=${input:-$FPS}

echo "Select video quality:"
echo "1. ultrafast"
echo "2. superfast"
echo "3. veryfast"
echo "4. faster"
echo "5. fast"
echo "6. medium (default)"
echo "7. slow"
echo "8. slower"
echo "9. veryslow"

read -p "Enter the number corresponding to quality: " input_quality

# Use the selected number to set the quality preset
case "$input_quality" in
    1) QUALITY="ultrafast" ;;
    2) QUALITY="superfast" ;;
    3) QUALITY="veryfast" ;;
    4) QUALITY="faster" ;;
    5) QUALITY="fast" ;;
    6) QUALITY="medium" ;;  # default
    7) QUALITY="slow" ;;
    8) QUALITY="slower" ;;
    9) QUALITY="veryslow" ;;
    *) QUALITY="medium" ;;  # If input is invalid or empty, default to medium
esac

ffmpeg -video_size "$RESOLUTION" -framerate "$FPS" -f x11grab -i :0.0 -f pulse -i "$AUDIO_SOURCE" \
       -b:a "$AUDIO_BITRATE" -c:v "$VIDEO_CODEC" -preset "$QUALITY" -c:a "$AUDIO_CODEC" "$VIDEO_OUTPUT"

