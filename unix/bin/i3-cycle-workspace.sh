#!/usr/bin/env bash
workspaces=$(i3-msg -tget_workspaces)
visibles=$(echo $workspaces | jq '.[] | select (.visible == true)')
current=$(echo $visibles | jq '. | select (.focused == true)')
currentMonitor=$(echo $current | jq -r '.output')
echo $currentMonitor
echo $1
if [ "$currentMonitor" = "DP-1" ]; 
then
  echo "test"
  if [ "$1" = "next" ];
  then
    echo "test"
    nextMonitor="HDMI-0"
  elif [ "$1" = "previous" ];
  then
    nextMonitor="DP-5"
  fi
elif [[ "$currentMonitor" = "DP-3" ]];
then
  if [[ "$1" = "next" ]];
  then
    nextMonitor="DP-5"
  elif [[ "$1" = "previous" ]];
  then
    nextMonitor="HDMI-0"
  fi
elif [[ "$currentMonitor" = "DP-5" ]];
then
  if [[ "$1" = "next" ]];
  then
    nextMonitor="DP-1"
  elif [[ "$1" = "previous" ]];
  then
    nextMonitor="DP-3"
  fi
elif [[ "$currentMonitor" = "HDMI-0" ]];
then
  if [[ "$1" = "next" ]];
  then
    nextMonitor="DP-3"
  elif [[ "$1" = "previous" ]];
  then
    nextMonitor="DP-1"
  fi
fi
next=$(echo $workspaces | jq -r '.[] | select (.output == "'$nextMonitor'")')
/home/romain/rofi-scripts/i3_switch_workspace.sh $(echo $next | jq -r '.name')
