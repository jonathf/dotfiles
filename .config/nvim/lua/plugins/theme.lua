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
					NotifyTRACEBody = { bg = #223249 },
					NotifyINFOBody = { bg = #223249 },
					NotifyDEBUGBody = { bg = #223249 },
					NotifyWARNBody = { bg = #223249 },
					NotifyERRORBody = { bg = #223249 },
				}
			end,
		})
		kanagawa.load("dragon")
		vim.cmd([[hi NotifyTRACEBody guibg=#223249 ]])
		vim.cmd([[hi NotifyINFOBody guibg=#223249 ]])
		vim.cmd([[hi NotifyDEBUGBody guibg=#223249 ]])
		vim.cmd([[hi NotifyWARNBody guibg=#223249 ]])
		vim.cmd([[hi NotifyERRORBody guibg=#223249 ]])
		vim.cmd([[hi NonText guifg=#333333 ]])
		vim.cmd([[hi Whitespace guifg=#333333 ]])
	end,
	lazy = false,
}
