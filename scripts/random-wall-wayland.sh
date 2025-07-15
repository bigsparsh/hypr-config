#!/bin/bash

cd ~/Wallpapers
image=$(ls -1 *.png |  shuf | head -1)
wal -nq -i $image -o ~/.config/scripts/restart-dunst.sh
swww img $image --transition-type random --transition-fps 60
