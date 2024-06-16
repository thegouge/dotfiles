return {
  { 'tpope/vim-sleuth' }, -- Detect tabstop and shiftwidth automatically
  {
    'FabijanZulj/blame.nvim',
    config = function()
      vim.keymap.set('n', '<leader>gB', ':BlameToggle virtual<CR>', { silent = true, desc = 'toggle [G]it [B]lame' })
      require('blame').setup()
    end,
  },
}
