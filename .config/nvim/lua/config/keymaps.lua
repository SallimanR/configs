local key = vim.keymap

local function remove_unused()
  vim.lsp.buf.command {
    command = '_typescript.removeUnused',
    arguments = { vim.api.nvim_buf_get_name(0) },
  }
end
key.set('n', '<leader>ru', function()
  remove_unused()
end)

key.set({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
key.set({ 'n', 'x' }, '<Down>', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
key.set({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })
key.set({ 'n', 'x' }, '<Up>', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })

key.set('i', '<A-h>', '<Left>')
key.set('i', '<A-j>', '<Down>')
key.set('i', '<A-k>', '<Up>')
key.set('i', '<A-l>', '<Right>')
key.set('i', '<A-w>', '<esc>wa')
key.set('i', '<A-e>', '<esc>ea')
key.set('i', '<A-b>', '<esc>ba')

key.set('i', 'jk', '<ESC>')
key.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set({ 'n', 'x', 'o' }, 'H', '^')
vim.keymap.set({ 'n', 'x', 'o' }, 'L', '$')

key.set('n', '<C-a>', 'gg<S-v>G')

key.set('n', '+', '<C-a>')
key.set('n', '-', '<C-x>')

-- Lines
key.set('n', '<A-C-j>', ':m .+1<CR>==') -- move line up(n)
key.set('n', '<A-C-k>', ':m .-2<CR>==') -- move line down(n)
key.set('v', '<A-C-j>', ":m '>+1<CR>gv=gv") -- move line up(v)
key.set('v', '<A-C-k>', ":m '<-2<CR>gv=gv") -- move line down(v)
key.set('i', '<A-C-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move Down' })
key.set('i', '<A-C-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move Up' })
-- better indenting
key.set('v', '<', '<gv')
key.set('v', '>', '>gv')

-- Do things without affecting the registers
key.set('n', '<Leader>p', '"0p')
key.set('n', '<Leader>P', '"0P')
key.set('v', '<Leader>p', '"0p')
key.set('n', '<Leader>c', '"_c')
key.set('n', '<Leader>C', '"_C')
key.set('v', '<Leader>c', '"_c')
key.set('v', '<Leader>C', '"_C')
key.set('n', '<Leader>d', '"_d')
key.set('n', '<Leader>D', '"_D')
key.set('v', '<Leader>d', '"_d')
key.set('v', '<Leader>D', '"_D')
-- key.set('n', 'x', '"_x')
-- key.set('x', 'x', '"_x')
key.set({ 'n', 'v' }, 'X', '"_X', opts)
vim.keymap.set('n', 'x', function()
  -- Check if the current line is empty or contains only whitespace
  if vim.fn.getline('.'):match '^%s*$' then
    -- Delete the entire line if empty
    return '"_dd'
  else
    -- Fallback to default "x" behavior (delete single character)
    return '"_x'
  end
end, { noremap = true, expr = true })
vim.keymap.set('n', 'dd', function()
  -- Check if the current line is empty or contains only whitespace
  if vim.fn.getline('.'):match '^%s*$' then
    -- Delete the entire line if empty
    return '"_dd'
  else
    -- Fallback to default "x" behavior (delete single character)
    return 'dd'
  end
end, { noremap = true, expr = true })

-- Diagnostics
key.set('n', 'gl', function()
  vim.diagnostic.open_float()
end, { desc = 'Open Diagnostics in Float' })
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go { severity = severity }
  end
end
key.set('n', ']d', diagnostic_goto(true), { desc = 'Next Diagnostic' })
key.set('n', '[d', diagnostic_goto(false), { desc = 'Prev Diagnostic' })
key.set('n', ']e', diagnostic_goto(true, 'ERROR'), { desc = 'Next Error' })
key.set('n', '[e', diagnostic_goto(false, 'ERROR'), { desc = 'Prev Error' })
key.set('n', ']w', diagnostic_goto(true, 'WARN'), { desc = 'Next Warning' })
key.set('n', '[w', diagnostic_goto(false, 'WARN'), { desc = 'Prev Warning' })
-- key.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

key.set('n', '<leader>uI', function()
  vim.treesitter.inspect_tree()
  vim.api.nvim_input 'I'
end, { desc = 'Inspect Tree' })

-- Buffers
-- key.set('n', '[b', '<cmd>bprevious<cr>', { desc = 'Prev Buffer' }) -- vim defalut
-- key.set('n', ']b', '<cmd>bnext<cr>', { desc = 'Next Buffer' }) -- vim defalut
key.set('n', '<leader><bs>', "<c-^>'”zz")

-- Files
-- key.set('n', '<leader>fn', '<cmd>enew<cr>', { desc = 'New File' })

-- Split window
key.set('n', '<C-w>s', ':split<Return>', opts)
key.set('n', '<C-w>v', ':vsplit<Return>', opts)
-- unbind terminal history
vim.keymap.set({ 'n', 'v' }, 'q:', '')

key.set('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase Window Height' })
key.set('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease Window Height' })
key.set('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease Window Width' })
key.set('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase Window Width' })

-- Tabs
key.set('n', '<leader><tab>l', '<cmd>tablast<cr>', { desc = 'Last Tab' })
key.set('n', '<leader><tab>o', '<cmd>tabonly<cr>', { desc = 'Close Other Tabs' })
key.set('n', '<leader><tab>f', '<cmd>tabfirst<cr>', { desc = 'First Tab' })
key.set('n', '<leader><tab><tab>', '<cmd>tabnew<cr>', { desc = 'New Tab' })
key.set('n', '<leader><tab>]', '<cmd>tabnext<cr>', { desc = 'Next Tab' })
key.set('n', '<leader><tab>d', '<cmd>tabclose<cr>', { desc = 'Close Tab' })
key.set('n', '<leader><tab>[', '<cmd>tabprevious<cr>', { desc = 'Previous Tab' })
key.set('n', '<leader>1', '<cmd>tabn 1<cr>')
key.set('n', '<leader>2', '<cmd>tabn 2<cr>')
key.set('n', '<leader>3', '<cmd>tabn 3<cr>')
key.set('n', '<leader>4', '<cmd>tabn 4<cr>')
key.set('n', '<leader>5', '<cmd>tabn 5<cr>')
key.set('n', '<leader>6', '<cmd>tabn 6<cr>')
key.set('n', '<leader>7', '<cmd>tabn 7<cr>')
key.set('n', '<leader>8', '<cmd>tabn 8<cr>')
key.set('n', '<leader>9', '<cmd>tabn 9<cr>')

key.set('n', '<leader>q', '<cmd>q<cr>', { desc = 'Quit' })
key.set('n', '<leader>w', '<cmd>w<cr>')
-- key.set('n', '<leader>qq', '<cmd>qa<cr>', { desc = 'Quit All' })

key.set('n', '<leader>ti', vim.show_pos, { desc = 'Inspect Pos' })
key.set('n', '<leader>uI', function()
  vim.treesitter.inspect_tree()
  vim.api.nvim_input 'I'
end, { desc = 'Inspect Tree' })

Snacks.toggle.zoom():map('<C-w>m'):map '<leader>uZ'
-- Snacks.toggle.zen():map '<leader>uz'

key.set('v', '<leader>acl', '"-cconsole.log(<C-r>-)<esc>')
key.set('v', '<leader>apr', '"-cprint(<C-r>-)<esc>')
