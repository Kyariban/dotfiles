#!/bin/bash

KITTY_CONFIG="$HOME/dotfiles/kitty/.config/kitty/kitty.conf"

toggle_kitty_transparency() {
  if [[ -f "$KITTY_CONFIG" ]]; then
    if grep -q "^background_opacity " "$KITTY_CONFIG"; then
      current_opacity=$(grep "^background_opacity " "$KITTY_CONFIG" | awk '{print $2}')
      if [[ "$current_opacity" == "1.0" ]]; then
        sed -i.bak -E "s/^background_opacity .*/background_opacity 0.8/" "$KITTY_CONFIG"
        echo "Kitty transparency enabled (opacity: 0.8)."
      else
        sed -i.bak -E "s/^background_opacity .*/background_opacity 1.0/" "$KITTY_CONFIG"
        echo "Kitty transparency disabled (opacity: 1.0)."
      fi
    else
      echo "background_opacity 0.8" >>"$KITTY_CONFIG"
      echo "Transparency setting added (opacity: 0.8)."
    fi

    # Restart Kitty cleanly
    kill -SIGUSR1 $(pidof kitty)
  else
    echo "Kitty config file not found: $KITTY_CONFIG"
    exit 1
  fi
}

toggle_kitty_transparency
