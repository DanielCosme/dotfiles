return {
  { 'ellisonleao/gruvbox.nvim', priority = 1000, config = true, opts = ... },
  { 'rebelot/kanagawa.nvim', priority = 1000, lazy = false },
  { 'shaunsingh/nord.nvim', priority = 1000, lazy = false },
  { 'craftzdog/solarized-osaka.nvim', lazy = false, priority = 1000, opts = {} },
  { 'thesimonho/kanagawa-paper.nvim', lazy = false, priority = 1000, opts = {} },
  {
    'brenoprata10/nvim-highlight-colors',
    config = function()
      require('nvim-highlight-colors').setup {
        enable_tailwind = false,
      }
    end,
  },
}
