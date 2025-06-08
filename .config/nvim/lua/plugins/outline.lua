return {
  {
    'hedyhli/outline.nvim',
    lazy = true,
    cmd = { 'Outline', 'OutlineOpen' },
    keys = {
      { '<leader>to', '<cmd>Outline<CR>', desc = 'Toggle outline' },
    },
    opts = {},
  },
}
