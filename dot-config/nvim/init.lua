vim.g.mapleader = " "
vim.g.maplocalleader = " "

require "config"
require "plugins"

vim.cmd("syntax on")
vim.cmd("packadd nvim.undotree")
vim.cmd("packadd nvim.difftool")

-- Experimental
require('vim._core.ui2').enable()
