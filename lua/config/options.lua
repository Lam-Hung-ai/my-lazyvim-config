require("config.remote_clipboard").setup()
-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.relativenumber = false
vim.opt.scrolloff = 999
vim.g.lazyvim_ts_lsp = "vtsls"
vim.g.lazyvim_eslint_auto_format = true
vim.g.lazyvim_python_lsp = "pyrefly"
vim.g.lazyvim_python_ruff = "ruff"
