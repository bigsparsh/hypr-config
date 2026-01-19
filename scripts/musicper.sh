#!/bin/sh

current=`playerctl metadata --format '{{ position }}'`
total=`playerctl metadata --format '{{ mpris:length }}'`
per=`jq -n '((('$total'-'$current')/'$total')*100)'`
echo $per

