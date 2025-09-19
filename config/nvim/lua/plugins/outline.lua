return {
	"hedyhli/outline.nvim",
	config = function()
		-- Example mapping to toggle outline
		vim.keymap.set(
			"n",
			"<leader>o",
			"<cmd>Outline<CR>",
			{ desc = "Toggle Outline" }
		)

		require("outline").setup({
			outline_window = {
				width = 25,
				show_numbers = true,
				show_relative_numbers = true,
			},
		})
	end,
}
