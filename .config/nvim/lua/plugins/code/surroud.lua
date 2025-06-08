return {
  {
    'echasnovski/mini.ai',
    -- dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
    event = 'VeryLazy',
    version = false,
    config = function()
      -- local spec_treesitter = require('mini.ai').gen_spec.treesitter
      require('mini.ai').setup {
        n_lines = 500,
        -- stylua: ignore
        -- custom_textobjects = {
        --   a = spec_treesitter { a = '@parameter.outer', i = '@parameter.inner' },
        --   F = spec_treesitter({ a = '@function.outer', i = '@function.inner'}),
        --   f = spec_treesitter { a = '@call.outer', i = '@call.inner' },
        --   c = spec_treesitter { a = '@class.outer', i = '@class.inner' },
        --   o = spec_treesitter {
        --     a = { '@block.outer', '@conditional.outer', '@loop.outer' },
        --     i = { '@block.inner', '@conditional.inner', '@loop.inner' },
        --   },
        -- },
      }
    end,
  },
  {
    'kylechui/nvim-surround',
    -- version = '^3.0.0', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    opts = {
      keymaps = {
        insert = '<C-g>s',
        insert_line = '<C-g>S',
        normal = 'gs',
        -- normal_cur = 'gss',
        -- normal_line = 'gS',
        -- normal_cur_line = 'gSS',
        visual = 'G', -- 'Gt' to add html tag:
        -- visual_line = 'G',
        visual_line = 'gS',
        delete = 'ds', -- 'dst' to delete html tag:
        change = 'cs', -- 'cst' to delete html tag:
        change_line = 'cS',
      },
    },
  },
  -- {
  --   'echasnovski/mini.surround',
  --   version = false,
  --   opts = {
  --     -- Add custom surroundings to be used on top of builtin ones. For more
  --     -- information with examples, see `:h MiniSurround.config`.
  --     custom_surroundings = nil,
  --     -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
  --     highlight_duration = 1000,
  --
  --     -- Module mappings. Use `''` (empty string) to disable one.
  --     mappings = {
  --       add = 'gsa', -- Add surrounding in Normal and Visual modes
  --       delete = 'gsd', -- Delete surrounding
  --       find = 'gsf', -- Find surrounding (to the right)
  --       find_left = 'gsF', -- Find surrounding (to the left)
  --       highlight = 'gsh', -- Highlight surrounding
  --       replace = 'gsr', -- Replace surrounding
  --       update_n_lines = 'gsn', -- Update `n_lines`
  --
  --       suffix_last = 'l', -- Suffix to search with "prev" method
  --       suffix_next = 'n', -- Suffix to search with "next" method
  --     },
  --
  --     -- Number of lines within which surrounding is searched
  --     n_lines = 100,
  --     -- Whether to respect selection type:
  --     -- - Place surroundings on separate lines in linewise mode.
  --     -- - Place surroundings on each line in blockwise mode.
  --     respect_selection_type = false,
  --
  --     -- How to search for surrounding (first inside current line, then inside
  --     -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
  --     -- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
  --     -- see `:h MiniSurround.config`.
  --     search_method = 'cover',
  --
  --     -- Whether to disable showing non-error feedback
  --     -- This also affects (purely informational) helper messages shown after
  --     -- idle time if user input is required.
  --     silent = false,
  --   },
  -- },
}
