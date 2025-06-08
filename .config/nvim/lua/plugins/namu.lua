return {
  'bassamsdata/namu.nvim',
  opts = {
    namu_symbols = {
      enable = true,
      options = {}, -- here you can configure namu
    },
    -- Optional: Enable other modules if needed
    ui_select = { enable = false }, -- vim.ui.select() wrapper
  },
  keys = {
    { '<leader>ss', '<Cmd>Namu symbols<cr>', { desc = 'Jump to LSP symbol', silent = true } },
    { '<leader>sw', '<Cmd>Namu workspace<cr>', { desc = 'LSP Symbols - Workspace', silent = true } },
  },
}
