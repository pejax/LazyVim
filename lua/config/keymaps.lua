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

-- Disable builtin colorscheme picker
--vim.keymap.del("", "<leader>uC")

map("n", "<leader>?", "<cmd>Telescope help_tags<cr>", { desc = "Help Pages" })

-- Wipe registers
map("n", "<localleader>w", "<cmd>WipeRegs<cr>", { desc = "Wipe Registers" })
map("n", "<localleader>W", "<cmd>ClearShadaMarks<cr>", { desc = "Wipe Shada Marks" })
map("n", "<localleader>r", ":reg<cr>", { desc = "Registers" })

-- Telescope
map("n", "<leader>;", "<cmd>Telescope grep_string<cr>", { desc = "Grep String under Cursor" })

-- Mini Starter
map("n", "<F5>", "<cmd>lua require('mini.starter').open()<cr>")
map("n", "<localleader>y", "<cmd>lua require('mini.starter').open()<cr>", { desc = "Dashboard" })

-- Colorschem Picker
map("n", "<F2>", ":ColorSchemePick<cr>")
map("n", "<localleader>c", ":ColorSchemePick<cr>", { desc = "Color Scheme Picker" })

-- Python JSON Formatter
map("n", "<localleader>j", ":%!python3 -m json.tool<cr>", { desc = "Format JSON" })

-- Markdown Preview
map("n", "<localleader>m", "<Plug>MarkdownPreviewToggle<cr>", { desc = "Markdown Preview" })

-- Dash
map("n", "<localleader>d", "<Plug>DashSearch<cr>", { desc = "Dash Search" })
map("n", "<localleader>D", "<Plug>DashGlobalSearch<cr>", { desc = "Dash Global Search" })

-- Launch Apps
local wk = require("which-key")
wk.register({
  a = {
    name = "apps",
    c = { "<cmd> lua require('config.apps').colorpicker()<cr>", "Color Picker" },
    d = { "<cmd> lua require('config.apps').git_difftool()<cr>", "Git Difftool" },
    m = { "<cmd> lua require('config.apps').sublime_merge()<cr>", "Sublime Merge" },
    t = { "<cmd> lua require('config.apps').sublime_text()<cr>", "Sublime Text" },
  },
}, { prefix = "<localleader>" })
