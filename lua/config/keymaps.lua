-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("n", "<C-j>", ":%!python3 -m json.tool<cr>")
map("n", "<leader>m", "<Plug>MarkdownPreviewToggle<cr>", { desc = "Markdown Preview" })

-- What a stupid idea to map core neovim keys
vim.keymap.del("", "<S-h>")
vim.keymap.del("", "<S-l>")
-- Leap
vim.keymap.del("", "<s>")
vim.keymap.del("", "<S-s>")
vim.keymap.del("", "<x>")
vim.keymap.del("", "<S-x>")
