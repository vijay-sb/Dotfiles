-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.colorcolumn = "80"
vim.cmd([[highlight ColorColumn ctermbg=0 guibg=Yellow]])

local opt = vim.opt

opt.wrap = true
