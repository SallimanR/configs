return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    -- lazy = false, -- neo-tree will lazily load itself
    ---@module "neo-tree"
    ---@type neotree.Config?
    opts = {
      window = {
        mappings = {
          ['<leader>T'] = {
            'toggle_preview',
            config = {
              use_float = true,
              -- use_image_nvim = true,
              -- title = 'Neo-tree Preview',
            },
          },
        },
      },
    },
    keys = { { mode = { 'n' }, '<leader>tt', '<Cmd>Neotree toggle<CR>' } },
  },
}
