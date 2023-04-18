-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.cmd([[
  " Disable EditorConfig from removing trailing spaces
  let g:EditorConfig_disable_rules = ['trim_trailing_whitespace']

  " Trim trailing whitespace for non-markdown files on write
  function! TrimWhitespace()
    if (&filetype != 'markdown') && (@% !~# 'neomutt')
      let l:save = winsaveview()
      %s/\s\+$//e
      call winrestview(l:save)
    endif
  endfunction

  autocmd BufWritePre * :call TrimWhitespace()
]])
