return {
	"rebelot/kanagawa.nvim",
	config = function()
		local kanagawa = require("kanagawa")
		kanagawa.setup({
			compile = true,
			undercurl = false,
			commentStyle = { italic = true },
			keywordStyle = { italic = false },
			statementStyle = { bold = false },
			transparent = true,
			dimInactive = false,
			terminalColors = false,
			overrides = function(colors)
				return {
					TermCursor = { bg = colors.theme.ui.fg },
				}
			end,
		})
		kanagawa.load("dragon")
	end,
	lazy = false,
}
