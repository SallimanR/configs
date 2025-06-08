return {
  {
    'folke/trouble.nvim',
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = 'Trouble',
    keys = {
      { '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Diagnostics (Trouble)' },
      { '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Buffer Diagnostics (Trouble)' },
      { '<leader>xs', '<cmd>Trouble symbols toggle focus=false<cr>', desc = 'Symbols (Trouble)' },
      { '<leader>xl', '<cmd>Trouble lsp toggle focus=false win.position=right<cr>', desc = 'LSP Definitions / references / ... (Trouble)' },
      { '<leader>xL', '<cmd>Trouble loclist toggle<cr>', desc = 'Location List (Trouble)' },
      { '<leader>xQ', '<cmd>Trouble qflist toggle<cr>', desc = 'Quickfix List (Trouble)' },
      { '<leader>xd', '<cmd>Trouble lsp_declarations toggle<cr>' },
      { '<leader>xe', '<cmd>Trouble lsp_definitions toggle<cr>' },
      { '<leader>xr', '<cmd>Trouble lsp_references toggle<cr>' },
      { '<leader>xi', '<cmd>Trouble lsp_incoming_calls toggle<cr>' },
      { '<leader>xo', '<cmd>Trouble lsp_outgoing_calls toggle<cr>' },
      { '<leader>xm', '<cmd>Trouble lsp_implementations toggle<cr>' },
      { '<leader>xt', '<cmd>Trouble lsp_type_definitions toggle<cr>' },
    },
  },
}
