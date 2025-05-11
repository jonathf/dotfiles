return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	-- tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	{
		"ANGkeith/telescope-terraform-doc.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("telescope").load_extension("terraform_doc")
		end,
	},
}
