#!/bin/bash

cd ~/Pictures/Wallpapers
image=$(ls -1 *.{jpeg,png,jpg} | shuf | head -1)
wal -nq -i $image -o ~/scripts/restart-dunst.sh
awww img $image --transition-type random --transition-fps 165
