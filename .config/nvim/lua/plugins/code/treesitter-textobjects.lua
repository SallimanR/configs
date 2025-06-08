return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  config = function()
    require('nvim-treesitter.configs').setup {
      textobjects = {
        select = {
          enable = true,
          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,
          keymaps = {
            ['as'] = { query = '@local.scope', query_group = 'locals', desc = 'Select language scope' },

            -- ['l='] = { query = '@assignment.lhs', desc = 'Select left hand side of an assignment' },
            -- ['r='] = { query = '@assignment.rhs', desc = 'Select right hand side of an assignment' },

            -- works for javascript/typescript files (custom capture I created in after/queries/ecma/textobjects.scm)
            ['a:'] = { query = '@property.outer', desc = 'Select outer part of an object property' },
            ['i:'] = { query = '@property.inner', desc = 'Select inner part of an object property' },
            ['l:'] = { query = '@property.lhs', desc = 'Select left part of an object property' },
            ['r:'] = { query = '@property.rhs', desc = 'Select right part of an object property' },

            ['aa'] = { query = '@parameter.outer', desc = 'Select outer part of a parameter/argument' },
            ['ia'] = { query = '@parameter.inner', desc = 'Select inner part of a parameter/argument' },

            ['ai'] = { query = '@conditional.outer', desc = 'Select outer part of a conditional' },
            ['ii'] = { query = '@conditional.inner', desc = 'Select inner part of a conditional' },

            ['as'] = { query = '@statement.outer' },
            -- ['is'] = { query = '@statement.inner' },

            ['al'] = { query = '@loop.outer', desc = 'Select outer part of a loop' },
            ['il'] = { query = '@loop.inner', desc = 'Select inner part of a loop' },

            ['am'] = { query = '@call.outer', desc = 'Select outer part of a function call' },
            ['im'] = { query = '@call.inner', desc = 'Select inner part of a function call' },

            ['af'] = { query = '@function.outer', desc = 'Select outer part of a method/function definition' },
            ['if'] = { query = '@function.inner', desc = 'Select inner part of a method/function definition' },

            ['ar'] = { query = 'return.outer' },
            ['ir'] = { query = 'return.inner' },

            ['ar'] = { query = '@return.outer' },
            ['ir'] = { query = '@return.inner' },

            ['ac'] = { query = '@class.outer', desc = 'Select outer part of a class' },
            ['ic'] = { query = '@class.inner', desc = 'Select inner part of a class' },
          },
          selection_modes = {
            ['@parameter.outer'] = 'v', -- charwise
            ['@function.outer'] = 'V', -- linewise
            ['@class.outer'] = '<c-v>', -- blockwise
          },
          -- If you set this to `true` (default is `false`) then any textobject is
          -- extended to include preceding or succeeding whitespace. Succeeding
          -- whitespace has priority in order to act similarly to eg the built-in
          -- `ap`.
          include_surrounding_whitespace = false,
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>]a'] = '@parameter.inner', -- swap parameters/argument with next
            ['<leader>]:'] = '@property.outer', -- swap object property with next
            ['<leader>]f'] = '@function.outer', -- swap function with next
            ['<leader>]c'] = '@class.outer',
          },
          swap_previous = {
            ['<leader>[a'] = '@parameter.inner', -- swap parameters/argument with prev
            ['<leader>[:'] = '@property.outer', -- swap object property with prev
            ['<leader>[f'] = '@function.outer', -- swap function with previous
            ['<leader>[c'] = '@class.outer',
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            -- [']s'] = { query = '@statement.outer' },
            [']l'] = { query = '@loop.outer', desc = 'Next loop start' },
            [']m'] = { query = '@call.outer', desc = 'Next function call start' },
            [']f'] = { query = '@function.outer', desc = 'Next method/function def start' },
            [']c'] = { query = '@class.outer', desc = 'Next class start' },
            [']r'] = { query = '@return.outer' },
            [']i'] = { query = '@conditional.outer', desc = 'Next conditional start' },

            -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
            -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
            [']s'] = { query = '@local.scope', query_group = 'locals', desc = 'Next scope' },
            [']z'] = { query = '@fold', query_group = 'folds', desc = 'Next fold' },
          },
          goto_next_end = {
            [']L'] = { query = '@loop.outer', desc = 'Next loop end' },
            [']M'] = { query = '@call.outer', desc = 'Next function call end' },
            [']F'] = { query = '@function.outer', desc = 'Next method/function def end' },
            [']R'] = { query = '@return.outer' },
            [']C'] = { query = '@class.outer', desc = 'Next class end' },
            [']I'] = { query = '@conditional.outer', desc = 'Next conditional end' },
          },
          goto_previous_start = {
            ['[l'] = { query = '@loop.outer', desc = 'Prev loop start' },
            ['[m'] = { query = '@call.outer', desc = 'Prev function call start' },
            ['[f'] = { query = '@function.outer', desc = 'Prev method/function def start' },
            ['[r'] = { query = '@return.outer' },
            ['[c'] = { query = '@class.outer', desc = 'Prev class start' },
            ['[i'] = { query = '@conditional.outer', desc = 'Prev conditional start' },
            -- ['[s'] = { query = '@scope', query_group = 'locals', desc = 'Next scope' },
            ['[s'] = { query = '@local.scope', query_group = 'locals', desc = 'Next scope' },
          },
          goto_previous_end = {
            ['[L'] = { query = '@loop.outer', desc = 'Prev loop end' },
            ['[M'] = { query = '@call.outer', desc = 'Prev function call end' },
            ['[F'] = { query = '@function.outer', desc = 'Prev method/function def end' },
            ['[R'] = { query = '@return.outer' },
            ['[C'] = { query = '@class.outer', desc = 'Prev class end' },
            ['[I'] = { query = '@conditional.outer', desc = 'Prev conditional end' },
          },
        },
      },
    }
  end,
}
