return {
	{ "cespare/vim-toml", ft = "toml" },
	{ "jonathf/vim-fish", ft = "fish" },
	{ "euclidianAce/BetterLua.vim", ft = "lua" },
	{ "zorab47/vim-gams", ft = "gams" },
	{ "Vimjas/vim-python-pep8-indent", ft = "python" },
	{ "nmac427/guess-indent.nvim", opts = {}, ft = "python" },
	{ "benoror/gpg.nvim" },
	{ "Glench/Vim-Jinja2-Syntax", ft = "html" },
	{ "hashivim/vim-terraform", ft = "terraform" },
	{
		"GCBallesteros/jupytext.nvim",
		ft = { "ipynb" },
		lazy = false,
		config = function()
			require("jupytext").setup({
				style = "hydrogen",
				output_extension = "auto", -- Default extension. Don't change unless you know what you are doing
				force_ft = nil, -- Default filetype. Don't change unless you know what you are doing
				custom_language_formatting = {
					-- python = {
					-- 	-- extension = "py",
					-- 	-- style = "sphinx",
					-- 	-- force_ft = "sphinx", -- you can set whatever filetype you want here
					-- },
				},
			})
		end,
	},
	-- {
	-- 	"chrisbra/csv.vim",
	-- 	ft = "csv",
	-- 	config = function()
	-- 		vim.g.csv_no_conceal = 1
	-- 		vim.g.csv_nl = 1
	-- 		vim.g.csv_highlight_column = "y"
	-- 	end,
	-- },
	{
		"hat0uma/csvview.nvim",
		lazy = true,
		ft = { "csv" },
		config = function()
			local csvview = require("csvview")
			csvview.setup({
				view = {
					spacing = 1,
				},
			})
			csvview.enable()
		end,
	},
	-- {
	-- 	"emmanueltouzery/decisive.nvim",
	-- 	config = function()
	-- 		require("decisive").setup({})
	-- 	end,
	-- 	keys = {
	-- 		{
	-- 			"<leader>=",
	-- 			":lua require('decisive').align_csv({})<cr>",
	-- 			{ silent = true },
	-- 			desc = "Align CSV",
	-- 			mode = "n",
	-- 		},
	-- 		{
	-- 			"[c",
	-- 			":lua require('decisive').align_csv_prev_col()<cr>",
	-- 			{ silent = true },
	-- 			desc = "Align CSV prev col",
	-- 			mode = "n",
	-- 		},
	-- 		{
	-- 			"]c",
	-- 			":lua require('decisive').align_csv_next_col()<cr>",
	-- 			{ silent = true },
	-- 			desc = "Align CSV next col",
	-- 			mode = "n",
	-- 		},
	-- 	},
	-- },
	{
		"stevearc/oil.nvim",
		opts = {
			win_options = { signcolumn = "auto:2" },
			git = {
				mv = function()
					return true
				end,
				rm = function()
					return true
				end,
			},
		},
		ft = { "unix" },
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"refractalize/oil-git-status.nvim",
		dependencies = { "stevearc/oil.nvim" },
		event = { "BufReadPre", "BufNewFile" },
		ft = { "unix" },
		config = true,
	},
	-- {
	-- 	"xb-bx/editable-term.nvim",
	-- 	config = true,
	-- 	opts = {},
	-- },
}
