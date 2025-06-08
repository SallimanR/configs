return {
  'razak17/tailwind-fold.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  ft = { 'html', 'svelte', 'astro', 'vue', 'typescriptreact', 'php', 'blade' },
  config = function()
    require('tailwind-fold').setup {
      enabled = false,
      -- symbol = '…', -- 󱏿
      symbol = '󱏿 ',
      -- highlight = {
      --   fg = '#38BDF8', -- [[ symbol color ]]
      -- },
    }
    vim.keymap.set({ 'n', 'v' }, '<leader>tu', '<Cmd>:TailwindFoldToggle<CR>')
  end,
}
