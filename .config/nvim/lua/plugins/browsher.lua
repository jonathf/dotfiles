return {
	"claydugo/browsher.nvim",
	event = "VeryLazy",
	config = function()
		require("browsher").setup({
			default_pin = "branch",
			open_cmd = "firefox",
		})
	end,
}
