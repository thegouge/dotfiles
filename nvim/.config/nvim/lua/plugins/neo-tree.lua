-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '<leader>\\', ':Neotree toggle<CR>', { desc = 'Toggle Neotree' } },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['<leader>\\'] = 'close_window',
        },
      },
    },
  },
  config = function()
    require('neo-tree').setup { close_if_last_window = true }
  end,
}
