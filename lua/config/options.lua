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

vim.g.maplocalleader = ","

local opt = vim.opt

opt.autoindent      = true                  -- https://neovim.io/doc/user/options.html#%27autoindent%27
opt.autowrite       = false                 -- Enable auto write
opt.backup          = false                 -- https://neovim.io/doc/user/options.html#%27backup%27
opt.backupdir       = os.getenv("RAMDISK")  -- https://neovim.io/doc/user/options.html#%27backupdir%27
opt.colorcolumn     = "132"                 -- https://neovim.io/doc/user/options.html#%27colorcolumn%27
opt.compatible      = false                 -- https://neovim.io/doc/user/options.html#%27compatible%27
opt.cursorcolumn    = true                  -- https://neovim.io/doc/user/options.html#%27cursorline%27
opt.directory       = os.getenv("RAMDISK")  -- https://neovim.io/doc/user/options.html#%27directory%27
opt.encoding        = "utf8"                -- https://neovim.io/doc/user/options.html#%27encoding%27
opt.errorbells      = false                 -- https://neovim.io/doc/user/options.html#%27errorbells%27
opt.formatoptions   = "jcroqlnt"            -- tcqj
opt.grepformat      = "%f:%l:%c:%m"
opt.grepprg         = "rg --vimgrep"
opt.laststatus      = 3                     -- https://neovim.io/doc/user/options.html#%27laststatus%27
opt.pumblend        = 10                    -- Popup blend
opt.pumheight       = 10                    -- Maximum number of entries in a popup
opt.shortmess:append({ W = true, I = true, c = true })
opt.showmatch       = true                  -- https://neovim.io/doc/user/options.html#%27showmatch%27
opt.softtabstop     = 2                     -- https://neovim.io/doc/user/options.html#%27softtabstop%27
opt.swapfile        = false                 -- https://neovim.io/doc/user/options.html#%27swapfile%27
opt.timeoutlen      = 500                   -- https://neovim.io/doc/user/options.html#%27timeoutlen%27
opt.updatetime      = 250                   -- https://neovim.io/doc/user/options.html#%27updatetime%27
opt.writebackup     = false                 -- https://neovim.io/doc/user/options.html#%27writebackup%27
if vim.fn.has("mac") then
  opt.guifont       = "FiraMono Nerd Font Mono,MesloLGS NF:h10" --https://neovim.io/doc/user/options.html#%27guifont%27
else
  opt.guifont       = "FiraMono Nerd Font Mono,MesloLGS NF:h8"  --https://neovim.io/doc/user/options.html#%27guifont%27
end

if vim.fn.has("nvim-0.9.0") == 1 then
  opt.splitkeep = "screen"
  opt.shortmess:append({ C = true })
end

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
-- Fix autocomment
vim.g.autocomment   = "off"                 -- see autocmd for formatoptions-=cro

vim.cmd([[
  hi CursorLine cterm=underline             " https://neovim.io/doc/user/usr_06.html
  hi WinSeparator guibg=None
  hi Whitespace ctermfg=Green               " https://neovim.io/doc/user/usr_06.html
  exec "set list listchars=tab:>-,nbsp:~,trail:\uB7"
]])

