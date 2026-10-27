vim.pack.add({
	"https://github.com/folke/snacks.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
})

local sn = require("snacks")

sn.setup({
	picker = { enabled = true },
	explorer = { enabled = true, replace_netrw = false },
	bigfile = { enabled = true },
	zen = {
		enabled = true,
		center = false,
		toggles = {
			dim = false,
		},
		styles = {
			width = 150,
		},
		win = { style = "zen" },
		on_open = function(win)
			vim.opt.list = false
		end,
		on_close = function(win)
			vim.opt.list = true
		end,
	},

	animate = { enabled = false },
	dashboard = { enabled = false },
	dim = { enabled = false },
	image = { enabled = false },
	indent = { enabled = false },
	input = { enabled = false },
	layout = { enabled = false },
	notifier = { enabled = false },
	quickfile = { enabled = false },
	scope = { enabled = false },
	scratch = { enabled = false },
	scroll = { enabled = false },
	statuscolumn = { enabled = false },
	terminal = { enabled = false },
	toggle = { enabled = false },
	words = { enabled = false },
})

local keymaps = {
	-- Top Pickers & Explorer
	{ "<leader><space>", function() sn.picker.buffers() end,         desc = "Search Buffers" },
	{ "<leader>ss",      function() sn.picker.smart() end,           desc = "Search Files Smart" },
	{ "<leader>sg",      function() sn.picker.grep() end,            desc = "Search All (grep)" },
	{ "<leader>sc",      function() sn.picker.command_history() end, desc = "Search Command History" },
	{ "<leader>e",       function() sn.explorer() end,               desc = "Snacks File Explorer" },
	{ '<leader>sr',      function() sn.picker.registers() end,       desc = "Snacks Registers" },
	{ "<leader>sl",      function() sn.picker.loclist() end,         desc = "Snacks Location List" },
	{ "<leader>sc",      function() sn.picker.colorschemes() end,    desc = "Snacks Colorschemes" },
	{ "<leader>sf",      function() sn.picker.files() end,           desc = "Find Files" },
	{ "<leader>z",       function() sn.zen.zoom() end,               desc = "Zen mode" },
	-- { "<leader>n",       function() sn.picker.notifications() end,   desc = "Notification History" },
	-- { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
	-- { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
	-- { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
	-- { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
	-- -- git
	-- { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
	-- { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
	-- { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
	-- { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
	-- { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
	-- { "<leader>gp", function() Snacks.picker.git_diff() end, desc = "Git Diff Picker (Hunks)" },
	-- { "<leader>gP", function() Snacks.picker.git_diff({ base = "origin" }) end, desc = "Git Diff Picker(origin)" },
	-- { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
	-- -- Grep
	-- { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
	-- { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
	-- { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
	-- -- search
	-- { '<leader>s/', function() Snacks.picker.search_history() end, desc = "Search History" },
	-- { "<leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
	-- { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
	-- { "<leader>sc", function() Snacks.picker.command_history() end, desc = "Command History" },
	-- { "<leader>sC", function() Snacks.picker.commands() end, desc = "Commands" },
	-- { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
	-- { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
	-- { "<leader>sH", function() Snacks.picker.highlights() end, desc = "Highlights" },
	-- { "<leader>si", function() Snacks.picker.icons() end, desc = "Icons" },
	-- { "<leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps" },
	-- { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
	-- { "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
	-- { "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages" },
	-- { "<leader>sp", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
	-- { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
	-- { "<leader>sR", function() Snacks.picker.resume() end, desc = "Resume" },
	-- { "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },
	-- -- LSP
	-- { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
	-- { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
	-- { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
	-- { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
	-- { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
	-- { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
	-- { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
	-- { "gai", function() Snacks.picker.lsp_incoming_calls() end, desc = "C[a]lls Incoming", has = "callHierarchy/incomingCalls" },
	-- { "gao", function() Snacks.picker.lsp_outgoing_calls() end, desc = "C[a]lls Outgoing", has = "callHierarchy/outgoingCalls" },
	-- -- buffers
	-- { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete buffer", mode = { "n" }, },
	-- { "<leader>bo", function() Snacks.bufdelete.other() end, desc = "Delete other buffers", mode = { "n" }, },
	-- -- terminal
	-- { "<leader>fT", function() Snacks.terminal() end, desc = "Terminal (cwd)", mode = "n", },
	-- { "<leader>ft", function() Snacks.terminal(nil, { cwd = vim.fn.getcwd() }) end, desc = "Terminal (Root Dir)",  mode = "n", },
	-- { "<c-:>",  function() Snacks.terminal(nil, { cwd = vim.fn.getcwd() }) end, desc = "Terminal (Root Dir)", mode = "n", },
	-- { "<c-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
	-- { "<c-_>", function() Snacks.terminal(nil, { cwd = vim.fn.getcwd() }) end, desc = "which_key_ignore",  mode = "n", },
	-- -- Other
	-- { "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
	-- { "<leader>Z",  function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
	-- { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
	-- { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
	-- { "<leader>n",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
	-- { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
	-- { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
	-- { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },
	-- { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
	-- { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
	-- { "<c-_>",      function() Snacks.terminal() end, desc = "which_key_ignore" },
	-- { "]]",         function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
	-- { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
}

-- stylua: ignore end
for _, map in ipairs(keymaps) do
	local opts = { desc = map.desc }
	if map.silent ~= nil then
		opts.silent = map.silent
	end
	if map.noremap ~= nil then
		opts.noremap = map.noremap
	else
		opts.noremap = true
	end
	if map.expr ~= nil then
		opts.expr = map.expr
	end

	local mode = map.mode or "n"
	vim.keymap.set(mode, map[1], map[2], opts)
end
