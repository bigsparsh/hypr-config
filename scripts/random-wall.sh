#!/usr/bin/bash

cd ~/Wallpapers
image=$(ls -1 *.{jpeg,png} | shuf | head -1)

swww img $image --transition-type random --transition-fps 120 -f Lanczos3 --transition-bezier 0.42,0,0.58,1.0
wal -nq -i $image -o ~/scripts/restart-dunst.sh
sleep 1
pkill cava 
ghostty --background-opacity=0 --title=cava-new -e cava
