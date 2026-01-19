#!/bin/sh

last_title=`~/temp/last_title.sh`

  # get album details
  current_title=`playerctl metadata --format '{{ title }}' 2> /dev/null`
  album_cover=`playerctl metadata 2> /dev/null | grep artUrl | awk '{ print $3 }'`

  if [[ -z "$current_title" ]]; then
    if [[ "$last_title" != "$current_title" ]]; then
      image=`ls -1 ~/drive/Documents/wall-master/Images/*.png | shuf | head -1`
      cp $image /tmp/cover.png
      last_title=$current_title

    fi
  fi

  if [[ "$last_title" != "$current_title" ]]; then

    # removing the previous cover
    rm -rf /tmp/cover.png

    # downloading the new cover
    if [[ $album_cover =~ "file" ]]; then
      new_cover=`sed 's/file:\/\///' <<< $album_cover`
      cp $new_cover /tmp/cover.png
    else
      wget $album_cover -O /tmp/cover.png
    fi

    # setting the new cover

  fi
  echo "echo '$current_title'" > ~/temp/last_title.sh
  
  echo "/tmp/cover.png"

