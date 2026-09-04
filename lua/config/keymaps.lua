-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>ct", function()
  require("vscode").load("dark")
end, { desc = "VSCode dark theme" })

vim.keymap.set("n", "<leader>cT", function()
  require("vscode").load("light")
end, { desc = "VSCode light theme" })
