-- User Interface Plugins

-- "pejax/vim-colorschemes" (Vim colorschemes)
-- "pejax/colorscheme-persist.nvim" (Colorscheme persistence)
-- "LazyVim/LazyVim" (Load colorscheme)

return {
  -- Add Colorschemes
  {
    "pejax/vim-colorschemes",
    url = "git@github.com:pejax/vim-colorschemes",
  },

  -- IntelliJ colorscheme
  {
    "vermdeep/darcula_dark.nvim",
  },
  {
    "rktjmp/lush.nvim",
    dependencies = {
      "vermdeep/darcula_dark.nvim"
    },
  },

  -- Add Color Picker persistence
  {
    "pejax/colorscheme-persist.nvim",
    url = "git@github.com:pejax/colorscheme-persist.nvim",
  },

  -- Configure LazyVim to load colorscheme from NVIM_COLORSCHEME environment variable
  {
    "LazyVim/LazyVim",
    init = function(plug)
      --vim.cmd "set termguicolors"
      local nvim_colorscheme = os.getenv("NVIM_COLORSCHEME")
      if nvim_colorscheme and nvim_colorscheme ~= "" then
        plug.opts.colorscheme = nvim_colorscheme
      else
        plug.opts.colorscheme = "monokai"
      end
    end,
  },
}
