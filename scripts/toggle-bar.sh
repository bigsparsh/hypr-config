#!/bin/sh

getstatus=`eww get showbar`
echo $getstatus
if [[ $getstatus == true ]]; then
  eww close navbar
  eww update showbar=false
else
  eww open navbar
  eww update showbar=true
fi
