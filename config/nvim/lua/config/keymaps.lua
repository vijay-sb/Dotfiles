-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Snacks = require("snacks") -- Ensure Snacks is correctly required

vim.keymap.set("n", "<C-/>", function()
	Snacks.terminal(nil, { border = "rounded" }) -- Replace Util.terminal with Snacks.terminal
end, { desc = "Terminal (door dir )" })
