return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ft = { 'markdown' },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
  {
    'toppair/peek.nvim',
    -- event = { 'VeryLazy' },
    ft = { 'markdown' },
    build = 'deno task --quiet build:fast',
    config = function()
      require('peek').setup {
        -- theme = 'light',
        app = 'browser',
      }
      vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
      vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
    end,
  },
}

-- return {
--   'OXY2DEV/markview.nvim',
--   lazy = false,
--
--   -- For blink.cmp's completion
--   -- source
--   -- dependencies = {
--   --     "saghen/blink.cmp"
--   -- },
-- }
