-- Editor Plugins

-- "chentoast/marks.nvim" (Marks)
-- "ggandor/leap.nvim" (Leap)

return {
  -- Manage marks in gutter
  {
    "chentoast/marks.nvim",
    init = function(_)
      require("marks").setup({})
    end,
  },

  -- Fix stupid Leap key bindings
  {
    "ggandor/leap.nvim",
    --    dependencies = {
    --      -- which key integration
    --      {
    --        "folke/which-key.nvim",
    --        opts = function(_, opts)
    --          if require("lazyvim.util").has("leap.nvim") then
    --            opts.defaults["<localleader>s"] = { name = "+search" }
    --          end
    --        end,
    --      },
    --    },
    keys = function()
      return {
        { "<localleader>l", "<Plug>(leap-forward-to)", desc = "Leap forward to" },
        { "<localleader>L", "<Plug>(leap-backward-to)", desc = "Leap backward to" },
        { "<localleader>x", "<Plug>(leap-forward-till)", desc = "Leap forward till" },
        { "<localleader>X", "<Plug>(leap-backward-till)", desc = "Leap backward till" },
      }
    end,
  },

  -- AppleScript syntax coloring
  {
    "dearrrfish/vim-applescript",
  },
}
