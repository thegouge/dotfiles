return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen" }, -- add more commands here
  config = function()
    require("diffview").setup()
  end,
}
