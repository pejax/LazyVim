-----------------------------------------------------------
--                _    _
--   ___   _ __  | |_ (_)  ___   _ __   ___
--  / _ \ |  _ \ | __|| | / _ \ |  _ \ / __|
-- | (_) || |_) || |_ | || (_) || | | |\__ \
--  \___/ | .__/  \__||_| \___/ |_| |_||___/
--        |_|
--
-----------------------------------------------------------

-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt
local ramdisk = os.getenv("RAMDISK")

opt.autoindent    = true                  -- https://neovim.io/doc/user/options.html#%27autoindent%27
opt.autowrite     = false                 -- https://neovim.io/doc/user/options.html#%27autowrite%27
opt.backup        = false                 -- https://neovim.io/doc/user/options.html#%27backup%27
opt.backupdir     = ramdisk               -- https://neovim.io/doc/user/options.html#%27backupdir%27
opt.colorcolumn   = "132"                 -- https://neovim.io/doc/user/options.html#%27colorcolumn%27
opt.cursorcolumn  = true                  -- https://neovim.io/doc/user/options.html#%27cursorline%27
opt.directory     = ramdisk               -- https://neovim.io/doc/user/options.html#%27directory%27
opt.errorbells    = false                 -- https://neovim.io/doc/user/options.html#%27errorbells%27
opt.laststatus    = 3                     -- https://neovim.io/doc/user/options.html#%27laststatus%27
opt.showmatch     = true                  -- https://neovim.io/doc/user/options.html#%27showmatch%27
opt.softtabstop   = 2                     -- https://neovim.io/doc/user/options.html#%27softtabstop%27
opt.swapfile      = false                 -- https://neovim.io/doc/user/options.html#%27swapfile%27
opt.timeoutlen    = 500                   -- https://neovim.io/doc/user/options.html#%27timeoutlen%27
opt.updatetime    = 250                   -- https://neovim.io/doc/user/options.html#%27updatetime%27
opt.writebackup   = false                 -- https://neovim.io/doc/user/options.html#%27writebackup%27
if vim.fn.has("mac") then
  opt.guifont = "FiraMono Nerd Font Mono,MesloLGS NF:h10"   --https://neovim.io/doc/user/options.html#%27guifont%27
else
  opt.guifont = "FiraMono Nerd Font Mono,MesloLGS NF:h8"    --https://neovim.io/doc/user/options.html#%27guifont%27
end

-- Globals
vim.g.maplocalleader = ","
vim.g.autoformat = false
vim.g.markdown_recommended_style = 0      -- Fix markdown indentation settings
vim.g.autocomment = "off"                 -- see autocmd for formatoptions-=acro

vim.cmd([[
  hi CursorLine cterm=underline             " https://neovim.io/doc/user/usr_06.html
  hi WinSeparator guibg=None
  hi Whitespace ctermfg=Green               " https://neovim.io/doc/user/usr_06.html
  exec "set list listchars=tab:>-,nbsp:~,trail:\uB7"
]])
