return {
  {
    'ThePrimeagen/refactoring.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    -- lazy = false,
    opts = {},
		-- stylua: ignore
		keys = {
			{mode={ 'n', 'x' }, '<leader>Re', function() return require('refactoring').refactor 'Extract Function' end, { expr = true }},
			{mode={ 'n', 'x' }, '<leader>Rf', function() return require('refactoring').refactor 'Extract Function To File' end, { expr = true }},
			{mode={ 'n', 'x' }, '<leader>Rv', function() return require('refactoring').refactor 'Extract Variable' end, { expr = true }},
			{mode={ 'n', 'x' }, '<leader>RI', function() return require('refactoring').refactor 'Inline Function' end, { expr = true }},
			{mode={ 'n', 'x' }, '<leader>Ri', function() return require('refactoring').refactor 'Inline Variable' end, { expr = true }},

			{mode={ 'n', 'x' }, '<leader>Rbb', function() return require('refactoring').refactor 'Extract Block' end, { expr = true }},
			{mode={ 'n', 'x' }, '<leader>Rbf', function() return require('refactoring').refactor 'Extract Block To File' end, { expr = true }},


			-- You can also use below = true here to to change the position of the printf
			-- statement (or set two remaps for either one). This remap must be made in normal mode.
			{mode={ 'n' }, '<leader>Rp', function() require('refactoring').debug.printf { below = false } end},
			-- Print var
			{mode={ 'x', 'n' }, '<leader>Rv', function() require('refactoring').debug.print_var() end},
			-- Supports both visual and normal mode
			{mode={'n'}, '<leader>Rc', function() require('refactoring').debug.cleanup {} end},
			-- Supports only normal mode

			{mode={ 'n', 'x' }, '<leader>Rr', function() require('refactoring').select_refactor() end},
		},
    -- config = function()
    -- 	require('refactoring').setup {}
    -- 	vim.keymap.set({ 'n', 'x' }, '<leader>Re', function() return require('refactoring').refactor 'Extract Function' end, { expr = true })
    -- 	vim.keymap.set({ 'n', 'x' }, '<leader>Rf', function() return require('refactoring').refactor 'Extract Function To File' end, { expr = true })
    -- 	vim.keymap.set({ 'n', 'x' }, '<leader>Rv', function() return require('refactoring').refactor 'Extract Variable' end, { expr = true })
    -- 	vim.keymap.set({ 'n', 'x' }, '<leader>RI', function() return require('refactoring').refactor 'Inline Function' end, { expr = true })
    -- 	vim.keymap.set({ 'n', 'x' }, '<leader>Ri', function() return require('refactoring').refactor 'Inline Variable' end, { expr = true })
    --
    -- 	vim.keymap.set({ 'n', 'x' }, '<leader>Rbb', function() return require('refactoring').refactor 'Extract Block' end, { expr = true })
    -- 	vim.keymap.set({ 'n', 'x' }, '<leader>Rbf', function() return require('refactoring').refactor 'Extract Block To File' end, { expr = true })
    --
    --
    -- 	-- You can also use below = true here to to change the position of the printf
    -- 	-- statement (or set two remaps for either one). This remap must be made in normal mode.
    -- 	vim.keymap.set('n', '<leader>Rp', function() require('refactoring').debug.printf { below = false } end)
    -- 	-- Print var
    -- 	vim.keymap.set({ 'x', 'n' }, '<leader>Rv', function() require('refactoring').debug.print_var() end)
    -- 	-- Supports both visual and normal mode
    -- 	vim.keymap.set('n', '<leader>Rc', function() require('refactoring').debug.cleanup {} end)
    -- 	-- Supports only normal mode
    --
    -- 	vim.keymap.set({ 'n', 'x' }, '<leader>Rr', function() require('refactoring').select_refactor() end)
    -- end,
  },
  {
    'smjonas/inc-rename.nvim',
    config = function()
      require('inc_rename').setup {
        vim.keymap.set('n', '<leader>rn', function()
          return ':IncRename ' .. vim.fn.expand '<cword>'
        end, { expr = true }),
      }
    end,
  },
  {
    'aznhe21/actions-preview.nvim',
    -- event = 'LspAttach',
    opts = {},
    keys = { {
      mode = { 'v', 'n' },
      '<leader>ra',
      function()
        require('actions-preview').code_actions()
      end,
    } },
    -- config = function()
    --   require('actions-preview').setup {
    --     -- backend = { 'snacks', 'telescope', 'minipick', 'nui' },
    --     -- backend = { 'snacks' },
    --     -- ---@type snacks.picker.Config
    --     -- snacks = {
    --     --   layout = { preset = 'default' },
    --     -- },
    --   }
    --   vim.keymap.set({ 'v', 'n' }, '<leader>ra', function()
    --     require('actions-preview').code_actions()
    --   end)
    -- end,
  },
  {
    'rachartier/tiny-code-action.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope.nvim' },
    },
    -- event = 'LspAttach',
    opts = {
      picker = {
        'telescope',
        opts = {
          layout_strategy = 'vertical',
          layout_config = {
            width = 0.7,
            height = 0.9,
            preview_cutoff = 1,
            preview_height = function(_, _, max_lines)
              local h = math.floor(max_lines * 0.5)
              return math.max(h, 10)
            end,
          },
        },
      },
    },
    keys = {
      {
        '<leader>ca',
        function()
          require('tiny-code-action').code_action()
        end,
        { noremap = true, silent = true },
      },
    },
    -- config = function()
    --   require('tiny-code-action').setup {}
    --   vim.keymap.set('n', '<leader>ca', function()
    --     require('tiny-code-action').code_action()
    --   end, { noremap = true, silent = true })
    -- end,
  },
  {
    'Chaitanyabsprip/fastaction.nvim',
    ---@type FastActionConfig
    opts = {},
    keys = { { mode = { 'n', 'x' }, '<leader>ta', '<cmd>lua require("fastaction").code_action()<CR>', { desc = 'Display code actions', buffer = bufnr } } },
    -- config = function()
    --   require('fastaction').setup {}
    --   vim.keymap.set({ 'n', 'x' }, '<leader>ta', '<cmd>lua require("fastaction").code_action()<CR>', { desc = 'Display code actions', buffer = bufnr })
    -- end,
  },
  -- {
  --   'kosayoda/nvim-lightbulb', -- ui (shows lighbuld when code actions availabe)
  --   event = 'VeryLazy',
  --   config = function()
  --     require('nvim-lightbulb').setup {
  --       autocmd = { enabled = true },
  --       -- sign = { enabled = false },
  --       -- float = { enabled = true },
  --     }
  --   end,
  -- },
}
