return {
  {
    'windwp/nvim-ts-autotag',
    ft = { 'html', 'javascipt', 'typescript', 'vue', 'javasciptrect', 'typescriptreact', 'astro', 'svelte', 'markdown', 'php' },
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },
}
