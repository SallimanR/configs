return {
  'gbprod/substitute.nvim',
  opts = {},
	-- stylua: ignore
  keys = { { 'gp', function() require('substitute').operator() end, { noremap = true }, },
    { 'ss', function() require('substitute').line() end, { noremap = true }, },
    { 'S', function() require('substitute').eol() end, { noremap = true }, },
    { mode = { 'x' }, 's', function() require('substitute').visual() end, { noremap = true }, },
  },
}
