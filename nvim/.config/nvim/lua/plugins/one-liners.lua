return {
  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
  'NMAC427/guess-indent.nvim', -- Detect tabstop and shiftwidth automatically
  'davidosomething/format-ts-errors.nvim', -- Format TS errors
  { -- Prettier Status Line
    'nvim-lualine/lualine.nvim',
    opts = {
      theme = 'dracula',
    },
  },
}
