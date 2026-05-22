vim.pack.add({
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		version = "main",
	},
})
require("nvim-treesitter").setup({})
require("nvim-treesitter").install({
	"lua",
	"go",
  "html",
  "css",
	"javascript",
  "c",
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		local filetype = vim.bo.filetype
		if filetype and filetype ~= "" then
			pcall(vim.treesitter.start)
		end
	end,
})
