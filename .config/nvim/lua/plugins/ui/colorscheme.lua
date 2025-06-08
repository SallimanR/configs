return {
  -- {
  --   'sainnhe/sonokai',
  --   priority = 1000,
  --   config = function()
  --     vim.g.sonokai_transparent_background = '1'
  --     vim.g.sonokai_inlay_hints_background = 'dimmed'
  --     -- vim.g.sonokai_float_style = 'dim'
  --     -- vim.g.sonokai_selection_background = 'red'
  --     vim.g.sonokai_diagnostic_virtual_text = 'colored'
  --     vim.g.sonokai_enable_italic = '1'
  --     vim.g.sonokai_style = 'andromeda'
  --     vim.cmd.colorscheme 'sonokai'
  --     vim.api.nvim_create_autocmd({ 'ColorScheme', 'VimEnter' }, {
  --       group = vim.api.nvim_create_augroup('Color', {}),
  --       pattern = '*',
  --       callback = function()
  --         vim.api.nvim_set_hl(0, 'BlinkCmpMenuSelection', { bg = '#1f1f1f' })
  --       end,
  --     })
  --   end,
  -- },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      style = 'moon',
      transparent = true,
      -- styles = {
      --   sidebars = 'transparent', -- style for sidebars, see below
      --   floats = 'transparent', -- style for floating windows
      -- },
      on_highlights = function(hl)
        hl.LineNrAbove = {
          fg = '#84c8be',
        }
        hl.LineNrBelow = {
          fg = '#84c8be',
        }
      end,
    },
  },
  -- {
  --   'catppuccin/nvim',
  --   name = 'catppuccin',
  --   priority = 1000,
  --
  --   config = function()
  --     require('catppuccin').setup {
  --       flavour = 'mocha', -- latte, frappe, macchiato, mocha
  --       background = { -- :h background
  --         dark = 'mocha',
  --       },
  --       transparent_background = false, -- disables setting the background color.
  --       show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
  --       term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
  --       dim_inactive = {
  --         enabled = false, -- dims the background color of inactive window
  --         shade = 'dark',
  --         percentage = 0.15, -- percentage of the shade to apply to the inactive window
  --       },
  --       no_italic = false, -- Force no italic
  --       no_bold = true, -- Force no bold
  --       no_underline = false, -- Force no underline
  --       styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
  --         comments = { 'italic' }, -- Change the style of comments
  --         conditionals = { 'italic' },
  --         loops = {},
  --         functions = {},
  --         keywords = {},
  --         strings = {},
  --         variables = {},
  --         numbers = {},
  --         booleans = {},
  --         properties = {},
  --         types = {},
  --         operators = {},
  --         -- miscs = {}, -- Uncomment to turn off hard-coded styles
  --       },
  --       color_overrides = {},
  --       highlight_overrides = {
  --         mocha = function(mocha)
  --           return {
  --             LineNr = { fg = '#e5e5e5' },
  --             -- LineNr = { fg = '#84c8be' },
  --             CursorLineNr = { fg = '#84c8be' },
  --             FlashLabel = { fg = '#ffea00' },
  --           }
  --         end,
  --       },
  --       custom_highlights = {},
  --       default_integrations = true,
  --       integrations = {
  --         cmp = true,
  --         gitsigns = true,
  --         nvimtree = true,
  --         treesitter = true,
  --         notify = false,
  --         mini = {
  --           enabled = true,
  --           indentscope_color = '',
  --         },
  --         -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  --       },
  --     }
  --     vim.cmd.colorscheme 'catppuccin'
  --   end,
  -- },
  -- {
  --   'xero/evangelion.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   init = function()
  --     vim.cmd.colorscheme 'evangelion'
  --   end,
  -- },
  -- {
  --   'EdenEast/nightfox.nvim',
  --   config = function()
  --     vim.cmd 'colorscheme duskfox'
  --   end,
  -- },
  -- {
  --   'EdenEast/nightfox.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   options = {
  --     colorblind = {
  --       enable = true,
  --       severity = {
  --         protan = 0,
  --         deutan = 1,
  --         tritan = 0,
  --       },
  --     },
  --   },
  -- },
}
