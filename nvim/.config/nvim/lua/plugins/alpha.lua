return {
  'goolord/alpha-nvim',
  event = 'VimEnter', -- load plugin after all configuration is set
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },

  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    dashboard.section.header.val = {
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                     ]],
      [[       ████ ██████           █████      ██                     ]],
      [[      ███████████             █████                             ]],
      [[      █████████ ███████████████████ ███   ███████████   ]],
      [[     █████████  ███    █████████████ █████ ██████████████   ]],
      [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
      [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
      [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
    }

    _Gopts = {
      position = 'center',
      hl = 'Type',
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button('p', '󰈚   Projects', ':cd ~/Coding/ | :Oil<CR>'),
      dashboard.button('e', '   New file', ':ene <BAR> startinsert <CR>'),
      dashboard.button('f', '   Find file', ':cd ~/Coding | Telescope find_files<CR>'),
      dashboard.button('r', '   Recent', ':Telescope oldfiles<CR>'),
      dashboard.button('c', '   Config', ':e $MYVIMRC <CR> :cd %:h <CR> '),
      dashboard.button('m', '󱌣   Mason', ':Mason<CR>'),
      dashboard.button('l', '󰒲   Lazy', ':Lazy<CR>'),
      dashboard.button('q', '   Quit NVIM', ':qa<CR>'),
    }

    dashboard.opts.opts.noautocmd = true
    alpha.setup(dashboard.opts)

    require('alpha').setup(dashboard.opts)

    vim.api.nvim_create_autocmd('User', {
      pattern = 'LazyVimStarted',
      callback = function()
        local stats = require('lazy').stats()
        local count = (math.floor(stats.startuptime * 100) / 100)
        local datetime = os.date ' %d-%m-%Y   %H:%M:%S'
        local version = vim.version()
        local nvim_version_info = '   v' .. version.major .. '.' .. version.minor .. '.' .. version.patch

        dashboard.section.footer.val = {
          '󱐌 ' .. stats.count .. ' plugins loaded in ' .. count .. ' ms',
          datetime .. '  ' .. nvim_version_info,
        }
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}
