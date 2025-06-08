return {
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@type Flash.Config
    opts = {},
		-- stylua: ignore
    keys = {
      { 's', mode = { 'n', 'x', 'o' }, function() require('flash').jump() end, desc = 'Flash', },
      { '<A-s>', mode = { 'i' }, function() require('flash').jump() end, desc = 'Flash', },
      { 'S', mode = { 'n', 'x', 'o' }, function() require('flash').treesitter() end, desc = 'Flash Treesitter', },
      { 'r', mode = 'o', function() require('flash').remote() end, desc = 'Remote Flash', },
      { 'R', mode = { 'o', 'x' }, function() require('flash').treesitter_search() end, desc = 'Treesitter Search', },
			{ '<c-s>', mode = { 'c' }, function() require('flash').toggle() end, desc = 'Toggle Flash Search', },
	    {
				"zu",
				mode = { "n", "o", "x" },
				function()
					require("flash").treesitter({
						jump = { pos = "end" },
						label = { before = false, after = true, style = "overlay" },
					})
				end,
				desc = "Flash Treesitter",
			},
			{
				"zU",
				mode = { "n", "o", "x" },
				function()
					require("flash").treesitter({
						jump = { pos = "start" },
						label = { before = true, after = false, style = "overlay" },
					})
				end,
				desc = "Flash Treesitter",
			},
		},
  },
}
