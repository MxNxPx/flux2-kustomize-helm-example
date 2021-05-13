#!/bin/bash
cmd_pattern="^#(touch|kubectl|kubeseal)"

# find and loop thru all kustomization.yaml files
for i in $(find . -type f -name 'kustomization.yaml'); do
  # set current dir to later return back to
  start_dir=$(pwd)

  # look for a command pattern in the file
  command_list=$(egrep "$cmd_pattern" $i 2>/dev/null)

  # if command pattern not empty (aka finds a match) then perform operations
  if [[ ! -z "$command_list" ]]; then
    echo "[*] updating $i"

    # change to the dir where the file is stored
    cd $(dirname $i)

    # remove portion of the file below "resources:" to the end
    sed -i '/^resources:$/q' kustomization.yaml

    # read in the list of commands and execute them
    while IFS= read -r cmd; do
      eval $(echo "$cmd" | sed 's/^#//g')
    done <<< "$command_list"

    # return to starting dir before going to the next file in the loop
    cd $start_dir
  fi

done
