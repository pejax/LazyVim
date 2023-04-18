-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.backupdir = os.getenv("RAMDISK") -- https://neovim.io/doc/user/options.html#%27backupdir%27
opt.cursorcolumn = true -- https://neovim.io/doc/user/options.html#%27cursorline%27
opt.directory = os.getenv("RAMDISK") -- https://neovim.io/doc/user/options.html#%27directory%27
opt.swapfile = false -- https://neovim.io/doc/user/options.html#%27swapfile%27
opt.undofile = false
