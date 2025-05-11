return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		ensure_installed = "all",
		sync_install = false,
		indent = { enable = false },
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
			custom_captures = {
				headline = "Headline",
				dash = "Dash",
				codeblock = "Codeblock",
				quote = "Quote",
			},
		},
	},
	config = function(plugin, opts)
		if plugin.ensure_installed then
			require("lazyvim.util").deprecate("treesitter.ensure_installed", "treesitter.opts.ensure_installed")
		end
		require("nvim-treesitter.configs").setup(opts)
	end,
}
