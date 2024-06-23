return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration
    'nvim-telescope/telescope.nvim', -- optional
  },
  config = function()
    local neogit = require 'neogit'

    vim.keymap.set('n', '<leader>gs', neogit.open, { silent = true, desc = '[G]it [S]tart' })
    vim.keymap.set('n', '<leader>gc', ':Neogit commit<CR>', { silent = true, desc = '[G]it [C]ommit' })
    vim.keymap.set('n', '<leader>gp', ':Neogit pull<CR>', { silent = true, desc = '[G]it [P]ull' })
    vim.keymap.set('n', '<leader>gP', ':Neogit push<CR>', { silent = true, desc = '[G]it [P]ush' })
    vim.keymap.set('n', '<leader>gb', ':Telescope git_branches<CR>', { silent = true, desc = 'Search [G]it [B]ranches' })

    neogit.setup {}
  end,
}
