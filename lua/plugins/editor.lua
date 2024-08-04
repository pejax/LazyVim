-- Editor Plugins

-- "ggandor/leap.nvim" (Dsable)
-- "echasnovski/mini.pairs", (Disable)
-- "windwp/nvim-autopairs", (Replace mini.pairs)
-- "chentoast/marks.nvim" (Marks)
-- "dearrrfish/vim-applescript.nvim"

return {
  -- Disable leap
  {
    "ggandor/leap.nvim",
    enabled = false,
  },

  -- Disable mini.pairs
  {
    "echasnovski/mini.pairs",
    enabled = false,
  },

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
