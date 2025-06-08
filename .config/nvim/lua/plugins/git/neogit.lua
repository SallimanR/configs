return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration
    'folke/snacks.nvim', -- optional
  },
  opts = {},
  cmd = { 'Neogit' },
  keys = {
    { mode = { 'n' }, '<leader>go', '<cmd>Neogit<cr>', { silent = true, noremap = true } },
    { mode = { 'n' }, '<leader>gc', '<cmd>Neogit commit<CR>', { silent = true, noremap = true } },
    { mode = { 'n' }, '<leader>gp', '<cmd>Neogit pull<CR>', { silent = true, noremap = true } },
    { mode = { 'n' }, '<leader>gP', '<cmd>Neogit push<CR>', { silent = true, noremap = true } },
    { mode = { 'n' }, '<leader>gB', '<cmd>G blame<CR>', { silent = true, noremap = true } },
  },
}
