return {
  'stevearc/oil.nvim',
  opts = {
    default_file_explorer = true,
  },
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' },

  vim.keymap.set('n', '\\', ':Oil<CR>', { desc = 'Open parent directory in Oil' }),
}
