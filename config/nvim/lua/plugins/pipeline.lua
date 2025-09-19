return {
	"topaxi/pipeline.nvim",
	keys = {
		{ "<leader>ci", "<cmd>Pipeline<cr>", desc = "Open pipe" },
	},
	build = "make",
	--- @type pipeline.Config
	opts = {

		--- The browser executable path to open workflow runs/jobs in
		browser = nil,
		--- Interval to refresh in seconds
		refresh_interval = 10,
		--- How much workflow runs and jobs should be indented
		indent = 2,
		providers = {
			github = {},
			gitlab = {},
		},
		--- Allowed hosts to fetch data from, github.com is always allowed
		allowed_hosts = {},
		icons = {
			workflow_dispatch = "⚡️",
			conclusion = {
				success = "✓",
				failure = "X",
				startup_failure = "X",
				cancelled = "⊘",
				skipped = "◌",
			},
			status = {
				unknown = "?",
				pending = "○",
				queued = "○",
				requested = "○",
				waiting = "○",
				in_progress = "●",
			},
		},
		highlights = {
			PipelineRunIconSuccess = { link = "LspDiagnosticsVirtualTextHint" },
			PipelineRunIconFailure = { link = "LspDiagnosticsVirtualTextError" },
			PipelineRunIconStartup_failure = {
				link = "LspDiagnosticsVirtualTextError",
			},
			PipelineRunIconPending = {
				link = "LspDiagnosticsVirtualTextWarning",
			},
			PipelineRunIconRequested = {
				link = "LspDiagnosticsVirtualTextWarning",
			},
			PipelineRunIconWaiting = {
				link = "LspDiagnosticsVirtualTextWarning",
			},
			PipelineRunIconIn_progress = {
				link = "LspDiagnosticsVirtualTextWarning",
			},
			PipelineRunIconCancelled = { link = "Comment" },
			PipelineRunIconSkipped = { link = "Comment" },
			PipelineRunCancelled = { link = "Comment" },
			PipelineRunSkipped = { link = "Comment" },
			PipelineJobCancelled = { link = "Comment" },
			PipelineJobSkipped = { link = "Comment" },
			PipelineStepCancelled = { link = "Comment" },
			PipelineStepSkipped = { link = "Comment" },
		},
		split = {
			relative = "editor",
			position = "right",
			size = 60,
			win_options = {
				wrap = false,
				number = false,
				foldlevel = nil,
				foldcolumn = "0",
				cursorcolumn = false,
				signcolumn = "no",
			},
		},
	},
}
