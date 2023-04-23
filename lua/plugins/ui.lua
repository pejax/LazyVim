-- User Interface Plugins

-- "pejax/vim-colorschemes" (Vim colorschemes)
-- "pejax/colorscheme-picker.nvim" (Colorscheme Picker)
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

  -- Add Color Picker
  {
    "pejax/colorscheme-picker.nvim",
    url = "git@github.com:pejax/colorscheme-picker.nvim",
    opts = {
      env_file = ".env-overrides",
      excludes = { "delek", "morning", "peachpuff", "ron", "shine", "zellner" },
      default_key_map = false,
    },
  },

  -- Configure LazyVim to load nvim_colorscheme from environment
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
