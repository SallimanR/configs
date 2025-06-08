return {
  'andymass/vim-matchup',
  -- event = 'VeryLazy',
  init = function()
    -- vim.g.matchup_matchparen_status_offscreen = 0
    -- vim.g.matchup_matchparen_nomode = 'ivV'
    -- vim.g.matchup_matchparen_deferred = 100
    vim.g.matchup_matchparen_offscreen = { method = 'popup' }
    require('nvim-treesitter.configs').setup {
      matchup = {
        enable = true, -- mandatory, false will disable the whole extension
        -- disable = { "c", "ruby" },  -- optional, list of language that will be disabled
        -- [options]
      },
    }
  end,
}
