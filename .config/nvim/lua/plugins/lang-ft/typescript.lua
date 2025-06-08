return {
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },
  {
    'dmmulroy/tsc.nvim',
    -- ft = 'typescript',
    cmd = { 'TSC' },
    opts = {},
  },
  -- {
  --   'pmizio/typescript-tools.nvim',
  --   dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  --   ft = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' },
  --   opts = {
  --     on_attach = function(client, bufnr)
  --       -- Keymap helper
  --       local map = function(mode, lhs, rhs, desc)
  --         vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
  --       end
  --
  --       -- Navigation
  --       map('n', 'gd', '<cmd>TSToolsGoToSourceDefinition<CR>', 'Go to source definition')
  --       map('n', 'gD', '<cmd>TSToolsGoToTypeDefinition<CR>', 'Go to type definition')
  --       map('n', 'gr', '<cmd>TSToolsReferences<CR>', 'References')
  --       map('n', 'gi', '<cmd>TSToolsImplementations<CR>', 'Implementations')
  --       map('n', 'K', '<cmd>TSToolsHover<CR>', 'Hover documentation')
  --
  --       -- Refactoring
  --       map('n', '<leader>tr', '<cmd>TSToolsRename<CR>', 'TS Rename')
  --       map('n', '<leader>tf', '<cmd>TSToolsRenameFile<CR>', 'Rename file')
  --       map('n', '<leader>to', '<cmd>TSToolsOrganizeImports<CR>', 'Organize imports')
  --       map('n', '<leader>tu', '<cmd>TSToolsRemoveUnused<CR>', 'Remove unused')
  --       map('n', '<leader>ta', '<cmd>TSToolsAddMissingImports<CR>', 'Add missing imports')
  --       map('n', '<leader>tx', '<cmd>TSToolsFixAll<CR>', 'Fix all issues')
  --       map('n', '<leader>tt', '<cmd>TSToolsGoToSourceDefinition<CR>', 'Go to source')
  --
  --       -- Code actions
  --       map('n', '<leader>tc', '<cmd>TSToolsCodeActions<CR>', 'Code actions')
  --       map('x', '<leader>tc', '<cmd>TSToolsCodeActions<CR>', 'Code actions (visual)')
  --
  --       -- Formatting
  --       map('n', '<leader>tf', '<cmd>TSToolsFormat<CR>', 'Format file')
  --       map('x', '<leader>tf', '<cmd>TSToolsFormat<CR>', 'Format selection')
  --     end,
  --     settings = {
  --       tsserver_file_preferences = {
  --         includeInlayParameterNameHints = 'all',
  --         includeCompletionsForModuleExports = true,
  --       },
  --       expose_as_code_action = 'all',
  --       separate_diagnostic_server = true,
  --       publish_diagnostic_on = 'insert_leave',
  --       tsserver_max_memory = 'auto',
  --       complete_function_calls = true,
  --     },
  --   },
  -- },
}
