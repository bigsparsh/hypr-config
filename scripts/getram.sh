#!/bin/sh

# ram=`printf "%.0f\n" $(free -m | grep Mem | awk '{print ($3/$2)*100}')`
printf "%.0f\n" $(free -m | grep Mem | awk '{print ($3/$2)*100}')
