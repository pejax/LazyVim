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

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "*.wsv" },
  callback = function()
    vim.opt.filetype = "wsv"
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "*.md" },
  callback = function()
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local hits = 0
    for _, line in ipairs(lines) do
      if string.match(line, " + +$") then
        hits = hits + 1
      end
    end
    if hits > 0 then
	    --local yes_no = vim.fn.input(hits .. " lines with trailing double spaces found - replace with </br>? [Y/n]: ")
	    --if yes_no ~= "" and yes_no ~= "y" and yes_no ~= "Y" then
      --end
	    vim.notify(hits .. " lines with trailing double spaces found", "warn")
    end
  end,
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
