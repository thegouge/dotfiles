local remaps = {
  n = {
    -- Diagnostic keymaps
    ['[d'] = { vim.diagnostic.goto_prev, 'Go to previous diagnostic message' },
    [']d'] = { vim.diagnostic.goto_next, 'Go to next diagnostic message' },
    ['<leader>fd'] = { vim.diagnostic.open_float, 'Open floating diagnostic message' },
    ['<leader>q'] = { vim.diagnostic.setloclist, 'Open diagnostics list' },

    -- LSP configuration
    ['<leader>rn'] = { vim.lsp.buf.rename, '[R]e[n]ame' },
    ['<leader>ca'] = { vim.lsp.buf.code_action, '[C]ode [A]ction' },

    -- Telescope bindings
    -- See `:help telescope.builtin`
    ['<leader>?'] = { require('telescope.builtin').oldfiles, "[?] Find recently opened files" },
    ['<leader><space>'] = { require('telescope.builtin').buffers, "[ ] Find existing Buffers" },
    ['<leader>ff'] = { function()
      require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown { winblend = 10, previewer = false })
    end, "[F]uzzy [F]ind in current buffer" },
    ['<leader>gf'] = { require('telescope.builtin').git_files, "Search [G]it [F]iles" },
    ['<leader>sf'] = { require('telescope.builtin').find_files, "[S]earch [F]iles" },
    ['<leader>sh'] = { require('telescope.builtin').help_tags, "[S]earch [H]elp" },
    ['<leader>sw'] = { require('telescope.builtin').grep_string, "[S]earch current [W]ord" },
    ['<leader>sg'] = { require('telescope.builtin').live_grep, "[S]earch by [G]rep" },
    ['<leader>sd'] = { require('telescope.builtin').diagnostics, "[S]earch [D]iagnostics" },
    ['<leader>sr'] = { require('telescope.builtin').resume, "[S]earch [R]esume" },
    ["<leader>n"] = { "<cmd> set rnu! <CR>", "Toggle relative number" },

    -- MY custom keybinds
    ["<leader>s"] = { ":split", "[S]plit Window" },
    ["<leader>v"] = { ":vsplit<CR>", "Split Window [V]ertically" },

    -- traditional save
    ["<C-s>"] = { "<cmd> w <CR>", "[S]ave current file" },

    -- navigate between windows
    ["<C-h>"] = { "<C-w>h", "Window left" },
    ["<C-j>"] = { "<C-w>j", "Window down" },
    ["<C-k>"] = { "<C-w>k", "Window up" },
    ["<C-l>"] = { "<C-w>l", "Window right" },

    -- formatting from lsp
    ["<leader>fm"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "LSP [f]or[m]atting",
    },

    -- Opening/closing the file tree explorer
    ["<leader>e"] = { ":Neotree<CR>", "Open File Tree" },
    ["<C-n>"] = { ":Neotree toggle<CR>", "Toggle File Tree" },

    ["<leader>/"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "[/] Toggle comment on current line",
    },

    -- Gitsigns
    ["]c"] = {
      function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          require("gitsigns").next_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to next hunk", { expr = true }
    },
    ["[c"] = { function()
      if vim.wo.diff then
        return "[c"
      end
      vim.schedule(function()
        require("gitsigns").prev_hunk()
      end)
      return "<Ignore>"
    end,
      "Jump to prev hunk", { expr = true } },
    ["<leader>rh"] = {
      function()
        require("gitsigns").reset_hunk()
      end,
      "[R]eset [H]unk",
    },
    ["<leader>ph"] = {
      function()
        require("gitsigns").preview_hunk()
      end,
      "[P]review [H]unk",
    },
    ["<leader>gb"] = {
      function()
        package.loaded.gitsigns.blame_line()
      end,
      "[G]it [B]lame line",
    },
    ["<leader>td"] = {
      function()
        require("gitsigns").toggle_deleted()
      end,
      "[T]oggle [D]eleted",
    },
    ["<leader>gs"] = {
      function()
        require("gitsigns").stage_hunk()
      end,
      "[G]it [S]tage hunk"
    },
  },
  v = {
    ["<leader>/"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "Toggle comment on selection",
    },
  }
}

-- programmatically setting all of the above keymaps
for mode, mappings in pairs(remaps) do
  for command, args in pairs(mappings) do
    local options = args[3]

    if options == nil then
      options = {}
    end

    if args[2] ~= "" then
      options.desc = args[2]
    end

    vim.keymap.set(mode, command, args[1], options)
  end
end
