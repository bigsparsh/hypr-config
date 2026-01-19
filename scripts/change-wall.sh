#!/usr/bin/bash

# Set the wallpaper
swww img $1 --transition-type random --transition-fps 120 -f Lanczos3 --transition-bezier 0.42,0,0.58,1.0
wal -nq -i $1 -o ~/scripts/restart-dunst.sh
