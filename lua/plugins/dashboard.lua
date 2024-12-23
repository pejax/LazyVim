return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        keys = {
          -- Dotfiles
          { icon = " ", key = "a", desc = ".aliases", action = ":e $HOME/.aliases" },
          { icon = " ", key = "e", desc = ".environment", action = ":e $HOME/.environment" },
          { icon = " ", key = "n", desc = ".navigation", action = ":e $HOME/.navigation" },
          { icon = " ", key = "N", desc = "New file", action = ":ene | startinsert" },
          -- LazyVim
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          -- LazyVim configuration
          {
            icon = " ",
            key = "c",
            desc = "Config",
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          },
          -- Search
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "/", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          -- Other
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
        -- Used by the `header` section
        header = [[
██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗
██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║
██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║
██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║
███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝]],
      },
    },
  },
}
