return {
  'chrisgrieser/nvim-scissors',
  cmd = { 'ScissorsAddNewSnippet', 'ScissorsEditSnippet' },
  -- dependencies = 'folke/snacks.nvim',
  dependencies = 'nvim-telescope/telescope.nvim', -- if using telescope
  opts = {
    snippetDir = vim.fn.stdpath 'config' .. '/lua/plugins/code/snippets',
    snippetSelection = {
      -- picker = 'snacks', ---@type "auto"|"telescope"|"snacks"|"vim.ui.select"
      telescope = {
        -- By default, the query only searches snippet prefixes. Set this to
        -- `true` to also search the body of the snippets.
        alsoSearchSnippetBody = false,
        -- accepts the common telescope picker config
        opts = {
          layout_strategy = 'horizontal',
          layout_config = {
            horizontal = { width = 0.7, height = 0.5 },
            preview_width = 0.5,
          },
        },
      },
      -- snacks = {},
    },
    editSnippetPopup = {
      height = 0.2, -- relative to the window, between 0-1
      width = 0.3,
      border = vim.o.winborder, -- `vim.o.winborder` on nvim 0.11, otherwise "rounded"
      keymaps = {
        -- if not mentioned otherwise, the keymaps apply to normal mode
        cancel = 'q',
        saveChanges = '<CR>', -- alternatively, can also use `:w`
        goBackToSearch = '<BS>',
        deleteSnippet = '<C-BS>',
        duplicateSnippet = '<C-d>',
        openInFile = '<C-o>',
        insertNextPlaceholder = '<C-p>', -- insert & normal mode
        showHelp = '?',
      },
    },
    backdrop = {
      enabled = false,
      blend = 50, -- between 0-100
    },
  },
  keys = {
    { '<leader>se', '<cmd>ScissorsEditSnippet<cr>' },
    { mode = { 'n', 'v' }, '<leader>sa', '<cmd>ScissorsAddNewSnippet<cr>' },
  },
}
