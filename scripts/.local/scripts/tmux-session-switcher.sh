#!/bin/bash

# Lister les sessions Tmux
session=$(tmux list-sessions -F "#{session_name}" | fzf --header "Sélectionnez une session (Ctrl-k pour tuer)" --bind "ctrl-k:execute(tmux kill-session -t {})+reload(tmux list-sessions -F '#{session_name}')")

# Vérifier si une session est sélectionnée
if [[ -n $session ]]; then
  tmux switch-client -t "$session"
fi
