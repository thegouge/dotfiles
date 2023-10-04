---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>v"] = { ":vsplit", "Vertical Split the Window", opts = { nowait = true }},
    ["<leader>s"] = { ":split", "Split the Window", opts = { nowait = true }},
    ["<leader>gs"] = {
      function()
        require("gitsigns").stage_hunk()
      end,
      "Stage hunk"
    },
  },
}

-- more keybinds!

return M
