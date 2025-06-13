return {
	"lewis6991/gitsigns.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"purarue/gitsigns-yadm.nvim",
			opts = {
				shell_timeout_ms = 1000,
			},
		},
	},
	opts = {
		_on_attach_pre = function(_, callback)
			require("gitsigns-yadm").yadm_signs(callback)
		end,
		on_attach = function(bufnr)
			if vim.api.nvim_buf_get_name(bufnr):match("%.ipynb$") then
				return false -- because jupytext.nvim
			end
		end,
		signs = {
			add = { text = "" },
			change = { text = "" },
			delete = { text = "" },
			topdelete = { text = "" },
			changedelete = { text = "" },
			untracked = { text = "" },
		},
		signs_staged = {
			add = { text = "" },
			change = { text = "" },
			delete = { text = "" },
			topdelete = { text = "" },
			changedelete = { text = "" },
			untracked = { text = "" },
		},
		numhl = true,
	},
}
