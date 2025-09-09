vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.clipboard = { "unnamedplus", "unnamed" }
vim.opt.hlsearch = true -- Set highlight on search
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.mouse = "a"

vim.opt.expandtab = true -- insert spaces when tab is pressed
vim.opt.tabstop = 4 -- number of spaces inserted when tab key pressed
vim.opt.softtabstop = 4 -- number of spaces inserted when tab key pressed
vim.opt.shiftwidth = 4 -- number of spaces inserted by < & > indent motions

vim.opt.autowrite = true
vim.opt.autoread = true
vim.opt.scrolloff = 6
vim.opt.hidden = true -- allow buffer to be hidden if modified.
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.signcolumn = "auto:2"
vim.opt.shell = "sh"
vim.opt.fileencoding = "utf-8"

-- Buffers
vim.keymap.set("n", "<C-J>", ":bp <CR>") -- Previous buffer
vim.keymap.set("n", "<C-K>", ":bn <CR>") -- Next buffer
vim.keymap.set("n", "<leader>q", ":bd <CR>") -- Close buffer
vim.keymap.set("n", "<leader>h", "<C-w>h") -- Buffer to the left
vim.keymap.set("n", "<leader>j", "<C-w>j") -- Buffer down
vim.keymap.set("n", "<leader>k", "<C-w>k") -- Buffer up
vim.keymap.set("n", "<leader>l", "<C-w>l") -- Next buffer
