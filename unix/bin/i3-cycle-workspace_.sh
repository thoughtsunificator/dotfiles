#!/usr/bin/env bash
i3workspaces=$(i3-msg -tget_workspaces)
visibles=$(echo $i3workspaces | jq 'to_entries | map({value:.value, index:.key})' | jq '.[] | select (.value.visible == true)')
current=$(echo $visibles | jq '. | select (.value.focused == true)')
currentMonitor=$(echo $current | jq -r '.value.output')
nonVisibles=$(echo $i3workspaces| jq 'to_entries | map({value:.value, index:.key})' | jq '.[] | select (.value.visible == false and .value.output == "'$currentMonitor'")' )
currentIndex=$(echo $i3workspaces| jq 'to_entries | map({value:.value, index:.key}) | map(select (.value.focused == true)) | .[].index') 
largestIndex=$(echo $i3workspaces| jq 'to_entries | map({value:.value, index:.key}) | map(select (.value.visible == false and .value.output == "'$currentMonitor'")) | max_by(.index) | .index')
lowestIndex=$(echo $i3workspaces| jq 'to_entries | map({value:.value, index:.key}) | map(select (.value.visible == false and .value.output == "'$currentMonitor'")) | min_by(.index) | .index')
if [ $1 == "next" ] && [ $currentIndex -ge $largestIndex ]; then
  nextIndex=$lowestIndex
elif [ $1 == "prev" ] && [ $currentIndex -le $lowestIndex ]; then
  nextIndex=$largestIndex
else
  if [[ $1 == "prev" ]]; then
    nextIndex=$(echo $i3workspaces| jq 'to_entries | map({value:.value, index:.key}) | map(select (.value.visible == false and .value.output == "'$currentMonitor'" and .index < '$currentIndex')) | last | .index')
  elif [[ $1 == "next" ]]; then
    nextIndex=$(echo $i3workspaces| jq 'to_entries | map({value:.value, index:.key}) | map(select (.value.visible == false and .value.output == "'$currentMonitor'" and .index > '$currentIndex')) | last | .index')
  fi
fi
next=$(echo $i3workspaces| jq 'to_entries | map({value:.value, index:.key}) | map(select (.index == '$nextIndex')) | .[]') 
/home/romain/rofi-scripts/i3_switch_workspace.sh "$(echo $next | jq -r '.value.name')"
