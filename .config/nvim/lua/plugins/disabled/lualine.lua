return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        globalstatus = vim.o.laststatus == 3,
        theme = 'auto',
        component_separators = { left = '|', right = '|' },
        section_separators = { left = '|', right = '|' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        refresh = {
          statusline = 100,
          tabline = 100,
          winbar = 100,
        },
      },
      sections = {
        lualine_a = {},
        lualine_a = { 'mode' },
        lualine_b = {
          'branch',
          -- 'diff',
          -- {
          --   'diagnostics',
          --   sources = { 'nvim_diagnostic' },
          --   symbols = {
          --     error = ' ',
          --     warn = ' ',
          --     info = ' ',
          --     hint = '',
          --   },
          -- },
        },
        lualine_c = {
          {
            'buffers',
          },
        },
        -- lualine_x = { 'lsp_status', { 'filetype', icon_only = true } },
        lualine_y = { { 'progress', separator = ' ', padding = { left = 1, right = 0 } } },
        lualine_z = { { 'location', padding = { left = 0, right = 1 } } },
      },
      -- inactive_sections = {
      --   lualine_a = {},
      --   lualine_b = {},
      --   lualine_c = { 'filename' },
      --   lualine_x = { 'location' },
      --   lualine_y = {},
      --   lualine_z = {},
      -- },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    }
  end,
}
