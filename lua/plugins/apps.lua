-- Apps Plugin

local M = {}

function M.git_difftool()
  if string.match(os.getenv("OSTYPE"), "darwin") then
    difftool_cmd = "git difftool"
  else
    difftool_cmd = "git difftool -d"
  end
  vim.fn.jobstart(difftool_cmd)
end

function M.sublime_text()
  subl_cmd = "subl " .. vim.api.nvim_buf_get_name(0)
  vim.fn.jobstart(subl_cmd)
end

function M.sublime_merge()
  vim.fn.jobstart("smerge")
end

function M.colorpicker()
  vim.fn.jobstart("colorpicker")
end

return M
