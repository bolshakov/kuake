#!/bin/sh
# State file contains information about current state of Kuake window.
state_file="/tmp/kuake"
# If state_file exists (kuake started)
if [ -a $state_file ]; then
  # Read Kuake window state (visible or invisible)
  kuake_state=`cat $state_file`
  # window invisible
  if [ "$kuake_state" == "invisible" ]; then
    devilspie ~/.devilspie/kuake-invisible.ds
    kuake_state="visible"
  else # window visible
    devilspie ~/.devilspie/kuake-visible.ds
    kuake_state="invisible"
  fi
else # if state_file doesn't exists (kuake not started yet)
  gnome-terminal --title="Kuake-console"
  devilspie ~/.devilspie/kuake-started.ds
  kuake_state="visible"
fi

echo "$kuake_state" > $state_file

