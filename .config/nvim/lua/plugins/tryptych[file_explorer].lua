return {
  'simonmclean/triptych.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'nvim-tree/nvim-web-devicons', -- optional for icons
    'antosha417/nvim-lsp-file-operations', -- optional LSP integration
  },
  opts = {
    options = {
      backdrop = 100,
    },
  }, -- config options here
  keys = {
    { '<leader>te', ':Triptych<CR>' },
  },
}
