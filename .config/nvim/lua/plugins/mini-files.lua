local mini_files_git = require 'config.modules.mini-files-git'

return {
  'echasnovski/mini.files',
  version = false,
	-- stylua: ignore
	keys = {
		{ '<leader>e', function() require('mini.files').open(vim.api.nvim_buf_get_name(0), true) end, },
		{ '<leader>E', function() require('mini.files').open(vim.uv.cwd(), true) end, },
	},
  config = function(_, opts)
    -- local nsminifiles = vim.api.nvim_create_namespace 'mini_files_git'
    -- local autocmd = vim.api.nvim_create_autocmd
    -- local _, minifiles = pcall(require, 'mini.files')
    --
    -- -- cache for git status
    -- local gitstatuscache = {}
    -- local cachetimeout = 2000 -- in milliseconds
    -- local uv = vim.uv or vim.loop
    --
    -- local function issymlink(path)
    --   local stat = uv.fs_lstat(path)
    --   return stat and stat.type == 'link'
    -- end
    --
    -- ---@type table<string, {symbol: string, hlgroup: string}>
    -- ---@param status string
    -- ---@return string symbol, string hlgroup
    -- local function mapsymbols(status, is_symlink)
    --   local statusmap = {
    -- -- stylua: ignore start
    -- [" m"] = { symbol = "•", hlgroup  = "minidiffsignchange"}, -- modified in the working directory
    -- ["m "] = { symbol = "✹", hlgroup  = "minidiffsignchange"}, -- modified in index
    -- ["mm"] = { symbol = "≠", hlgroup  = "minidiffsignchange"}, -- modified in both working tree and index
    -- ["a "] = { symbol = "+", hlgroup  = "minidiffsignadd"   }, -- added to the staging area, new file
    -- ["aa"] = { symbol = "≈", hlgroup  = "minidiffsignadd"   }, -- file is added in both working tree and index
    -- ["d "] = { symbol = "-", hlgroup  = "minidiffsigndelete"}, -- deleted from the staging area
    -- ["am"] = { symbol = "⊕", hlgroup  = "minidiffsignchange"}, -- added in working tree, modified in index
    -- ["ad"] = { symbol = "-•", hlgroup = "minidiffsignchange"}, -- added in the index and deleted in the working directory
    -- ["r "] = { symbol = "→", hlgroup  = "minidiffsignchange"}, -- renamed in the index
    -- ["u "] = { symbol = "‖", hlgroup  = "minidiffsignchange"}, -- unmerged path
    -- ["uu"] = { symbol = "⇄", hlgroup  = "minidiffsignadd"   }, -- file is unmerged
    -- ["ua"] = { symbol = "⊕", hlgroup  = "minidiffsignadd"   }, -- file is unmerged and added in working tree
    -- ["??"] = { symbol = "?", hlgroup  = "minidiffsigndelete"}, -- untracked files
    -- ["!!"] = { symbol = "!", hlgroup  = "minidiffsignchange"}, -- ignored files
    --     -- stylua: ignore end
    --   }
    --
    --   local result = statusmap[status] or { symbol = '?', hlgroup = 'nontext' }
    --   local gitsymbol = result.symbol
    --   local githlgroup = result.hlgroup
    --
    --   local symlinksymbol = is_symlink and '↩' or ''
    --
    --   -- combine symlink symbol with git status if both exist
    --   local combinedsymbol = (symlinksymbol .. gitsymbol):gsub('^%s+', ''):gsub('%s+$', '')
    --   -- change the color of the symlink icon from "minidiffsigndelete" to something else
    --   local combinedhlgroup = is_symlink and 'minidiffsigndelete' or githlgroup
    --
    --   return combinedsymbol, combinedhlgroup
    -- end
    --
    -- ---@param cwd string
    -- ---@param callback function
    -- ---@return nil
    -- local function fetchgitstatus(cwd, callback)
    --   local clean_cwd = cwd:gsub('^minifiles://%d+/', '')
    --   ---@param content table
    --   local function on_exit(content)
    --     if content.code == 0 then
    --       callback(content.stdout)
    --       -- vim.g.content = content.stdout
    --     end
    --   end
    --   ---@see vim.system
    --   vim.system({ 'git', 'status', '--ignored', '--porcelain' }, { text = true, cwd = clean_cwd }, on_exit)
    -- end
    --
    -- ---@param buf_id integer
    -- ---@param gitstatusmap table
    -- ---@return nil
    -- local function updateminiwithgit(buf_id, gitstatusmap)
    --   vim.schedule(function()
    --     local nlines = vim.api.nvim_buf_line_count(buf_id)
    --     local cwd = vim.fs.root(buf_id, '.git')
    --     local escapedcwd = cwd and vim.pesc(cwd)
    --     escapedcwd = vim.fs.normalize(escapedcwd)
    --
    --     for i = 1, nlines do
    --       local entry = minifiles.get_fs_entry(buf_id, i)
    --       if not entry then
    --         break
    --       end
    --       local relativepath = entry.path:gsub('^' .. escapedcwd .. '/', '')
    --       local status = gitstatusmap[relativepath]
    --
    --       if status then
    --         local symbol, hlgroup = mapsymbols(status, issymlink(entry.path))
    --         vim.api.nvim_buf_set_extmark(buf_id, nsminifiles, i - 1, 0, {
    --           sign_text = symbol,
    --           sign_hl_group = hlgroup,
    --           priority = 2,
    --         })
    --         -- this below code is responsible for coloring the text of the items. comment it out if you don't want that
    --         local line = vim.api.nvim_buf_get_lines(buf_id, i - 1, i, false)[1]
    --         -- find the name position accounting for potential icons
    --         local namestartcol = line:find(vim.pesc(entry.name)) or 0
    --
    --         if namestartcol > 0 then
    --           vim.api.nvim_buf_set_extmark(buf_id, nsminifiles, i - 1, namestartcol - 1, {
    --             end_col = namestartcol + #entry.name - 1,
    --             hl_group = hlgroup,
    --           })
    --         end
    --       else
    --       end
    --     end
    --   end)
    -- end
    --
    -- -- thanks for the idea of gettings https://github.com/refractalize/oil-git-status.nvim signs for dirs
    -- ---@param content string
    -- ---@return table
    -- local function parsegitstatus(content)
    --   local gitstatusmap = {}
    --   -- lua match is faster than vim.split (in my experience )
    --   for line in content:gmatch '[^\r\n]+' do
    --     local status, filepath = string.match(line, '^(..)%s+(.*)')
    --     -- split the file path into parts
    --     local parts = {}
    --     for part in filepath:gmatch '[^/]+' do
    --       table.insert(parts, part)
    --     end
    --     -- start with the root directory
    --     local currentkey = ''
    --     for i, part in ipairs(parts) do
    --       if i > 1 then
    --         -- concatenate parts with a separator to create a unique key
    --         currentkey = currentkey .. '/' .. part
    --       else
    --         currentkey = part
    --       end
    --       -- if it's the last part, it's a file, so add it with its status
    --       if i == #parts then
    --         gitstatusmap[currentkey] = status
    --       else
    --         -- if it's not the last part, it's a directory. check if it exists, if not, add it.
    --         if not gitstatusmap[currentkey] then
    --           gitstatusmap[currentkey] = status
    --         end
    --       end
    --     end
    --   end
    --   return gitstatusmap
    -- end
    --
    -- ---@param buf_id integer
    -- ---@return nil
    -- local function updategitstatus(buf_id)
    --   if not vim.fs.root(buf_id, '.git') then
    --     return
    --   end
    --   local cwd = vim.fs.root(buf_id, '.git')
    --   -- local cwd = vim.fn.expand("%:p:h")
    --   local currenttime = os.time()
    --
    --   if gitstatuscache[cwd] and currenttime - gitstatuscache[cwd].time < cachetimeout then
    --     updateminiwithgit(buf_id, gitstatuscache[cwd].statusmap)
    --   else
    --     fetchgitstatus(cwd, function(content)
    --       local gitstatusmap = parsegitstatus(content)
    --       gitstatuscache[cwd] = {
    --         time = currenttime,
    --         statusmap = gitstatusmap,
    --       }
    --       updateminiwithgit(buf_id, gitstatusmap)
    --     end)
    --   end
    -- end
    --
    -- ---@return nil
    -- local function clearcache()
    --   gitstatuscache = {}
    -- end
    --
    -- local function augroup(name)
    --   return vim.api.nvim_create_augroup('minifiles_' .. name, { clear = true })
    -- end
    --
    -- autocmd('user', {
    --   group = augroup 'start',
    --   pattern = 'minifilesexploreropen',
    --   callback = function()
    --     local bufnr = vim.api.nvim_get_current_buf()
    --     updategitstatus(bufnr)
    --   end,
    -- })
    --
    -- autocmd('user', {
    --   group = augroup 'close',
    --   pattern = 'minifilesexplorerclose',
    --   callback = function()
    --     clearcache()
    --   end,
    -- })
    --
    -- autocmd('user', {
    --   group = augroup 'update',
    --   pattern = 'minifilesbufferupdate',
    --   callback = function(args)
    --     local bufnr = args.data.buf_id
    --     local cwd = vim.fs.root(bufnr, '.git')
    --     if gitstatuscache[cwd] then
    --       updateminiwithgit(bufnr, gitstatuscache[cwd].statusmap)
    --     end
    --   end,
    -- })
    require('mini.files').setup {
      mappings = {
        close = 'q',
        go_in = 'l',
        go_in_plus = 'l',
        go_out = 'h',
        go_out_plus = 'h',
        mark_goto = "'",
        mark_set = 'm',
        reset = '<bs>',
        reveal_cwd = '@',
        show_help = 'g?',
        synchronize = 'w',
        trim_left = '<',
        trim_right = '>',
      },
      options = {
        permanent_delete = false,
      },
      windows = {
        preview = true,
        width_focus = 35,
        width_preview = 35,
      },
    }
    mini_files_git.setup()
  end,
}
