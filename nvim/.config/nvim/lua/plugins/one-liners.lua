return {
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    ---@module 'todo-comments'
    ---@type TodoOptions
    ---@diagnostic disable-next-line: missing-fields
    opts = { signs = false },
  },
  -- {
  --   'windwp/nvim-autopairs',
  --   event = 'InsertEnter',
  --   opts = {},
  -- },
  { -- Prettier Status Line
    'nvim-lualine/lualine.nvim',
    opts = {
      theme = 'dracula',
    },
  },
  'NMAC427/guess-indent.nvim',
  'davidosomething/format-ts-errors.nvim', -- Format TS errors
}
