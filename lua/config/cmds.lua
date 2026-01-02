-- Commands Plugin

local C = {}

-- Make current buffer executable (Shell)
function C.chmod(mode)
  vim.cmd("w!")
  vim.fn.jobstart("chmod " .. mode .. " " .. vim.api.nvim_buf_get_name(0))
end

return C
