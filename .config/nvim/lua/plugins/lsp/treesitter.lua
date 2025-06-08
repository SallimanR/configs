return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        -- stylua: ignore
        ensure_installed = {
          'bash',
					'diff', 'git_config', 'git_rebase', 'gitattributes', 'gitcommit', 'gitignore',
          'javascript', 'typescript', 'css', 'html', 'vue', 'astro', 'svelte', 'json5',
          'python',
					'dart',
          'c', 'regex',
          'markdown', 'markdown_inline',
          'lua', 'luadoc', 'vimdoc', 'query',
          'rasi',
        },
        sync_install = false,
        auto_install = false,
        highlight = {
          enable = false,
        },
        indent = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            -- init_selection = 'gnn', -- set to `false` to disable one of the mappings
            -- node_incremental = 'gnn',
            -- scope_incremental = 'grc',
            init_selection = '<C-space>',
            node_incremental = '<C-space>',
            scope_incremental = false,
            node_decremental = '<bs>', -- node_decremental = 'gnp',
          },
        },
      }
    end,
  },
}
