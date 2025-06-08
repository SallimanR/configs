return {
  {
    'L3MON4D3/LuaSnip',

    dependencies = {
      'rafamadriz/friendly-snippets',
    },
    version = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = 'make install_jsregexp',

    opts = {
      history = true,
      delete_check_events = 'TextChanged',
      region_check_events = 'CursorMoved',
    },
    config = function()
      require('luasnip.loaders.from_vscode').lazy_load()
      require('luasnip.loaders.from_vscode').lazy_load { paths = { vim.fn.stdpath 'config' .. '/lua/plugins/code/snippets' } }
    end,
  },
  {
    'xzbdmw/colorful-menu.nvim', -- colored menu for blink.cmp
    config = function()
      -- You don't need to set these options.
      require('colorful-menu').setup {
        ls = {
          lua_ls = {
            -- Maybe you want to dim arguments a bit.
            arguments_hl = '@comment',
          },
          gopls = {
            align_type_to_right = true,
            -- When true, label for field and variable will format like "foo: Foo"
            -- instead of go's original syntax "foo Foo". If align_type_to_right is
            -- true, this option has no effect.
            add_colon_before_type = false,
            -- See https://github.com/xzbdmw/colorful-menu.nvim/pull/36
            preserve_type_when_truncate = true,
          },
          -- for lsp_config or typescript-tools
          ts_ls = {
            -- false means do not include any extra info,
            -- see https://github.com/xzbdmw/colorful-menu.nvim/issues/42
            extra_info_hl = '@comment',
          },
          vtsls = {
            -- false means do not include any extra info,
            -- see https://github.com/xzbdmw/colorful-menu.nvim/issues/42
            extra_info_hl = '@comment',
          },
          ['rust-analyzer'] = {
            -- Such as (as Iterator), (use std::io).
            extra_info_hl = '@comment',
            -- Similar to the same setting of gopls.
            align_type_to_right = true,
            -- See https://github.com/xzbdmw/colorful-menu.nvim/pull/36
            preserve_type_when_truncate = true,
          },
          clangd = {
            -- Such as "From <stdio.h>".
            extra_info_hl = '@comment',
            -- Similar to the same setting of gopls.
            align_type_to_right = true,
            -- the hl group of leading dot of "•std::filesystem::permissions(..)"
            import_dot_hl = '@comment',
            -- See https://github.com/xzbdmw/colorful-menu.nvim/pull/36
            preserve_type_when_truncate = true,
          },
          zls = {
            -- Similar to the same setting of gopls.
            align_type_to_right = true,
          },
          roslyn = {
            extra_info_hl = '@comment',
          },
          dartls = {
            extra_info_hl = '@comment',
          },
          -- The same applies to pyright/pylance
          basedpyright = {
            -- It is usually import path such as "os"
            extra_info_hl = '@comment',
          },
          -- If true, try to highlight "not supported" languages.
          fallback = true,
          -- this will be applied to label description for unsupport languages
          fallback_extra_info_hl = '@comment',
        },
        -- If the built-in logic fails to find a suitable highlight group for a label,
        -- this highlight is applied to the label.
        fallback_highlight = '@variable',
        -- If provided, the plugin truncates the final displayed text to
        -- this width (measured in display cells). Any highlights that extend
        -- beyond the truncation point are ignored. When set to a float
        -- between 0 and 1, it'll be treated as percentage of the width of
        -- the window: math.floor(max_width * vim.api.nvim_win_get_width(0))
        max_width = 60,
      }
    end,
  },
  {
    'saghen/blink.cmp',
    dependencies = {
      'rafamadriz/friendly-snippets',
    },
    version = '1.*',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      completion = {
        accept = { auto_brackets = { enabled = true } },
        -- auto_show = true,
        documentation = { auto_show = true, auto_show_delay_ms = 0 },
        menu = {
          draw = {
            -- columns = { { 'item_idx' }, { 'kind_icon', 'label', gap = 1 }, { 'kind', gap = 1, 'label_description' } }, --'source_name'
            -- columns = { { 'item_idx' }, { 'label', 'label_description', gap = 1 }, { 'kind_icon', 'kind' } }, --'source_name'
            columns = { { 'item_idx' }, { 'label', gap = 1 }, { 'kind_icon', 'kind' } }, --'source_name'
            components = {
              label = {
                text = function(ctx)
                  return require('colorful-menu').blink_components_text(ctx)
                end,
                highlight = function(ctx)
                  return require('colorful-menu').blink_components_highlight(ctx)
                end,
              },
              item_idx = {
                text = function(ctx)
                  return ctx.idx == 10 and '0' or ctx.idx >= 10 and ' ' or tostring(ctx.idx)
                end,
                highlight = 'BlinkCmpItemIdx', -- optional, only if you want to change its color
              },
            },
          },
        },
        ghost_text = { enabled = false },
      },

      signature = { enabled = true },

      snippets = { preset = 'luasnip' },

      sources = {
        min_keyword_length = 0,
        default = { 'snippets', 'lsp', 'path', 'buffer', 'lazydev', 'cmdline', 'omni' },

        providers = {
          snippets = {
            module = 'blink.cmp.sources.snippets',
            score_offset = 6,
          },

          lsp = {
            name = 'LSP',
            module = 'blink.cmp.sources.lsp',
            score_offset = 4,
          },

          -- path = {
          --   score_offset = 2,
          -- },
          --
          -- buffer = {
          --   score_offset = 1,
          -- },

          lazydev = {
            name = 'LazyDev',
            module = 'lazydev.integrations.blink',
            score_offset = 100,
          },
        },
      },

      fuzzy = {
        sorts = {
          implementation = 'prefer_rust_with_warning',
          use_frecency = true,
          -- function(a, b)
          --   local source_priority = {
          --     lazydev = 5,
          --     snippets = 4,
          --     lsp = 3,
          --     path = 2,
          --     buffer = 1,
          --   }
          --   local a_priority = source_priority[a.source_id]
          --   local b_priority = source_priority[b.source_id]
          --   if a_priority ~= b_priority then
          --     return a_priority > b_priority
          --   end
          -- end,
          -- defaults
          'score',
        },
      },
      -- See :h blink-cmp-config-keymap for defining your own keymap
			-- stylua: ignore
      keymap = {
        -- preset = 'default',
        ['<C-y>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<C-e>'] = { 'hide' },
        ['<C-space>'] = { 'select_and_accept' },
        ['<Up>'] = { 'select_prev', 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },
        ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
        ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

        ['<A-p>'] = { 'scroll_documentation_up', 'fallback' },
        ['<A-n>'] = { 'scroll_documentation_down', 'fallback' },
        ['<Tab>'] = { 'snippet_forward', 'fallback' },
        ['<S-Tab>'] = { 'snippet_backward', 'fallback' },

        ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
				['<A-1>'] = { function(cmp) cmp.accept({ index = 1 }) end },
				['<A-2>'] = { function(cmp) cmp.accept({ index = 2 }) end },
				['<A-3>'] = { function(cmp) cmp.accept({ index = 3 }) end },
				['<A-4>'] = { function(cmp) cmp.accept({ index = 4 }) end },
				['<A-5>'] = { function(cmp) cmp.accept({ index = 5 }) end },
				['<A-6>'] = { function(cmp) cmp.accept({ index = 6 }) end },
				['<A-7>'] = { function(cmp) cmp.accept({ index = 7 }) end },
				['<A-8>'] = { function(cmp) cmp.accept({ index = 8 }) end },
				['<A-9>'] = { function(cmp) cmp.accept({ index = 9 }) end },
				['<A-0>'] = { function(cmp) cmp.accept({ index = 10 }) end },
      },
      cmdline = {
        completion = { menu = { auto_show = true }, ghost_text = { enabled = false } },

				-- stylua: ignore
				keymap = {
					-- preset = 'default',
					['<C-y>'] = { 'show', 'show_documentation', 'hide_documentation' },
					['<C-e>'] = { 'hide' },
					['<C-space>'] = { 'select_and_accept' },
					['<Up>'] = { 'select_prev', 'fallback' },
					['<Down>'] = { 'select_next', 'fallback' },
					['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
					['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

					['<A-p>'] = { 'scroll_documentation_up', 'fallback' },
					['<A-n>'] = { 'scroll_documentation_down', 'fallback' },
					['<Tab>'] = { 'snippet_forward', 'fallback' },
					['<S-Tab>'] = { 'snippet_backward', 'fallback' },

					['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
					['<A-1>'] = { function(cmp) cmp.accept({ index = 1 }) end },
					['<A-2>'] = { function(cmp) cmp.accept({ index = 2 }) end },
					['<A-3>'] = { function(cmp) cmp.accept({ index = 3 }) end },
					['<A-4>'] = { function(cmp) cmp.accept({ index = 4 }) end },
					['<A-5>'] = { function(cmp) cmp.accept({ index = 5 }) end },
					['<A-6>'] = { function(cmp) cmp.accept({ index = 6 }) end },
					['<A-7>'] = { function(cmp) cmp.accept({ index = 7 }) end },
					['<A-8>'] = { function(cmp) cmp.accept({ index = 8 }) end },
					['<A-9>'] = { function(cmp) cmp.accept({ index = 9 }) end },
					['<A-0>'] = { function(cmp) cmp.accept({ index = 10 }) end },
				},
      },
      -- providers = {
      --   lsp = {
      --     name = 'LSP',
      --     module = 'blink.cmp.sources.lsp',
      --     -- You may enable the buffer source, when LSP is available, by setting this to `{}`
      --     -- You may want to set the score_offset of the buffer source to a lower value, such as -5 in this case
      --     fallbacks = { 'buffer' },
      --     -- Filter text items from the LSP provider, since we have the buffer provider for that
      --     transform_items = function(_, items)
      --       return vim.tbl_filter(function(item)
      --         return item.kind ~= require('blink.cmp.types').CompletionItemKind.Text
      --       end, items)
      --     end,
      --     opts = { tailwind_color_icon = '██' },
      --
      --     name = nil, -- Defaults to the id ("lsp" in this case) capitalized when not set
      --     enabled = true, -- Whether or not to enable the provider
      --     async = false, -- Whether we should show the completions before this provider returns, without waiting for it
      --     timeout_ms = 2000, -- How long to wait for the provider to return before showing completions and treating it as asynchronous
      --     transform_items = nil, -- Function to transform the items before they're returned
      --     should_show_items = true, -- Whether or not to show the items
      --     max_items = nil, -- Maximum number of items to display in the menu
      --     min_keyword_length = 0, -- Minimum number of characters in the keyword to trigger the provider
      --     -- If this provider returns 0 items, it will fallback to these providers.
      --     -- If multiple providers fallback to the same provider, all of the providers must return 0 items for it to fallback
      --     fallbacks = {},
      --     score_offset = 0, -- Boost/penalize the score of the items
      --     override = nil, -- Override the source's functions
      --   },
      --
      --   path = {
      --     module = 'blink.cmp.sources.path',
      --     score_offset = 3,
      --     fallbacks = { 'buffer' },
      --     opts = {
      --       trailing_slash = true,
      --       label_trailing_slash = true,
      --       get_cwd = function(context)
      --         return vim.fn.expand(('#%d:p:h'):format(context.bufnr))
      --       end,
      --       show_hidden_files_by_default = false,
      --     },
      --   },
      --
      --   snippets = {
      --     module = 'blink.cmp.sources.snippets',
      --     score_offset = 1, -- receives a -3 from top level snippets.score_offset
      --
      --     -- For `snippets.preset == 'default'`
      --     -- opts = {
      --     --   friendly_snippets = true,
      --     --   search_paths = { vim.fn.stdpath('config') .. '/snippets' },
      --     --   global_snippets = { 'all' },
      --     --   extended_filetypes = {},
      --     --   ignored_filetypes = {},
      --     --   get_filetype = function(context)
      --     --     return vim.bo.filetype
      --     --   end
      --     --   -- Set to '+' to use the system clipboard, or '"' to use the unnamed register
      --     --   clipboard_register = nil,
      --     -- }
      --
      --     -- For `snippets.preset == 'luasnip'`
      --     opts = {
      --       -- Whether to use show_condition for filtering snippets
      --       use_show_condition = true,
      --       -- Whether to show autosnippets in the completion list
      --       show_autosnippets = true,
      --     },
      --   },
      --
      --   buffer = {
      --     module = 'blink.cmp.sources.buffer',
      --     score_offset = -3,
      --     opts = {
      --       -- default to all visible buffers
      --       get_bufnrs = function()
      --         return vim
      --           .iter(vim.api.nvim_list_wins())
      --           :map(function(win)
      --             return vim.api.nvim_win_get_buf(win)
      --           end)
      --           :filter(function(buf)
      --             return vim.bo[buf].buftype ~= 'nofile'
      --           end)
      --           :totable()
      --       end,
      --     },
      --   },
      --
      --   cmdline = {
      --     module = 'blink.cmp.sources.cmdline',
      --     -- Disable shell commands on windows, since they cause neovim to hang
      --     enabled = function()
      --       return vim.fn.has 'win32' == 0 or vim.fn.getcmdtype() ~= ':' or not vim.fn.getcmdline():match "^[%%0-9,'<>%-]*!"
      --     end,
      --   },
      --
      --   omni = {
      --     module = 'blink.cmp.sources.complete_func',
      --     enabled = function()
      --       return vim.bo.omnifunc ~= 'v:lua.vim.lsp.omnifunc'
      --     end,
      --     ---@type blink.cmp.CompleteFuncOpts
      --     opts = {
      --       complete_func = function()
      --         return vim.bo.omnifunc
      --       end,
      --     },
      --   },
    },
  },
}
