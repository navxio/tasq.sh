#!/bin/bash

qo_home="${XDG_DATA_HOME:-$HOME/.local/share}/qo"
mkdir -p $qo_home

tasks_store="$qo_home/tasks.txt"

[ ! -f $tasks_store ] && touch $tasks_store

## prints the latest task which you should be focusing on
[[ "$#" -eq 0 ]] && head -n 1 $tasks_store

while [[ "$#" -gt 0 ]]; do
  case $1 in
    -a|--add) echo $2 >> $tasks_store; echo "added: \"$2\""; shift ;;
    -x|--mark-done) echo "done: $(head -n 1 $tasks_store)"; sed 1d -i $tasks_store; shift ;;
    -h|--help) printf "tasq: a simple task manager\nFlags\n-a, --add <task text> to add a new task\n-x, --mark-done to mark the latest task as done and remove it from the task queue\n"; shift ;;
    *) printf "Unknown parameter passed: $1\nUse -h to print help text\n"; exit 1;;
  esac
  shift
done
