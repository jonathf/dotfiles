return {
	"mfussenegger/nvim-dap-python",
	dependencies = {
		"mfussenegger/nvim-dap",
	},
	config = function()
		local dappy = require("dap-python")
		dappy.setup("uv")
		dappy.test_runner = "pytest"
	end,
}
