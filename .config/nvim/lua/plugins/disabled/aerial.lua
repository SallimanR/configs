return {
  {
    'stevearc/aerial.nvim',
    -- Optional dependencies
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },

    opts = function()
      opts = {
        attach_mode = 'global',
        backends = { 'lsp', 'treesitter', 'markdown', 'man' },
        show_guides = true,
        layout = {
          resize_to_content = false,
          win_opts = {
            winhl = 'Normal:NormalFloat,FloatBorder:NormalFloat,SignColumn:SignColumnSB',
            signcolumn = 'yes',
            statuscolumn = ' ',
          },
        },
        -- icons = icons,
        -- filter_kind = {
        --   'Class',
        --   'Constructor',
        --   'Enum',
        --   'Function',
        --   'Interface',
        --   'Module',
        --   'Method',
        --   'Struct',
        -- }, -- stylua: ignore
        filter_kind = false,
        guides = {
          mid_item = '├╴',
          last_item = '└╴',
          nested_top = '│ ',
          whitespace = '  ',
        },
      }

      return opts
    end,

    keys = {
      { '<leader>a', '<cmd>AerialToggle<cr>', desc = 'Aerial (Symbols)' },
    },
  },
}
