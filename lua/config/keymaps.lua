-----------------------------------------------------------
--  _
-- | | __ ___  _   _  _ __ ___    __ _  _ __   ___
-- | |/ // _ \| | | || '_ ` _ \  / _` || '_ \ / __|
-- |   <|  __/| |_| || | | | | || (_| || |_) |\__ \
-- |_|\_\\___| \__, ||_| |_| |_| \__,_|| .__/ |___/
--             |___/                   |_|
--
-----------------------------------------------------------

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

-- What a stupid idea to map core neovim motion keys
vim.keymap.del("", "<S-h>")
vim.keymap.del("", "<S-l>")

-- Wipe registers
map("n", "<leader>r", "<cmd>WipeRegs<cr>", { desc = "Wipe Registers" })
map("n", "<leader>R", "<cmd>ClearShadaMarks<cr>", { desc = "Clear shada marks" })

-- Mini Starter
map("n", "<F5>", "<cmd>lua require('mini.starter').open()<cr>")
map("n", "<leader>y", "<cmd>lua require('mini.starter').open()<cr>", { desc = "Mini Starter" })

-- Colorschem Picker
map("n", "<F2>", ":ColorSchemePick<cr>")

-- Python JSON formatter
map("n", "<C-j>", ":%!python3 -m json.tool<cr>")

-- Markdown Preview
map("n", "<leader>m", "<Plug>MarkdownPreviewToggle<cr>", { desc = "Markdown Preview" })

-- Dash
map("n", "<leader>d", "<Plug>DashSearch<cr>", { desc = "Dash search" })
map("n", "<leader>D", "<Plug>DashGlobalSearch<cr>", { desc = "Dash global search" })
