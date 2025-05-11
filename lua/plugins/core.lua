-- Core Plugins

-- nvim-treesitter/nvim-treesitter
-- neovim/nvim-lspconfig

local diag_format = function(d)
  return string.format("(%s) %s", d.code, d.message)
end

return {
  -- For typescript, LazyVim also includes extra specs to properly setup lspconfig,
  -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
  { import = "lazyvim.plugins.extras.lang.typescript" },

  {
    "folke/which-key.nvim",
    opts = {
      preset = "modern"
    }
  },

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
        "toml",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },

  { "mason-org/mason.nvim", version = "^1.0.0" },
  { "mason-org/mason-lspconfig.nvim", version = "^1.0.0" },

  -- Format diagnostic message to display shellcheck error code [SCxxxx]
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = {
          format = diag_format,
        },
      },
    },
  },
}
