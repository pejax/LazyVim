-- Core Plugins

-- "echasnovski/mini.starter (Mini Starter)
-- "nvim-treesitter/nvim-treesitter" (Treesitter)

return {
  -- Use mini.starter instead of alpha
  { import = "lazyvim.plugins.extras.ui.mini-starter" },
  {
    "echasnovski/mini.starter",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = "VimEnter",
    opts = function()
      local logo = table.concat({
        "██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z",
        "██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z",
        "██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z",
        "██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z",
        "███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║",
        "╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝",
      }, "\n")
      local pad = string.rep(" ", 22)
      local new_section = function(name, action, section)
        return { name = name, action = action, section = pad .. section }
      end

      local starter = require("mini.starter")
      --stylua: ignore
      local config = {
        evaluate_single = true,
        header = logo,
        items = {
          new_section("aliases",      "e $HOME/.aliases",     "Dotfiles"),
          new_section("environment",  "e $HOME/.environment", "Dotfiles"),
          new_section("functions",    "e $HOME/.functions",   "Dotfiles"),
          new_section("motd",         "e $HOME/.motd",        "Dotfiles"),
          new_section("projects",     "e $HOME/.projects",        "Dotfiles"),
          new_section("shellrc",      "e $HOME/.shellrc",     "Dotfiles"),
          new_section("vimrc",        "e $HOME/.vimrc",       "Dotfiles"),
          new_section("zshrc",        "e $HOME/.zshrc",       "Dotfiles"),
          new_section("Recent files", "Telescope oldfiles",   "Telescope"),
          new_section("Grep text",    "Telescope live_grep",  "Telescope"),
          new_section("Lazy",         "Lazy",                 "Config"),
          new_section("init.lua",     "e $MYVIMRC",           "Config"),
          new_section("New file",     "ene | startinsert",    "Built-in"),
          new_section("Quit",         "qa",                   "Built-in"),
        },
        content_hooks = {
          starter.gen_hook.adding_bullet(pad .. "░ ", false),
          starter.gen_hook.aligning("center", "center"),
        },
      }
      return config
    end,
  },

  -- For typescript, LazyVim also includes extra specs to properly setup lspconfig,
  -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
  { import = "lazyvim.plugins.extras.lang.typescript" },

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "java",
        "javascript",
        "json",
        "kotlin",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "scala",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },
}
