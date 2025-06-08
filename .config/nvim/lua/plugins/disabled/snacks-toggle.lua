return {
  'folke/snacks.nvim',
  ---@type snacks.Config
  opts = {},
  config = function()
    Snacks.toggle.zoom():map '<leader>wm'
  end,
}
