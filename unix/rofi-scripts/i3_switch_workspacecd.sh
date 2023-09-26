#!/bin/bash
i3workspaces=$(i3-msg -tget_workspaces)
visibles=$(echo $i3workspaces | jq '.[] | select (.visible == true)')
current=$(echo $visibles | jq '. | select (.focused == true)')
monitor=$(echo $current | jq -r '.output')
monitors=$(echo $i3workspaces | jq '[.[].output] | unique')
function gen_workspaces()
{
    echo $i3workspaces | tr ',' '\n' | grep "name" | grep ":$monitor" | sed 's/"name":"\(.*\)"/\1/g' | sort -n
}
workspaces=$( printf "%s\n" `gen_workspaces`)
if [ ! -z "$1" ];
then
if [[ ${1} != *":"* ]];
then
workspaceName="$1:$monitor" 
fi
wName=(${workspaceName//:/ }[1])
i3-msg workspace "${workspaceName}" >/dev/null
for workspace in $(echo $i3workspaces | jq -r '.[].name')
do
nwName=(${workspace//:/ }[1])
if [ "$wName" = "$nwName" ]; then
    i3-msg workspace "$workspace" >/dev/null
fi
done
i3-msg workspace "$workspaceName" >/dev/null
else
    printf "%s\n" $workspaces
fi
