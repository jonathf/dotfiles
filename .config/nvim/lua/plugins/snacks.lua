return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		git = { enabled = true },
		words = { enabled = true },
		zen = {
			enabled = true,
			zoom = {
				toggles = {},
				show = {
					statusline = true,
					tabline = true,
				},
				win = {
					backdrop = false,
					width = 0, -- full width
				},
			},
		},
		styles = {
			zoom_indicator = {
				text = "                                                                zoom                                                                        ",
			},
		},
	},
}
