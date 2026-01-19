#!/bin/sh

title=$(playerctl metadata title 2> /dev/null)
artist=$(playerctl metadata artist 2> /dev/null)


case "$1" in
    "title")
        echo "$title"
        ;;
    "artist")
        echo "$artist"
        ;;
    *)
        echo ""
        ;;
esac
