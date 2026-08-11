return { -- Collection of various small independent plugins/modules
  'nvim-mini/mini.nvim',
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup()

    require('mini.pairs').setup()

    require('mini.move').setup {
      mappings = {
        -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
        left = '<A-h>',
        right = '<A-l>',
        down = '<A-j>',
        up = '<A-k>',

        -- Move current line in Normal mode
        line_left = '<A-h>',
        line_right = '<A-l>',
        line_down = '<A-j>',
        line_up = '<A-k>',
      },
    }

    -- require('mini.operators').setup {
    --   -- Each entry configures one operator.
    --   -- `prefix` defines keys mapped during `setup()`: in Normal mode
    --   -- to operate on textobject and line, in Visual - on selection.
    --
    --   -- Evaluate text and replace with output
    --   evaluate = {
    --     prefix = 'g=',
    --
    --     -- Function which does the evaluation
    --     func = nil,
    --   },
    --
    --   -- Exchange text regions
    --   exchange = {
    --     -- NOTE: Default `gx` is remapped to `gX`
    --     prefix = 'gx',
    --
    --     -- Whether to reindent new text to match previous indent
    --     reindent_linewise = true,
    --   },
    --
    --   -- Multiply (duplicate) text
    --   multiply = {
    --     prefix = 'gm',
    --
    --     -- Function which can modify text before multiplying
    --     func = nil,
    --   },
    --
    --   -- Replace text with register
    --   replace = {
    --     -- NOTE: Default `gr*` LSP mappings are removed
    --     prefix = 'gr',
    --
    --     -- Whether to reindent new text to match previous indent
    --     reindent_linewise = true,
    --   },
    --
    --   -- Sort text
    --   sort = {
    --     prefix = 'gs',
    --
    --     -- Function which does the sort
    --     func = nil,
    --   },
    -- }
  end,
}
