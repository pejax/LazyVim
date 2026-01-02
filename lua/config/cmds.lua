-- Commands Plugin

local C = {}

function C.chmod()
  vim.cmd("w!")
  vim.fn.jobstart("chmod +x " .. vim.api.nvim_buf_get_name(0))
end

return C
