return {
	"nvim-neo-tree/neo-tree.nvim",
	opts = {
		close_if_last_window = true,
		window = {
			position = "left",
			width = 30,
		},
		filesystem = {
			hijack_netrw = true, -- Take over netrw
			use_libuv_file_watcher = true, -- ✅ Auto-refresh files
			filtered_items = {
				visible = true,
				show_hidden_count = true,
				hide_dotfiles = false,
				hide_gitignored = false,
				hide_by_name = {
					-- '.git',
					-- '.DS_Store',
					-- 'thumbs.db',
					-- '.env',
				},
				never_show = {},
			},
			follow_current_file = { enabled = true },
			group_empty = true,
		},
	},
	config = function()
		-- ✅ Ensures Neo-tree opens properly when launching nvim with a directory
		if vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
			vim.cmd("Neotree toggle filesystem left")
		end
	end,
}
