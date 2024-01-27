-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Key mappings
vim.keymap.set("n", "<leader>raw", ":lua Run_CPP()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-t>", ":lua Past_Tests()<CR>", { noremap = true, silent = true })
