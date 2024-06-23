return {
  'vim-test/vim-test',
  dependencies = {
    'preservim/vimux',
  },
  vim.keymap.set('n', '<leader>tn', ':TestNearest<CR>', { desc = '[T]est [N]earest to the cursor' }),
  vim.keymap.set('n', '<leader>tf', ':TestFile<CR>', { desc = '[T]est the current [F]ile' }),
  vim.keymap.set('n', '<leader>ta', ':TestSuite<CR>', { desc = '[T]est [A]ll (the Suite)' }),
  vim.keymap.set('n', '<leader>tl', ':TestLast<CR>', { desc = '[T]est the [L]ast run test' }),
  vim.cmd "let test#strategy = 'vimux'",
}
