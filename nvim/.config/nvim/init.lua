-- [[ Setup the leader key ]]
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- [[ Setup the nerd font
vim.g.have_nerd_font = true

-- [[ Config ]]
require("config.globals")
require("config.auto-commands")
require("config.options")
require("config.keymaps")

-- [[ Bootstrap Lazy.nvim ]]
require("config.lazy")
