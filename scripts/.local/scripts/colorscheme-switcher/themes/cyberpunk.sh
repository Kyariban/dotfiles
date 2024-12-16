#!/bin/bash

NVIM_CONFIG="$HOME/dotfiles/nvim/.config/nvim/init.lua"
STARSHIP_CONFIG="$HOME/dotfiles/starship/.config/starship.toml"
SKETCHYBAR_COLORS_CONFIG="$HOME/dotfiles/sketchybar/.config/sketchybar/config/current_colors.lua"

update_starship_palette() {
  local new_palette="$1"
  if [[ -f "$STARSHIP_CONFIG" ]]; then
    sed -i.bak -E "s/^palette = \".*\"/palette = \"$new_palette\"/" "$STARSHIP_CONFIG"
    echo "Starship palette updated to: $new_palette"
  else
    echo "Starship config file not found: $STARSHIP_CONFIG"
    exit 1
  fi
}

update_sketchybar_theme() {
  local new_theme="$1"
  if [[ -f "$SKETCHYBAR_COLORS_CONFIG" ]]; then
    sed -i.bak -E "s/require\(\"config\.themes\.[^\"]*\"\)/require(\"config.themes.$new_theme\")/" "$SKETCHYBAR_COLORS_CONFIG"
    echo "SketchyBar theme updated to: $new_theme"
  else
    echo "SketchyBar colors config file not found: $SKETCHYBAR_COLORS_CONFIG"
    exit 1
  fi
}

update_kitty_theme() {
  local new_theme="$1"
  if command -v kitten &>/dev/null; then
    kitten themes "$new_theme"
    echo "Kitty theme updated to: $new_theme"
  else
    echo "Kitten themes command not found. Install Kitty with the appropriate version."
    exit 1
  fi
}

update_sketchybar_theme "cyberdream"
update_starship_palette "cyberdream"
