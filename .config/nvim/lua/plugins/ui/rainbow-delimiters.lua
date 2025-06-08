return {
  'hiphish/rainbow-delimiters.nvim',
  -- opts = {},
  config = function()
    require('rainbow-delimiters.setup').setup {
      -- strategy = {
      --   [''] = 'rainbow-delimiters.strategy.global',
      --   html = 'rainbow-delimiters.strategy.local',
      --   latex = function(bufnr)
      --     -- Disabled for very large files, global strategy for large files,
      --     -- local strategy otherwise
      --     local line_count = vim.api.nvim_buf_line_count(bufnr)
      --     if line_count > 10000 then
      --       return nil
      --     elseif line_count > 1000 then
      --       return 'rainbow-delimiters.strategy.global'
      --     end
      --     return 'rainbow-delimiters.strategy.local'
      --   end,
      -- },
    }
  end,
}
