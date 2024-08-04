-----------------------------------------------------------
--                _                               _
--   __ _  _   _ | |_  ___    ___  _ __ ___    __| |
--  / _` || | | || __|/ _ \  / __|| '_ ` _ \  / _` |
-- | (_| || |_| || |_| (_) || (__ | | | | | || (_| |
--  \__,_| \__,_| \__|\___/  \___||_| |_| |_| \__,_|
--
-----------------------------------------------------------

-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Fix WSV file handling (keep BOM, do not mess with EOL)
vim.api.nvim_create_autocmd(
  {"BufWinEnter","BufWritePost"},
  {
    pattern = {"*.wsv"},
    command = "set bomb | set noeol | set nofixeol"
  }
)

vim.cmd([[
  " Disable EditorConfig from removing trailing spaces
  let g:EditorConfig_disable_rules = ['trim_trailing_whitespace']

  autocmd FileType * setlocal formatoptions-=a formatoptions-=c formatoptions-=r formatoptions-=o

  command! WipeRegs for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
]])
