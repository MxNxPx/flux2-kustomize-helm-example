#!/bin/bash

for i in $(find . -type f -name 'kustomization.yaml'); do
  SAVEIFS=$IFS
  IFS=$'\n'

  command_list=$(grep "^# kustomize" $i 2>/dev/null)
  if [[ ! -z "${command_list}" ]]; then
    echo "[*] updating $i"
    cd $(dirname $i)
    sed -i '/^resources:$/q' kustomization.yaml

    for cmd in $command_list; do
      echo $cmd | sed 's/^#//' | bash
    done

  fi

done
IFS=$SAVEIFS
