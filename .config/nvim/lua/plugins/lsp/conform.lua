return {
  {
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local conform = require 'conform'

      conform.setup {
        formatters_by_ft = {
          lua = { 'stylua' },
          python = { 'ruff' },
          html = { 'prettierd' },
          -- html = { 'superhtml' },
          css = { 'prettierd' },
          javascript = { 'prettierd' },
          typecript = { 'prettierd' },
          vue = { 'prettierd' },
          astro = { 'prettierd' },
          svelte = { 'prettierd' },
          -- dart = { 'dcm' },
          json = { 'prettierd' },
        },
        format_on_save = {
          lsp_fallback = true,
          async = false,
          timeout_ms = 1000,
        },
      }

      vim.keymap.set({ 'n', 'v' }, '<leader>rw', function()
        conform.format {
          lsp_fallback = true,
          async = false,
          timeout_ms = 1000,
        }
      end, { desc = 'Format file on range (in visual mode)' })
    end,
  },
}
