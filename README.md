# dotfiles

The list of my dotfiles for my mac config, prolly works on linux too.


# Installation

- install stow (brew install stow)

Then you can clone this repo, go into it and use the command stow [package] and add any package that you want to your own dotfiles.

for example using stow nvim, will install my nvim config on your system.


Stow however will not install packages for you, if you want specific componants you'll have to do it manually

- Karabiner config is for keyboard remaps
- Sketchybar is to have a proper bar on top of your screen (hide mac by default, same for the dock)
- zsh for a better looking terminal
- aerospace for the tiling manager
- starship is the terminal prompt
- nvim for nvim duh
- tmux to have a good mutliplex terminal with nvim like controls.

for some apps you'll need to install extra components

sketchybar will need sketchy-bar-font

tmux will need tpm installed, once installed the conf file will allow you to reload the config and install plugins, read .tmux.conf for more details

zsh will need oh my zsh


nvim uses kickstart, you can check the original repo for more details

