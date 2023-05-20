-- User Interface Plugins

-- "pejax/vim-colorschemes" (Vim colorschemes)
-- "pejax/colorscheme-persist.nvim" (Colorscheme persistence)
-- "LazyVim/LazyVim" (Load colorscheme)

return {
  -- Disable colorschemes
  {
    "folke/tokyonight.nvim",
    enabled = false,
  },
  {
    "jaeheonji/catppuccin-nvim",
    enabled = false,
  },

  -- Add Colorschemes
  {
    "pejax/vim-colorschemes",
    url = "git@github.com:pejax/vim-colorschemes",
  },

  -- Add Color Picker persistence
  {
    "pejax/colorscheme-persist.nvim",
    url = "git@github.com:pejax/colorscheme-persist.nvim",
    opts = {
      env_colorscheme = ".nvim-colorscheme",
    },
  },

  -- Configure LazyVim to load colorscheme from NVIM_COLORSCHEME environment variable
  {
    "LazyVim/LazyVim",
    opts = {},
    init = function(plug)
      local nvim_colorscheme = os.getenv("NVIM_COLORSCHEME")
      if nvim_colorscheme and nvim_colorscheme ~= "" then
        plug.opts.colorscheme = nvim_colorscheme
      end
    end,
  },
}
