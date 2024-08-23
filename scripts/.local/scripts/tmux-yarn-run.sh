#!/bin/bash

if [ ! -f package.json ]; then
  echo "package.json not found in this folder"
  exit 1
fi

script=$(jq -r '.scripts | keys[]' package.json | fzf --prompt="Pick a script too launch")

if [ -z "$script" ]; then
  exit 1
fi

tmux split-window -v "yarn run $script;

