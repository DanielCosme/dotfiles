return {
  {
    'ribru17/bamboo.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('bamboo').setup {
        -- optional configuration here
        style = 'multiplex',
      }
      require('bamboo').load()
    end,
  },
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000, lazy = false },
  { 'rebelot/kanagawa.nvim', priority = 1000, lazy = false },
  { 'shaunsingh/nord.nvim', priority = 1000, lazy = false },
  { 'craftzdog/solarized-osaka.nvim', lazy = false, priority = 1000, opts = {} },
  { 'tiagovla/tokyodark.nvim', lazy = false, priority = 1000, opts = {} },
  { 'thesimonho/kanagawa-paper.nvim', lazy = false, priority = 1000, opts = {} },
}
