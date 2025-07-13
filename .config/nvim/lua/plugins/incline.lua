return {
	"b0o/incline.nvim",
	event = "VeryLazy",
	config = function()
		require("incline").setup({
			window = {
				padding = 0,
				margin = {
					vertical = 2,
					horizontal = 0,
				},
			},
			render = function(props)
				local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
				if filename == "" then
					filename = "?"
				end
				local color
				if vim.bo[props.buf].modified then
					color = "#f0c674"
				end
				if vim.api.nvim_get_current_buf() == props.buf then
					local mode = vim.api.nvim_get_mode()["mode"]
					local colors = {
						-- n = { " " .. filename .. " ", guibg = color },
						n = { "" },
						i = { " I ", guibg = "#98bb6c" },
						v = { " V ", guibg = "#8992a7" },
						V = { " L ", guibg = "#8992a7" },
						[""] = { " B ", guibg = "#8992a7" },
						c = { " C ", guibg = "#c4746e" },
						R = { " R ", guibg = "#b6927b" },
					}
					return colors[mode] or { mode }
				else
					return { " " .. filename .. " ", guibg = "#737c73" }
				end
			end,
			highlight = {
				groups = {
					InclineNormal = {
						default = true,
						group = "MiniStatuslineModeNormal",
					},
					InclineNormalNC = {
						default = true,
						group = "MiniStatuslineModeNormal",
					},
				},
			},
		})
	end,
}
