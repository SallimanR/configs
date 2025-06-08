return {
  'ibhagwan/fzf-lua',
  -- optional for icon support
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {},
	-- stylua: ignore
  keys = {
    { '<leader>fo', function() require('fzf-lua').tabs() end, },
		{'<leader>og', function () require('fzf-lua').grep() end },
		{'<leader>olf', function () require('fzf-lua').lsp_finder() end },
  },
}
