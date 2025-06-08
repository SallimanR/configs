local opt = vim.opt

-- Disable tmux navigator when zooming the Vim pane
vim.g.tmux_navigator_disable_when_zoomed = 1
-- vim.o.foldmethod = 'manual'

-- remove status line
opt.laststatus = 0
vim.opt.showtabline = 0
opt.cmdheight = 0
vim.opt.showmode = false

opt.relativenumber = true
opt.number = true

-- Save undo history
vim.opt.undofile = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

opt.tabstop = 2
opt.shiftwidth = 2

-- search settings
opt.ignorecase = true
opt.smartcase = true

opt.autoindent = true
opt.smartindent = true
opt.hlsearch = true

-- Show which line your cursor is on
opt.cursorline = true

opt.background = 'dark'
opt.signcolumn = 'yes'

-- Configure how new splits should be opened
opt.splitright = true
opt.splitbelow = true

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
vim.opt.confirm = true

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- vim.opt.list = true
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.hl.on_yank()
  end,
})
