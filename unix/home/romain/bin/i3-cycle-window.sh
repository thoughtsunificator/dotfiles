#!/bin/bash

windows=$(xdotool search --all --desktop $(xprop -notype -root _NET_CURRENT_DESKTOP | cut -c 24-) "" 2>/dev/null)
windows=($(printf "%s\n" $windows))
currentWindow=$(xdotool getactivewindow)
windowsCount=${#windows[@]}
for i in "${!windows[@]}"; do
   if [[ "${windows[$i]}" = "${currentWindow}" ]]; then
       currentIndex=$i
   fi
done

if [ "$1" == "next" ]; then
  if [ $(($currentIndex+1)) -eq $windowsCount ]; then
    nextIndex=0
  else
    nextIndex=$(($currentIndex+1))
  fi
elif [ "$1" == "previous" ]; then
  if [ $currentIndex -eq 0 ]; then
    nextIndex=$(($windowCount-1))
  else
    nextIndex=$(($currentIndex-1))
  fi
fi
xdotool windowactivate ${windows[$nextIndex]}

