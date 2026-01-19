#!/bin/sh

con=`nmcli dev wifi list | grep '*' | awk '{print $8}'`
echo $con
