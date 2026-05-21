local map = vim.keymap.set
local opts = { remap = false, silent = true } -- "remap = false" is equivalent to: "noremap = true"

map('n', ';', ':')
map('n', '<Esc>', '<cmd>nohlsearch<CR>') -- Clear highlights on search when pressing <Esc> in normal mode. See `:help hlsearch`
map("v", "p", '"_dP', opts)              -- Better paste (doesn't replace clipboard with deleted text)
map("n", "<leader>pu", "<cmd>lua vim.pack.update()<CR>")


------------ BUFFER NAVIGATION ------------

-- map('n', '<C-k>', ':bn <CR>', { desc = 'Move to next buffer' })
-- map('n', '<C-j>', ':bp <CR>', { desc = 'Move to previous buffer' })
map("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer" })
-- map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
-- map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
-- Quick switch to last edited file (super useful!)
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

------------ WINDOW NAVIGATION ------------

-- Move between windows
map('n', '<leader>h', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<leader>l', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<leader>j', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<leader>k', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
map("n", "<leader>ww", "<C-W>p", { desc = "Go to Other Window", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })

-- Resize windows with Ctrl+Shift+arrows (macOS friendly)
map("n", "<C-S-Up>", "<cmd>resize +5<CR>", opts)
map("n", "<C-S-Down>", "<cmd>resize -5<CR>", opts)
map("n", "<C-S-Left>", "<cmd>vertical resize -5<CR>", opts)
map("n", "<C-S-Right>", "<cmd>vertical resize +5<CR>", opts)

------------  OTHER ------------

-- Diagnostic keymaps
-- map('n', '<leader>q', '<cmd>copen<CR>', { desc = 'Open Quickfix' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
map("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
map("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })

-- Toggle line wrapping
-- map("n", "<leader>tw", "<cmd>set wrap!<CR>", { desc = "Toggle Wrap", silent = true })

------------ TAB MANAGEMENT ------------
-- map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
-- map("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
-- map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
-- map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
-- map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
-- map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
-- map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
