return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
    'leoluz/nvim-dap-go',
  },
  config = function()
    local dap, dapui = require 'dap', require 'dapui'

    require('dapui').setup()
    require('dap-go').setup()

    vim.keymap.set('n', '<Leader>db', dap.toggle_breakpoint, { desc = 'Toggle a [d]ap [b]reakpoint' })
    vim.keymap.set('n', '<Leader>dc', dap.continue, { desc = '[d]ap [c]ontinue' })

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
  end,
}
