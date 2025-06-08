return {
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require('noice').setup {
        cmdline = {
          format = {
            -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
            -- view: (default is cmdline view)
            -- opts: any options passed to the view
            -- icon_hl_group: optional hl_group for the icon
            -- title: set to anything or empty string to hide
            -- cmdline = { pattern = '^:', icon = '', lang = 'vim' },
            -- search_down = { kind = 'search', pattern = '^/', icon = ' ', lang = 'regex' },
            -- search_up = { kind = 'search', pattern = '^%?', icon = ' ', lang = 'regex' },
            -- filter = { pattern = '^:%s*!', icon = '$', lang = 'bash' },
            -- lua = { pattern = { '^:%s*lua%s+', '^:%s*lua%s*=%s*', '^:%s*=%s*' }, icon = '', lang = 'lua' },
            -- help = { pattern = '^:%s*he?l?p?%s+', icon = ' h' },
            -- input = { view = 'cmdline_input', icon = '󰥻 ' }, -- Used by input()
            lua = false, -- to disable a format, set to `false`
            help = false,
          },
        },
        routes = {
          {
            filter = {
              event = 'notify',
              -- find = { 'No information available', 'minifiles is not supported' },
            },
            opts = {
              skip = true,
            },
          },
        },
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            ['vim.lsp.util.stylize_markdown'] = true,
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = false, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
      }
    end,
  },
}
