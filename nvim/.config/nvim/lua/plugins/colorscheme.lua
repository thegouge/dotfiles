return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
  },
  { -- You can easily change to a different colorscheme.
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      -- vim.api.nvim_create_autocmd('BufEnter', {
      --   desc = 'Change the colorscheme based on the file type',
      --   callback = function()
      --     local filetype = vim.bo.filetype
      --     if filetype == 'go' then
      --       vim.cmd.colorscheme 'catppuccin-mocha'
      --     else
      --       vim.cmd.colorscheme 'tokyonight-night'
      --     end
      --   end,
      -- })

      vim.cmd.colorscheme 'tokyonight-night'
      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
  },
  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
}
