-- Helper function

vim.api.nvim_create_augroup("U", {})
local function autocmd(args)
	event = args.event
	args["event"] = nil
	if not args.group then
		args["group"] = "U"
	end
	vim.api.nvim_create_autocmd(event, args)
end

-- Close command window with escape

autocmd({
	event = "CmdwinEnter",
	callback = function()
		vim.keymap.set("n", "<esc>", ":q<cr>", { buffer = true })
	end,
})

-- -- Relative and absolute numbering
--
-- autocmd{
--   event = {"BufEnter", "FocusGained", "InsertLeave", "WinEnter", "CmdlineLeave"},
--   callback = function()
--     vim.o.number = true
--     vim.o.relativenumber = true
--   end,
-- }
-- autocmd{
--   event = {"BufLeave", "FocusLost", "InsertEnter", "WinLeave", "CmdlineEnter"},
--   callback = function() vim.o.relativenumber = false end,
-- }

-- Remember the last cursor position in the document

autocmd({
	event = "BufReadPost",
	callback = function()
		local cursor = vim.api.nvim_buf_get_mark(0, '"')
		if cursor[1] > 0 and cursor[1] <= vim.api.nvim_buf_line_count(0) then
			vim.api.nvim_win_set_cursor(0, cursor)
		end
	end,
})

local cursorPreYank

vim.keymap.set({ "n", "x" }, "y", function()
	cursorPreYank = vim.api.nvim_win_get_cursor(0)
	return "y"
end, { expr = true })

vim.keymap.set("n", "Y", function()
	cursorPreYank = vim.api.nvim_win_get_cursor(0)
	return "y$"
end, { expr = true })

autocmd({
	event = "TextYankPost",
	callback = function()
		if vim.v.event.operator == "y" and cursorPreYank then
			vim.api.nvim_win_set_cursor(0, cursorPreYank)
		end
	end,
})

autocmd({
	event = "TextYankPost",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 160,
		})
	end,
})

-- Quick exit terminal windows if the the process is dead

autocmd({
	event = "TermClose",
	command = "if !v:event.status | exe 'bdelete! '..expand('<abuf>') | endif",
})

-- Disable Lsp formatting on attach

autocmd({
	event = "LspAttach",
	pattern = "*.py",
	callback = function(event)
		vim.bo[event.buf].formatexpr = nil
	end,
})

autocmd({
	event = { "BufRead", "BufNewFile" },
	pattern = ".gitlab*",
	callback = function()
		vim.bo.filetype = "yaml.gitlab"
	end,
})

autocmd({
	event = { "BufRead", "BufNewFile" },
	pattern = "*/helm/templates/*.yaml",
	callback = function()
		vim.bo.filetype = "helm.yaml"
	end,
})

-- Auto resize splits when the terminal's window is resized
autocmd({
	event = "VimResized",
	command = "wincmd =",
})
