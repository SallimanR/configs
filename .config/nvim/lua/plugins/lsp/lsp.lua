return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', opts = {} },
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      { 'j-hui/fidget.nvim', opts = {} }, -- lsp loading ui
      { 'b0o/SchemaStore.nvim', lazy = true, version = false }, -- version false because last release is way too old
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          -- In this case, we create a function that lets us more easily define mappings specific
          -- for LSP related items. It sets the mode, buffer and description for us each time.
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          ---@param client vim.lsp.Client
          ---@param method vim.lsp.protocol.Method
          ---@param bufnr? integer some lsp support methods only in specific files
          ---@return boolean
          local function client_supports_method(client, method, bufnr)
            return client:supports_method(method, bufnr)
          end

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
              end,
            })
          end

          -- The following code creates a keymap to toggle inlay hints in your
          -- code, if the language server you are using supports them
          if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })

      -- vim.highlight.priorities.semantic_tokens = 95
      -- update_in_insert = true
      vim.diagnostic.config {
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
        underline = { severity = vim.diagnostic.severity.ERROR },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          },
        },
        virtual_text = {
          source = 'if_many',
          spacing = 2,
          format = function(diagnostic)
            local diagnostic_message = {
              [vim.diagnostic.severity.ERROR] = diagnostic.message,
              [vim.diagnostic.severity.WARN] = diagnostic.message,
              [vim.diagnostic.severity.INFO] = diagnostic.message,
              [vim.diagnostic.severity.HINT] = diagnostic.message,
            }
            return diagnostic_message[diagnostic.severity]
          end,
        },
      }
      vim.keymap.set('n', '<leader>tl', function()
        local new_config = not vim.diagnostic.config().virtual_lines
        vim.diagnostic.config { virtual_lines = new_config }
      end, { desc = 'Toggle diagnostic virtual_lines' })

      require('mason-lspconfig').setup()
      require('mason-tool-installer').setup {
        -- stylua: ignore
        ensure_installed = {
					'ast_grep',
					-- Lsp:
          'lua_ls',
          'basedpyright', 'ruff',
          'html',
					'superhtml',
					'cssls',
					'emmet_language_server',
          'vue_ls', 'vtsls',
					'astro',
					'svelte',
					'tailwindcss',
					-- 'unocss',
					-- 'dcm',
          'bashls', 'jsonls',

					-- Linters:
					'eslint_d', 'oxlint', 'jsonlint',
					-- 'htmlhint',
					'stylelint',

					-- Formaters:
					'prettierd', 'biome',
					'stylua',

					-- Debuggers:
          'debugpy',
        },
        integrations = {
          ['mason-lspconfig'] = true,
        },
      }

      vim.lsp.config['jsonls'] = {
        settings = {
          json = {
            schemas = require('schemastore').json.schemas {
              select = {
                '.eslintrc',
                'package.json',
                'tsconfig.json',
              },
            },
            validate = { enable = true },
          },
        },
      }
      vim.lsp.enable 'jsonls'

      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            hint = {
              enable = true,
            },
          },
        },
      })
      vim.lsp.enable 'lua_ls'

      vim.lsp.config.basedpyright = {
        settings = {
          basedpyright = {
            analysis = {
              autoImportCompletions = false,
              autoSearchPaths = true,
              diagnosticMode = 'openFilesOnly',
              useLibraryCodeForTypes = true,
            },
          },
        },
      }
      vim.lsp.enable 'basedpyright'
      vim.lsp.enable 'ruff'

      vim.lsp.config('vue_ls', {
        -- filetypes = { 'javascript', 'typescript', 'vue' },
        init_options = {
          vue = {
            hybridMode = true,
          },
        },
      })
      vim.lsp.enable 'vue_ls'

      vim.lsp.enable 'astro'

      vim.lsp.enable 'svelte'

      vim.lsp.config('vtsls', {
        filetypes = {
          'javascript',
          'javascriptreact',
          'javascript.jsx',
          'typescript',
          'typescriptreact',
          'typescriptreact',
          'typescript.tsx',
          'vue',
          'astro',
          'svelte',
        },
        -- on_attach = function(client, bufnr)
        --   -- Helper function for keymaps
        --   local map = function(mode, lhs, rhs, desc)
        --     vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        --   end
        --
        --   -- Navigation
        --   map('n', 'gd', vim.lsp.buf.definition, 'Go to definition')
        --   map('n', 'gD', vim.lsp.buf.type_definition, 'Go to type definition')
        --   map('n', 'gr', vim.lsp.buf.references, 'Show references')
        --   map('n', 'gi', vim.lsp.buf.implementation, 'Go to implementation')
        --   map('n', 'K', vim.lsp.buf.hover, 'Show documentation')
        --
        --   -- Refactoring keymaps
        --   map('n', '<leader>rr', vim.lsp.buf.rename, 'Rename symbol')
        --   map('n', '<leader>ro', '<cmd>VtsExecuteOrganizeImports<CR>', 'Organize imports')
        --   map('n', '<leader>rf', '<cmd>VtsExecuteFileReferences<CR>', 'Find file references')
        --   map('n', '<leader>ru', '<cmd>VtsExecuteRemoveUnused<CR>', 'Remove unused code')
        --
        --   -- Extract refactoring (visual mode)
        --   map('v', '<leader>re', ':VtsExecuteExtractFunction<CR>', 'Extract to function')
        --   map('v', '<leader>rv', ':VtsExecuteExtractVariable<CR>', 'Extract to variable')
        --
        --   -- Code actions
        --   map('n', '<leader>ca', vim.lsp.buf.code_action, 'Code actions')
        --   map('v', '<leader>ca', vim.lsp.buf.range_code_action, 'Code actions (range)')
        --
        --   -- File operations
        --   map('n', '<leader>rm', '<cmd>VtsRenameFile<CR>', 'Rename file')
        --   map('n', '<leader>rmi', '<cmd>VtsRenameFileImports<CR>', 'Rename file & update imports')
        -- end,

        settings = {
          vtsls = {
            tsserver = {
              globalPlugins = {
                {
                  name = '@vue/typescript-plugin',
                  -- location = '~/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin',
                  -- location = '~/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/language-server',
                  location = vim.fn.stdpath 'data' .. '/mason/packages' .. '/vue-language-server/node_modules/@vue/language-server',
                  languages = { 'vue' },
                  configNamespace = 'typescript',
                  enableForWorkspaceTypeScriptVersions = true,
                },
                {
                  name = '@astrojs/ts-plugin',
                  location = vim.fn.stdpath 'data' .. '/mason/packages' .. 'astro-language-server/node_modules/@astrojs/ts-plugin',
                  languages = { 'astro' },
                  enableForWorkspaceTypeScriptVersions = true,
                },
                {
                  name = 'typescript-svelte-plugin',
                  location = vim.fn.stdpath 'data' .. '/mason/packages' .. 'svelte-language-server/node_modules/svelte-language-server',
                  languages = { 'svelte' },
                  enableForWorkspaceTypeScriptVersions = true,
                },
              },
            },
          },
          typescript = {
            updateImportsOnFileMove = { enabled = 'always' },
            suggest = {
              completeFunctionCalls = true,
            },
            inlayHints = {
              enumMemberValues = { enabled = true },
              functionLikeReturnTypes = { enabled = true },
              parameterNames = { enabled = 'literals' },
              parameterTypes = { enabled = true },
              propertyDeclarationTypes = { enabled = true },
              variableTypes = { enabled = false },
            },
          },
          javascript = {
            inlayHints = {
              enumMemberValues = { enabled = true },
              functionLikeReturnTypes = { enabled = true },
              parameterNames = { enabled = 'literals' },
              parameterTypes = { enabled = true },
              propertyDeclarationTypes = { enabled = true },
              variableTypes = { enabled = false },
            },
          },
        },
      })
      vim.lsp.enable 'vtsls'

      vim.lsp.enable 'superhtml'

      vim.lsp.config('tailwindcss', {
        -- cmd = { 'tailwindcss-language-server', '--stdio' },
        -- filetypes = { 'html', 'css', 'scss', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue' },
        -- root_dir = lspconfig.util.root_pattern('tailwind.config.js', 'package.json'),
        settings = {
          tailwindCSS = {
            hovers = true,
            suggestions = true,
            codeActions = true,
          },
        },
      })
      vim.lsp.enable 'tailwindcss'
      vim.lsp.enable 'unocss'
      vim.lsp.enable 'ast_grep'

      -- vim.lsp.config['dcm'] = {}
      -- vim.lsp.enable 'dcm'
    end,
  },
}
