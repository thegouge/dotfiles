return {
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    on_attach = function(bufnr)
      local gitsigns = require 'gitsigns'

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map('n', ']h', function()
        if vim.wo.diff then
          vim.cmd.normal { ']h', bang = true }
        else
          gitsigns.nav_hunk 'next'
        end
      end, { desc = 'Jump to next [H]unk' })

      map('n', '[h', function()
        if vim.wo.diff then
          vim.cmd.normal { '[h', bang = true }
        else
          gitsigns.nav_hunk 'prev'
        end
      end, { desc = 'Jump to previous [H]unk' })

      -- Actions
      map('n', '<leader>hs', gitsigns.stage_hunk, { desc = '[H]unk [S]tage' })
      map('n', '<leader>hr', gitsigns.reset_hunk, { desc = '[H]unk [R]eset' })
      map('v', '<leader>hs', function()
        gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = '[H]unk [S]tage' })
      map('v', '<leader>hr', function()
        gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = '[H]unk [R]eset' })
      map('n', '<leader>hS', gitsigns.stage_buffer, { desc = '([H]unk) [S]tage buffer' })
      map('n', '<leader>hu', gitsigns.undo_stage_hunk, { desc = '[H]unk [U]n-stage' })
      map('n', '<leader>hR', gitsigns.reset_buffer, { desc = '([H]unk) [R]eset buffer' })
      map('n', '<leader>hp', gitsigns.preview_hunk, { desc = '[H]unk [P]review' })
      map('n', '<leader>hb', function()
        gitsigns.blame_line { full = true }
      end, { desc = 'Toggle [H]unk [B]lame' })
      map('n', '<leader>htb', gitsigns.toggle_current_line_blame, { desc = '([H]unk) [T]oggle [B]lame on the current line' })
      map('n', '<leader>hd', gitsigns.diffthis, { desc = '[H]unk [D]iff' })
      map('n', '<leader>hD', function()
        gitsigns.diffthis '~'
      end, { desc = '[H]unk [D]iff ~' })
      map('n', '<leader>htd', gitsigns.toggle_deleted, { desc = '([H]unk) [T]oggle [D]iff' })

      -- Text object
      map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end,
  },
}
