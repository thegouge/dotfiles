local remaps = {
  n = {
    -- Diagnostic keymaps
    ['[d'] = { vim.diagnostic.get_prev, 'Go to previous [D]iagnostic message' },
    [']d'] = { vim.diagnostic.get_next, 'Go to next [D]iagnostic message' },
    ['<leader>e'] = { vim.diagnostic.open_float, 'Show diagnostic [E]rror messages' },
    ['<leader>q'] = { vim.diagnostic.setloclist, 'Open diagnostic [Q]uickfix list' },

    ['<leader>tn'] = { '<cmd> set rnu! <CR>', '[T]oggle relative [n]umber' },

    -- ['<leader>h'] = { ':split', 'Split Window [H]orizontally' },
    ['<leader>v'] = { ':vsplit<CR>', 'Split Window [V]ertically' },

    -- traditional save
    ['<C-s>'] = { '<cmd> w <CR>', '[S]ave current file' },

    --  Use CTRL+<hjkl> to switch between windows
    ['<C-h>'] = { ':wincmd h<CR>', 'Move focus to the left window', { silent = true } },
    ['<C-j>'] = { ':wincmd j<CR>', 'Move focus to the lower window', { silent = true } },
    ['<C-k>'] = { ':wincmd k<CR>', 'Move focus to the upper window', { silent = true } },
    ['<C-l>'] = { ':wincmd l<CR>', 'Move focus to the right window', { silent = true } },

    -- kebinds to resize window splits
    ['<M-,>'] = { '<c-w>5<', 'Make the current split bigger' },
    ['<M-.>'] = { '<c-w>5>', 'Make the current split smaller' },

    -- Set highlight on search, but clear on pressing <Esc> in normal mode
    ['<Esc>'] = { '<cmd>nohlsearch<CR>', 'clear Search' },

    -- run the current file
    ['<leader>x'] = { ':source % <CR>', 'E[x]ecute current file' },

    -- change the current working directory to the open file
    ['<leader>m'] = { ':cd %:h <CR>', '[m]ove to the current directory' },
  },
  t = {
    ['<Esc><Esc>'] = { '<C-\\><C-n>', 'Escape the terminal' },
  },
}

vim.keymap.set('n', 'd', '"_d')
vim.keymap.set('n', 'D', '"_D')
vim.keymap.set('v', 'd', '"_d')
vim.keymap.set('v', 'D', '"_D')

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
