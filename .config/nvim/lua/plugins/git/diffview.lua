return {
  'sindrets/diffview.nvim',
  cmd = { 'DiffviewOpen', 'DiffviewFileHistory' },
  opts = {},
  config = function()
    local function get_default_branch_name()
      local res = vim.system({ 'git', 'rev-parse', '--verify', 'main' }, { capture_output = true }):wait()
      return res.code == 0 and 'main' or 'master'
    end
  end,
	-- stylua: ignore
  keys = {
    { ',d', '<cmd>DiffviewOpen<cr>', { desc = 'Repo diff' } },
    { ',hh', '<cmd>DiffviewFileHistory<cr>', { desc = 'Repo history' } },
    { ',hf', '<cmd>DiffviewFileHistory --follow %<cr>', { desc = 'File history' } },
    { mode = { 'v' }, ',hl', "<Esc><Cmd>'<,'>DiffviewFileHistory --follow<CR>", { desc = 'Range history' } },
    { mode = { 'v' }, ',hl', "<Esc><Cmd>'<,'>DiffviewFileHistory --follow<CR>", { desc = 'Range history' } },
    { ',hm', function() vim.cmd('DiffviewOpen ' .. get_default_branch_name()) end, { desc = 'Diff against master' }, },
		{	',hM', function() vim.cmd('DiffviewOpen HEAD..origin/' .. get_default_branch_name()) end, { desc = 'Diff against origin/master' } }
	},
}
