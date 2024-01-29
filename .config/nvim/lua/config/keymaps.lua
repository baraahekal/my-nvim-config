-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
vim.keymap.set(
  "n",
  "<leader>sx",
  require("telescope.builtin").resume,
  { noremap = true, silent = true, desc = "Resume" }
)

-- for selecting all file
vim.api.nvim_set_keymap("n", "Y", ":normal ggVG<CR>", { noremap = true, silent = true })

-- for window resizing
vim.api.nvim_set_keymap("n", "<c-]>", ":resize +1<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<c-[>", ":resize -1<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<c-]>", ":vertical resize +1<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-[>", ":vertical resize -1<CR>", { noremap = true, silent = true })
