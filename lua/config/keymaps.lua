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
map("n", "<localleader>r", "<cmd>WipeRegs<cr>", { desc = "Wipe Registers" })
map("n", "<localleader>R", "<cmd>ClearShadaMarks<cr>", { desc = "Clear Shada Marks" })

-- Telescope
map("n", "<leader>;", "<cmd>Telescope grep_string<cr>", { desc = "Grep String under Cursor" })

-- Mini Starter
map("n", "<F5>", "<cmd>lua require('mini.starter').open()<cr>")
map("n", "<localleader>y", "<cmd>lua require('mini.starter').open()<cr>", { desc = "Dashboard" })

-- Colorschem Picker
map("n", "<F2>", ":ColorSchemePick<cr>")
map("n", "<localleader>c", ":ColorSchemePick<cr>", { desc = "Color Scheme Picker" })

-- Python JSON formatter
map("n", "<C-j>", ":%!python3 -m json.tool<cr>")

-- Markdown Preview
map("n", "<localleader>m", "<Plug>MarkdownPreviewToggle<cr>", { desc = "Markdown Preview" })

-- Dash
map("n", "<localleader>d", "<Plug>DashSearch<cr>", { desc = "Dash Search" })
map("n", "<localleader>D", "<Plug>DashGlobalSearch<cr>", { desc = "Dash Global Search" })
