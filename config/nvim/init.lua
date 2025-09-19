require("config.lazy")

vim.opt.fillchars = { eob = "~" }
vim.opt.cursorline = false

function Transparent(color)
	color = color or "gruvbox"
	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

Transparent()
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.java",
	callback = function()
		vim.cmd("silent! !java -jar ~/.local/bin/google-java-format.jar -i %")
	end,
})
