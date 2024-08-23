#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
  selected=$1
else
  selected=$(
    (
      find ~/work -mindepth 2 -maxdepth 2 -type d
      find ~/perso -mindepth 1 -maxdepth 1 -type d
      echo "/Users/thibaultleboulch/vault/Nexus/Ressources/Ecriture/silentium"
      echo "/Users/thibaultleboulch/dotfiles/nvim/.config/nvim"
      echo "/Users/thibaultleboulch/dotfiles"
      echo "/Users/thibaultleboulch/vault/Nexus"
      echo "/Users/thibaultleboulch/Vim-Katas/exercises"
    ) | sed 's|^/Users/thibaultleboulch/||' | fzf --cycle | sed "s|^|/Users/thibaultleboulch/|"
  )
fi

if [[ -z $selected ]]; then
  exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
  tmux new-session -s $selected_name -c $selected
  exit 0
fi

if ! tmux has-session -t=$selected_name 2>/dev/null; then
  tmux new-session -ds $selected_name -c $selected
fi

tmux switch-client -t $selected_name
