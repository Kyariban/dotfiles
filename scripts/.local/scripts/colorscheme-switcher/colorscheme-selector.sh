#!/bin/bash

THEME_SCRIPTS_DIR="$HOME/dotfiles/scripts/.local/scripts/colorscheme-switcher/themes"

if [[ ! -d "$THEME_SCRIPTS_DIR" ]]; then
  echo "$THEME_SCRIPTS_DIR does not exists."
  exit 1
fi

SELECTED_SCRIPT=$(ls "$THEME_SCRIPTS_DIR" | fzf --prompt="Please pick a theme : " --height=10 --border --ansi)

if [[ -z "$SELECTED_SCRIPT" ]]; then
  echo "No theme selected"
  exit 0
fi

SCRIPT_PATH="$THEME_SCRIPTS_DIR/$SELECTED_SCRIPT"

if [[ ! -x "$SCRIPT_PATH" ]]; then
  echo "The script $SCRIPT_PATH can't be executed."
  exit 1
fi

echo "Switching to theme : $SELECTED_SCRIPT"
"$SCRIPT_PATH"

echo "Theme switched successfully"
