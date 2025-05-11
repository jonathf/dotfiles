return {
	"echasnovski/mini.nvim",
	event = "VeryLazy",
	config = function()
		require("mini.ai").setup({})
		require("mini.basics").setup({
			options = {
				basics = false,
			},
			mappings = {
				basics = false,
			},
			autocommands = {
				basic = false,
			},
		})
		require("mini.bracketed").setup({
			buffer = { suffix = "", options = {} },
			comment = { suffix = "", options = {} },
			conflict = { suffix = "", options = {} },
			diagnostic = { suffix = "", options = {} },
			file = { suffix = "", options = {} },
			indent = { suffix = "", options = {} },
			jump = { suffix = "", options = {} },
			location = { suffix = "", options = {} },
			oldfile = { suffix = "", options = {} },
			quickfix = { suffix = "", options = {} },
			treesitter = { suffix = "", options = {} },
			undo = { suffix = "", options = {} },
			window = { suffix = "", options = {} },
			yank = { suffix = "", options = {} },
		})
		require("mini.operators").setup({})
		require("mini.comment").setup({
			mappings = {
				comment = "-",
				comment_line = "--",
				comment_visual = "-",
				textobject = "-",
			},
		})
	end,
}
