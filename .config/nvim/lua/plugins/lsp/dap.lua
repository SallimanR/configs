return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'nvim-neotest/nvim-nio',
      { 'theHamsta/nvim-dap-virtual-text', opts = {} },
      'rcarriga/nvim-dap-ui',
      {
        'mfussenegger/nvim-dap-python',
        ft = 'python',
        -- stylua: ignore
        keys = {
          { "<leader>dPt", function() require('dap-python').test_method() end, desc = "Debug Method", ft = "python" },
          { "<leader>dPc", function() require('dap-python').test_class() end, desc = "Debug Class", ft = "python" },
          { "<leader>dPs", function() require('dap-python').debug_selection() end, ft = "python" },
        },
      },
    },
    config = function(_, opts)
      local dap = require 'dap'
      local dapui = require 'dapui'
      require('nvim-dap-virtual-text').setup {
        commented = true, -- Show virtual text alongside comment
      }

      require('dap-python').setup '~/.local/share/nvim/mason/packages/debugpy/venv/bin/python'
      table.insert(require('dap').configurations.python, {
        type = 'python',
        request = 'launch',
        name = 'My custom launch configuration',
        program = '${file}',
        -- more options, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
      })

      dapui.setup(opts)
      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open {}
      end
      dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close {}
      end
      dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close {}
      end
    end,

    -- stylua: ignore
    keys = {
      { '<leader>du', function() require('dapui').toggle {} end, desc = 'Dap UI' },
      { '<leader>de', function() require('dapui').eval() end, desc = 'Eval', mode = { 'n', 'v' } },
			
      { "<leader>ds", function() require("dap").session() end, desc = "Session" },
      { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
      { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },

      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
      { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },

      { "<leader>dc", function() require("dap").continue() end, desc = "Run/Continue" },
      { "<leader>da", function() require("dap").continue({ before = get_args }) end, desc = "Run with Args" },

      { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
      { "<leader>dg", function() require("dap").goto_() end, desc = "Go to Line (No Execute)" },
      { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
      { "<leader>dj", function() require("dap").down() end, desc = "Down" },
      { "<leader>dk", function() require("dap").up() end, desc = "Up" },
      { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
      { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
      { "<leader>dO", function() require("dap").step_over() end, desc = "Step Over" },
      { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
      { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
    },
  },
  -- {
  --   'jay-babu/mason-nvim-dap.nvim',
  --   dependencies = 'mason.nvim',
  --   cmd = { 'DapInstall', 'DapUninstall' },
  --   opts = {
  --     automatic_installation = true,
  --
  --     ensure_installed = {
  --       'python',
  --     },
  --
  --     handlers = {
  --       python = function() end,
  --     },
  --   },
  -- },
}
