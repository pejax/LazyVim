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

vim.api.nvim_create_autocmd({"BufEnter"}, {
  pattern = {"*.wsv"},
  command = "set filetype=wsv"
})

vim.cmd([[

  function! ReplaceTrailingWhitespace()
    " Replace trailing spaces with </br>
    if (&filetype == 'markdown')
      let l:save = winsaveview()
      %s/\s\+$/<\/br>/e
      call winrestview(l:save)
    endif
  endfunction

  command! FixMarkdown call ReplaceTrailingWhitespace()

  command! WipeRegs for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

]])
