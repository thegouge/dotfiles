local remaps = {
  n = {
    -- Diagnostic keymaps
    ['[d'] = { vim.diagnostic.goto_prev, 'Go to previous [D]iagnostic message' },
    [']d'] = { vim.diagnostic.goto_next, 'Go to next [D]iagnostic message' },
    ['<leader>e'] = { vim.diagnostic.open_float, 'Show diagnostic [E]rror messages' },
    ['<leader>q'] = { vim.diagnostic.setloclist, 'Open diagnostic [Q]uickfix list' },

    -- LSP configuration
    ['<leader>rn'] = { vim.lsp.buf.rename, '[R]e[n]ame' },
    ['<leader>ca'] = { vim.lsp.buf.code_action, '[C]ode [A]ction' },

    -- Telescope bindings
    -- See `:help telescope.builtin`
    ['<leader>?'] = { require('telescope.builtin').oldfiles, '[?] Find recently opened files' },
    ['<leader><space>'] = { require('telescope.builtin').buffers, '[ ] Find existing Buffers' },
    ['<leader>ff'] = {
      function()
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown { winblend = 10, previewer = false })
      end,
      '[F]uzzy [F]ind in current buffer',
    },
    ['<leader>gf'] = { require('telescope.builtin').git_files, 'Search [G]it [F]iles' },
    ['<leader>sf'] = { require('telescope.builtin').find_files, '[S]earch [F]iles' },
    ['<leader>sh'] = { require('telescope.builtin').help_tags, '[S]earch [H]elp' },
    ['<leader>sw'] = { require('telescope.builtin').grep_string, '[S]earch current [W]ord' },
    ['<leader>sg'] = { require('telescope.builtin').live_grep, '[S]earch by [G]rep' },
    ['<leader>sd'] = { require('telescope.builtin').diagnostics, '[S]earch [D]iagnostics' },
    ['<leader>sr'] = { require('telescope.builtin').resume, '[S]earch [R]esume' },
    ['<leader>n'] = { '<cmd> set rnu! <CR>', 'Toggle relative number' },

    -- ["<leader>s"] = { ":split", "[S]plit Window" },
    ['<leader>v'] = { ':vsplit<CR>', 'Split Window [V]ertically' },

    -- traditional save
    ['<C-s>'] = { '<cmd> w <CR>', '[S]ave current file' },

    --  Use CTRL+<hjkl> to switch between windows
    ['<C-h>'] = { '<C-w><C-h>', 'Move focus to the left window' },
    ['<C-j>'] = { '<C-w><C-j>', 'Move focus to the lower window' },
    ['<C-k>'] = { '<C-w><C-k>', 'Move focus to the upper window' },
    ['<C-l>'] = { '<C-w><C-l>', 'Move focus to the right window' },

    -- kebinds to resize window splits
    ['<M-,>'] = { '<c-w>5<', 'Make the current split bigger' },
    ['<M-.>'] = { '<c-w>5>', 'Make the current split smaller' },

    -- Opening/closing the file tree explorer
    -- ['<C-n>'] = { ':Neotree toggle<CR>', 'Toggle File Tree' },

    ['<leader>/'] = {
      function()
        require('Comment.api').toggle.linewise.current()
      end,
      '[/] Toggle comment on current line',
    },

    -- Gitsigns
    [']c'] = {
      function()
        if vim.wo.diff then
          return ']c'
        end
        vim.schedule(function()
          require('gitsigns').next_hunk()
        end)
        return '<Ignore>'
      end,
      'Jump to next hunk',
      { expr = true },
    },
    ['[c'] = {
      function()
        if vim.wo.diff then
          return '[c'
        end
        vim.schedule(function()
          require('gitsigns').prev_hunk()
        end)
        return '<Ignore>'
      end,
      'Jump to prev hunk',
      { expr = true },
    },
    ['<leader>rh'] = {
      function()
        require('gitsigns').reset_hunk()
      end,
      '[R]eset [H]unk',
    },
    ['<leader>ph'] = {
      function()
        require('gitsigns').preview_hunk()
      end,
      '[P]review [H]unk',
    },
    ['<leader>gb'] = {
      function()
        package.loaded.gitsigns.blame_line()
      end,
      '[G]it [B]lame line',
    },
    ['<leader>td'] = {
      function()
        require('gitsigns').toggle_deleted()
      end,
      '[T]oggle [D]eleted',
    },
    ['<leader>gs'] = {
      function()
        require('gitsigns').stage_hunk()
      end,
      '[G]it [S]tage hunk',
    },

    -- Set highlight on search, but clear on pressing <Esc> in normal mode
    ['<Esc>'] = { '<cmd>nohlsearch<CR>', 'clear Search' },
  },
  t = {
    ['<Esc><Esc>'] = { '<C-\\><C-n>', 'Escape the terminal' },
  },
  v = {
    ['<leader>/'] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      'Toggle comment on selection',
    },
  },
}

-- document existing key chains
require('which-key').register {
  ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
  ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
  ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
  ['<leader>h'] = { name = 'More git', _ = 'which_key_ignore' },
  ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
  ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
  ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
}

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- programmatically setting all of the above keymaps
for mode, mappings in pairs(remaps) do
  for command, args in pairs(mappings) do
    local options = args[3]

    if options == nil then
      options = {}
    end

    if args[2] ~= '' then
      options.desc = args[2]
    end

    vim.keymap.set(mode, command, args[1], options)
  end
end
