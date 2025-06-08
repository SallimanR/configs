return {
  {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'

      lint.linters_by_ft = {
        lua = { 'selene' },
        python = { 'ruff' },
        html = { 'htmlhint' },
        css = { 'stylelint', 'eslint_d' },
        typescript = { 'biomejs', 'eslint_d' },
        javascript = { 'biomejs', 'eslint_d' },
        vue = { 'eslint_d' },
        -- dart = { 'dcm' },
        json = { 'jsonlint' },
      }
      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

      -- local eslint = lint.linters.eslint_d
      lint.linters.eslint_d = require('lint.util').wrap(lint.linters.eslint_d, function(diagnostic)
        -- try to ignore "No ESLint configuration found" error
        -- if diagnostic.message:find("Error: No ESLint configuration found") then -- old version
        -- update: 20240814, following is working
        if diagnostic.message:find 'Error: Could not find config file' then
          return nil
        end
        return diagnostic
      end)

      -- eslint.args = {
      -- '--no-warn-ignored', -- <-- this is the key argument
      -- '--format',
      -- 'json',
      -- '--stdin',
      -- '--stdin-filename',
      -- function()
      --   return vim.api.nvim_buf_get_name(0)
      -- end,
      -- }

      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })

      vim.keymap.set('n', '<leader>rl', function()
        lint.try_lint()
      end, { desc = 'Trigger linting for current file' })
    end,
  },
}
