#!/bin/bash

tasks_store="$HOME/.tasks.qo.txt"

[ ! -f $tasks_store ] && touch $tasks_store

## prints the latest task which you should be focusing on
[[ "$#" -eq 0 ]] && head -n 1 $tasks_store

while [[ "$#" -gt 0 ]]; do
  case $1 in
    -x|--mark-done) echo "done: $(head -n 1 $tasks_store)"; sed 1d $tasks_store | tee $tasks_store; shift ;;
    -a|--add) echo "added: \"$2\""; echo $2 >> $tasks_store; shift ;;
    *) echo "Unknown parameter passed: $1"; exit 1;;
  esac
  shift
done
