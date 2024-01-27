return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
    -- require("notify").setup({
    --   background_colour = "#000000",
    -- }),
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" }),
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" }),
  },
}
