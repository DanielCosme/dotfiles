vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true
vim.g.autoformat = true
vim.g.trouble_lualine = true
vim.g.markdown_recommended_style = 0
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local opt = vim.opt

opt.number = false    -- Line numbers
opt.mouse = "a"       -- Enable mouse support
opt.showmode = false  -- Don't show the mode, since it's already in the status line

opt.cursorline = true -- Show which line your cursor is on
opt.wrap = false      -- Don't wrap lines
opt.scrolloff = 6     -- Minimal number of screen lines to keep above and below the cursor.

-- Split behavior
opt.splitbelow = true -- Horizontal splits go below
opt.splitright = true -- Vertical splits go right
opt.splitkeep = "screen"

-- Indentation
opt.tabstop = 2        -- Number of spaces inserted when tab key pressed
opt.softtabstop = 2    -- Number of spaces inserted when tab key pressed
opt.shiftwidth = 2     -- Number of spaces inserted by < & > indent motions
opt.expandtab = true   -- Insert spaces when tab is pressed
opt.smartindent = true -- Smart auto-indenting
opt.autoindent = true  -- Copy indent from current line
opt.breakindent = true -- Enable break indent
opt.shiftround = true  -- Round indent

-- Search settings
opt.ignorecase = true -- Case insensitive search
opt.smartcase = true  -- Case sensitive if uppercase in search
opt.hlsearch = true   -- Highlight search results
opt.incsearch = true  -- Show matches as you type

-- Visual settings
opt.termguicolors = true  -- Enable 24-bit colors
opt.signcolumn = "yes"    -- Always show sign column
opt.showmatch = true      -- Highlight matching brackets
opt.cmdheight = 1         -- Command line height
opt.pumheight = 10        -- Popup menu height
opt.pumblend = 10         -- Popup menu transparency
opt.winblend = 0          -- Floating window transparency
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 2      -- Hide * markup for bold and italic, but not markers with substitutions
opt.synmaxcol = 300       -- Syntax highlighting limit
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.winminwidth = 5       -- Minimum window width

-- File handling
opt.backup = false                            -- Don't create backup files
opt.writebackup = false                       -- Don't create backup before writing
opt.swapfile = false                          -- Don't create swap files
opt.undofile = true                           -- Persistent undo
opt.undolevels = 10000
opt.undodir = vim.fn.expand("~/.vim/undodir") -- Undo directory
opt.updatetime = 250                          -- Faster completion
opt.timeoutlen = 300                          -- Decrease mapped sequence wait time
opt.ttimeoutlen = 0                           -- Key code timeout
opt.autoread = true                           -- Auto reload files changed outside vim
opt.autowrite = true                          -- Auto save
opt.hidden = true                             -- Allow hidden buffers
-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
opt.confirm = true

-- Behavior settings
opt.errorbells = false             -- No error bells
opt.backspace = "indent,eol,start" -- Better backspace behavior
opt.autochdir = false              -- Don't auto change directory
opt.iskeyword:append("-")          -- Treat dash as part of word
opt.path:append("**")              -- include subdirectories in search
opt.selection = "exclusive"        -- Selection behavior
opt.encoding = "UTF-8"             -- Set encoding
opt.inccommand = 'split'           -- Preview substitutions live, as you type!

-- Command-line completion
opt.wildmenu = true
opt.wildmode = "longest:full,full"
-- opt.wildignore:append({ "*.o", "*.obj", "*.pyc", "*.class", "*.jar" })

-- Better diff options
opt.diffopt:append("linematch:60")

-- Performance improvements
opt.synmaxcol = 300 -- Syntax highlighting limit
opt.redrawtime = 10000
opt.maxmempattern = 20000

opt.jumpoptions = "view"
opt.laststatus = 3 -- global statusline
opt.list = false
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
opt.linebreak = true -- Wrap lines at convenient points
opt.list = true      -- Show some invisible characters (tabs...

-- Folding settings
-- opt.smoothscroll = true
-- vim.wo.foldmethod = "expr"
-- opt.foldlevel = 99             -- Start with all folds open
-- opt.formatoptions = "jcroqlnt" -- tcqj
-- opt.grepformat = "%f:%l:%c:%m"
-- opt.grepprg = "rg --vimgrep"

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
	vim.opt.clipboard = { 'unnamedplus', 'unnamed' }
end)
