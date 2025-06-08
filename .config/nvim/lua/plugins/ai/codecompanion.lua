return {
  'olimorris/codecompanion.nvim',
  opts = {
    strategies = {
      chat = {
        opts = {
          completion_provider = 'cmp', -- blink|cmp|coc|default
        },
      },
    },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
}
