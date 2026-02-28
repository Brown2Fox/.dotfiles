return  {
  "snacks.nvim",
  opts = {
    dashboard = {
      sections = {
        { section = "header" },
        { icon = " ", key = "c", desc = "Config", indent = 2, padding = 2,
          action = function ()
            require('telescope.builtin').find_files({ cwd = vim.fn.stdpath('config') });
          end
        },
        -- { section = "keys", gap = 1 },
        { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 2 },
        { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 2 },
        { section = "startup" },
      },
    }
  },
  keys = {
    {
      "<leader>od",
      function ()
        require("snacks").dashboard.open()
      end,
      desc = "Open dashboard"
    },
  }
}
