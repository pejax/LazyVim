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
-- Same for Flash
vim.keymap.del("", "s")
vim.keymap.del("", "S")
vim.keymap.del("", "r")
vim.keymap.del("", "R")

-- Telescope
map("n", "<leader>?", "<cmd>Telescope help_tags<cr>", { desc = "Help Pages" })
map("n", "<leader>;", "<cmd>Telescope grep_string<cr>", { desc = "Grep String under Cursor" })

-- Wipe registers
map("n", "<localleader>w", "<cmd>WipeRegs<cr>", { desc = "Wipe Registers" })
map("n", "<localleader>W", "<cmd>delmarks!<cr>", { desc = "Wipe Shada Marks" })
map("n", "<localleader>r", ":reg<cr>", { desc = "Registers" })

-- Mini Starter
map("n", "<F5>", "<cmd>lua require('mini.starter').open()<cr>")
map("n", "<localleader>y", "<cmd>lua require('mini.starter').open()<cr>", { desc = "Dashboard" })

-- Python JSON Formatter
map("n", "<localleader>j", ":%!python3 -m json.tool<cr>", { desc = "Format JSON" })

-- Markdown Preview
map("n", "<localleader>m", "<Plug>MarkdownPreviewToggle<cr>", { desc = "Markdown Preview" })

--Flash
map("n", "<localleader>s", "<cmd>lua require('flash').jump()<cr>", { desc = "Flash" })
map("n", "<localleader>S", "<cmd>lua require('flash').treesitter()<cr>", { desc = "Flash Treesitter" })

-- Dash
map("n", "<localleader>d", "<Plug>DashSearch<cr>", { desc = "Dash Search" })
map("n", "<localleader>D", "<Plug>DashGlobalSearch<cr>", { desc = "Dash Global Search" })

-- Colorscheme Persist
map("n", "<leader>up", ":ColorSchemePersist<cr>", { desc = "Persist Colorscheme" })

-- Editor macros, Launch Apps
local wk = require("which-key")
wk.add({
  {
    { "<localleader>a", group = "apps" },
    { "<localleader>ac", "<cmd> lua require('config.apps').colorpicker()<cr>", desc = "Color Picker" },
    { "<localleader>ad", "<cmd> lua require('config.apps').git_difftool()<cr>", desc = "Git Difftool" },
    { "<localleader>am", "<cmd> lua require('config.apps').sublime_merge()<cr>", desc = "Sublime Merge" },
    { "<localleader>at", "<cmd> lua require('config.apps').sublime_text()<cr>", desc = "Sublime Text" },
    { "<localleader>e", group = "editor" },
    { "<localleader>ec", ":'a,'b co .<cr>", desc = "Copy Range a-b" },
    { "<localleader>em", ":'a,'b m .<cr>", desc = "Move Range a-b" },
    { "<localleader>er", ":'a,'b s//gI<left><left><left>", desc = "Replace Range a-b" },
    { "<localleader>es", ":%s//gI<left><left><left>", desc = "Replace globally" },
  },
})

-- Read Shell Template with optargs
map("n", "<localleader>t", ":0r ${DOTFILES}/shell/template.sh<cr>:set filetype=sh<cr>", { desc = "Shell Template" })
