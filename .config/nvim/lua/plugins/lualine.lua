return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      -- Add a custom emoji to the right side (lualine_x section)
      table.insert(opts.sections.lualine_x, "😄")

      -- Customize other lualine options as needed
      opts.theme = "onedark" -- Change the theme
      opts.component_separators = { "", "" } -- Customize component separators
      opts.colors = {
        normal = { fg = "#FFFFFF", bg = "#FFFFFF" },
        insert = { fg = "#000000", bg = "#00FF00" },
        visual = { fg = "#FFFFFF", bg = "#FFA500" },
        replace = { fg = "#000000", bg = "#FF0000" },
        command = { fg = "#FFFFFF", bg = "#000080" },
        inactive = { fg = "#808080", bg = "#1E1E1E" },
      }

      return opts
    end,
  },
}
