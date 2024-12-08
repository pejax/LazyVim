-- Editor Plugins

-- "windwp/nvim-autopairs", (Replace mini.pairs)
-- "chentoast/marks.nvim", (Marks)
-- "dearrrfish/vim-applescript.nvim"

return {
  -- Enable nvim-autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },

  -- Manage marks in gutter
  {
    "chentoast/marks.nvim",
    init = function(_)
      require("marks").setup({})
    end,
  },

  -- AppleScript syntax coloring
  {
    "dearrrfish/vim-applescript",
  },
}
