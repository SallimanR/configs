return {
  'axelvc/template-string.nvim',
  ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue', 'svelte', 'python' },
  config = function()
    require('template-string').setup {
      remove_template_string = true,
    }
  end,
}
