return {
	-- Mason for LSP/DAP management
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = true,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "jdtls", "gopls" }, -- Java + Go LSP
			})
		end,
	},

	-- LSP configs
	{
		"neovim/nvim-lspconfig",
		dependencies = { "mason-lspconfig.nvim" },
		config = function()
			local lspconfig = require("lspconfig")

			-- Java LSP
			lspconfig.jdtls.setup({
				cmd = { "jdtls" },
				root_dir = lspconfig.util.root_pattern(
					".git",
					"pom.xml",
					"build.gradle"
				),
			})

			-- Go LSP
			lspconfig.gopls.setup({
				cmd = { "gopls" },
				settings = {
					gopls = {
						analyses = {
							unusedparams = true,
							nilness = true,
						},
						staticcheck = true,
					},
				},
				on_attach = function(client, bufnr)
					-- Keymaps for LSP
					local bufopts =
						{ noremap = true, silent = true, buffer = bufnr }
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
					vim.keymap.set(
						"n",
						"<leader>rn",
						vim.lsp.buf.rename,
						bufopts
					)
				end,
			})
		end,
	},

	-- Auto-completion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				mapping = cmp.mapping.preset.insert({
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete(),
				}),
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				},
			})
		end,
	},

	-- Formatter (goimports / gofmt)
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.goimports,
					null_ls.builtins.formatting.gofmt,
				},
			})

			-- Auto-format on save
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*.go",
				callback = function()
					vim.lsp.buf.format({ async = false })
				end,
			})
		end,
	},

	-- Go.nvim helper for test/run/generate
	{
		"ray-x/go.nvim",
		dependencies = { "ray-x/guihua.lua" },
		config = function()
			require("go").setup()
		end,
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()',
	},

	-- Debugging with Delve
	{
		"mfussenegger/nvim-dap",
		dependencies = { "rcarriga/nvim-dap-ui", "leoluz/nvim-dap-go" },
		config = function()
			require("dap-go").setup()
		end,
	},
}
