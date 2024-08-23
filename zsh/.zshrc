# Oh my zsh config
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Zinit plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# snippets 
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::aws
zinit snippet OMZP::aliases
zinit snippet OMZP::yarn
zinit snippet OMZP::docker
zinit snippet OMZP::docker-compose

autoload -Uz compinit && compinit

zinit cdreplay -q

zstyle ':completion:*' list-colors "${(s.:.)LS_COLOR}"

bindkey '^f' autosuggest-accept
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Aliases
dcu() {
    docker-compose -f "$1" up -d
}


# eza
if command -v eza &>/dev/null; then
  alias ls='eza'
  alias ll='eza -lhg'
  alias lla='eza -alhg'
  alias tree='eza --tree'
fi

# Bat
if command -v bat &>/dev/null; then
  alias cat='bat --paging=never --style=plain'
  alias catt='bat'
  alias cata='bat --show-all --paging=never'
fi

# Zsh Vi Mode
# https://github.com/jeffreytse/zsh-vi-mode
if [ -f "$(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh" ]; then
  source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
  # Following 4 lines modify the escape key to `jk`
  ZVM_VI_ESCAPE_BINDKEY=jk
  ZVM_VI_INSERT_ESCAPE_BINDKEY=$ZVM_VI_ESCAPE_BINDKEY
  ZVM_VI_VISUAL_ESCAPE_BINDKEY=$ZVM_VI_ESCAPE_BINDKEY
  ZVM_VI_OPPEND_ESCAPE_BINDKEY=$ZVM_VI_ESCAPE_BINDKEY

  function zvm_after_lazy_keybindings() {
    zvm_bindkey vicmd 'gh' beginning-of-line
    zvm_bindkey vicmd 'gl' end-of-line
  }

  ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BEAM
  ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BLOCK
  ZVM_OPPEND_MODE_CURSOR=$ZVM_CURSOR_BLINKING_UNDERLINE

  # Source .fzf.zsh so that the ctrl+r bindkey is given back fzf
  zvm_after_init_commands+=('[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh')
fi

eval "$(pyenv init --path)"
alias lc='colorls -A --sd'
alias v='nvim'
alias vim='nvim'
alias ls='ls --color'
alias c='clear'
alias lg='lazygit'
alias tma='tmux attach -d -t'
alias tls='tmux ls'
alias tmop='~/.local/scripts/tmux-sessionizer.sh'
alias mci="mvn clean install -DskipTests"
alias gci="gradle clean build -x test"
alias opa='kitty @ set-background-opacity'

if command -v code-insiders &> /dev/null; then
  alias code="code-insiders"
fi

function code() {
  command code "$@"
}

kitty-reload() {
    kill -SIGUSR1 $(pidof kitty)
}

if [ -f ~/.zshrc_private ]; then
    source ~/.zshrc_private 
fi
    
source $(dirname $(gem which colorls))/tab_complete.sh

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Eval loadings
eval "$(starship init zsh)"
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

PATH="$PATH":"$HOME/.local/scripts/"
PATH="$PATH":"$HOME/.local/scripts/colorscheme-switcher/"
PATH="$PATH":"$HOME/.local/scripts/toggle-transparency.sh/"
PATH="$PATH":"$HOME/.work_scripts/"
bindkey -s ^f "tmux-sessionizer\n"

# Load Angular CLI autocompletion.
source <(ng completion script)
