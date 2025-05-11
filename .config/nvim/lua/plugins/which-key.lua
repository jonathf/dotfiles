local term = require("term")

local function telescope(caller)
	return function()
		local builtin = require("telescope.builtin")
		if caller == "live_grep" then
			builtin.live_grep({ search_dir = Snacks.git.get_root() })
		elseif caller == "in_file_grep" then
			builtin.live_grep({ search_dirs = { vim.fn.expand("%:p") } })
		elseif caller == "find_files" then
			builtin.find_files({ search_dir = Snacks.git.get_root() })
		elseif caller == "buffers" then
			builtin.buffers({ select_current = true, sorting_strategy = "ascending" })
		elseif caller == "commands" then
			builtin.commands()
		elseif caller == "lsp_references" then
			builtin.lsp_references()
		end
	end
end

local function bracketed(caller, direction)
	return function()
		require("mini.bracketed")[caller](direction)
	end
end

local function gitsigns_nav_hunk(arg)
	return function()
		require("gitsigns").nav_hunk(arg)
	end
end

local function textcase_operator(arg)
	return function()
		require("textcase").operator(arg)
	end
end
return {
	"folke/which-key.nvim",
	-- keys = {
	-- 	{ "<space>" },
	-- 	{ "[" },
	-- 	{ "]" },
	-- 	{ "_" },
	-- 	{ "<left>" },
	-- 	{ "<right>" },
	-- 	{ "<up>" },
	-- 	{ "<down>" },
	-- 	{ "<esc>" },
	-- 	{ "s" },
	-- },
	opts = {
		-- preset = "helix",
		delay = function(ctx)
			return ctx.plugin and 0 or 800
		end,
		icons = {
			breadcrumb = "»",
			separator = "",
			group = "+",
			ellipsis = "…",
			rules = false,
			colors = true,
			keys = {
				Up = "↑",
				Down = "↓",
				Left = "←",
				Right = "→",
				C = "c",
				M = "m",
				D = "d",
				S = "s",
				CR = "␤",
				Esc = "␛",
				BS = "␈",
				Space = "␠",
				Tab = "⇥",
			},
		},
		spec = {
			{
				mode = { "v" },
				{ "f", ":'<,'>Browsher commit<CR>gv", noremap = true, silent = true },
			},
			{
				{ "go", "v:lua.MiniBasics.put_empty_line(v:false)", expr = true, desc = "add line below" },
				{ "gO", "v:lua.MiniBasics.put_empty_line(v:true)", expr = true, desc = "add line above" },
			},
			{ "s", ":silent! write<cr>", desc = "save" },
			{
				{ "<down>", ":wincmd j<cr>", desc = "win down" },
				{
					"<esc>",
					":normal '\\<esc\\>'<cr>:silent! nohls<cr>:silent! exec ':cd '.fnamemodify(expand('%'), ':h')<cr>",
					desc = "esc",
				},
				{ "<left>", ":wincmd h<cr>", desc = "win left" },
				{ "<right>", ":wincmd l<cr>", desc = "win right" },
				{ "<up>", ":wincmd k<cr>", desc = "win up" },
			},
			{
				{ "<space>", group = "quick" },
				-- { "<space>[", vim.lsp.buf.references, desc = "references" },
				-- { "<space>]", vim.lsp.buf.definition, desc = "definition" },
				{ "<space>a", vim.lsp.buf.code_action, desc = "code actions" },
				{ "<space>b", require("gitsigns").blame_line, desc = "blame-line" },
				-- { "<space>c", ':lua require"snacks.dashboard"()<cr>', desc = "dashboard" },
				{ "<space>d", ":x<cr>", desc = "close" },
				{ "<space>D", term.close(nil, "current"), hidden = true },
				{ "<space>f", require("conform").format, desc = "format" },
				-- { "<space>F", "<cmd>Browsher commit<cr>", desc = "Open in Git{lab,hub}" },
				-- {"<space>F", ":w<cr>:!pyment --write --output google %<cr>", desc = "pyment"},
				{ "<space>g", telescope("live_grep"), desc = "grep" },
				{ "<space>G", telescope("in_file_grep"), hidden = true },
				{ "<space>i", term.insert(), desc = "insert-repl" },
				{ "<space>i", term.open(), hidden = true },
				{ "<space>k", vim.lsp.buf.signature_help, desc = "signature" },
				{ "<space>K", vim.diagnostic.open_float, hidden = true },
				{ "<space>l", term.exec_current_line(nil, false), desc = "exec line" },
				{ "<space>L", term.exec_current_line(nil, true), hidden = true },
				{ "<space>o", term.insert("fish"), desc = "term" },
				{ "<space>O", term.open("fish"), hidden = true },
				-- { "<space>r", ":IncRename ", desc = "inc-rename" },
				{ "<space>q", telescope("lsp_references"), desc = "lsp refs" },
				{ "<space>s", ":setlocal spell!<cr>", desc = "spell" },
				{ "<space>t", term.exec_test("fish", false), desc = "test" },
				{
					"<space>T",
					function()
						local ts = require("ts")
						term.run("fish", "pytest -vvv --doctest-modules " .. vim.fn.expand("%:p") .. "::" .. ts.func())
					end,
					hidden = true,
				},
				{ "<space>v", ":vsplit<cr>", desc = "vsplit" },
				{ "<space>V", ":vsplit<cr><c-w><c-w>", hidden = true },
				{ "<space>w", ":write<cr>", desc = "save" },
				{ "<space>x", term.exec_file(nil, false), desc = "execute" },
				{ "<space>X", term.exec_file(nil, true), hidden = true },
				{
					"<space>z",
					function()
						Snacks.zen.zoom()
					end,
					desc = "zoom",
				},
				{ "<space>.", telescope("buffers"), desc = "buffers" },
				{ "<space>:", telescope("commands"), desc = "commands" },
			},
			{
				{ "]", group = "next" },
				{ "]b", bracketed("buffer", "forward"), desc = "buffer" },
				{ "]B", bracketed("buffer", "last"), hidden = true },
				{ "]-", bracketed("comment", "forward"), desc = "comment" },
				{ "]x", bracketed("conflict", "forward"), desc = "git conflict" },
				{ "]X", bracketed("conflict", "last"), hidden = true },
				{ "]d", bracketed("diagnostic", "forward"), desc = "lsp diagnostic" },
				{ "]D", bracketed("diagnostic", "last"), hidden = true },
				{ "]q", bracketed("quickfix", "forward"), desc = "quickfix" },
				{ "]Q", bracketed("quickfix", "last"), hidden = true },
				-- { "]c", ":cnext<cr>", desc = "error" },
				{ "]f", "<c-]>", desc = "file" },
				{ "]F", ":vsplit<cr><c-]>", desc = "file", hidden = true },
				{ "]g", gitsigns_nav_hunk("next"), desc = "hunk" },
				-- { "]l", vim.diagnostic.goto_next, desc = "lsp-error" },
				{ "]s", "]s", desc = "spell" },
				{
					"]w",
					function()
						Snacks.words.jump(math.max(vim.v.count, 1))
					end,
					desc = "word",
				},
			},
			{
				{ "[", group = "previous" },
				{ "[b", bracketed("buffer", "backward"), desc = "buffer" },
				{ "[B", bracketed("buffer", "first"), hidden = true },
				{ "[-", bracketed("comment", "backward"), desc = "comment" },
				{ "[x", bracketed("conflict", "backward"), desc = "git conflict" },
				{ "[X", bracketed("conflict", "first"), hidden = true },
				{ "[d", bracketed("diagnostic", "backward"), desc = "lsp diagnostic" },
				{ "[D", bracketed("diagnostic", "first"), hidden = true },
				{ "[q", bracketed("quickfix", "backward"), desc = "quickfix" },
				{ "[Q", bracketed("quickfix", "first"), hidden = true },
				-- { "[b", ":bprev<cr>", desc = "buffer" },
				-- { "[c", ":cprev<cr>", desc = "error" },
				{ "[f", "<c-o>", desc = "file" },
				{ "[F", ":vsplit<cr><c-o>", desc = "file", hidden = true },
				{ "[g", gitsigns_nav_hunk("prev"), desc = "hunk" },
				-- { "[l", vim.diagnostic.goto_prev, desc = "lsp-error" },
				{ "[s", "[s", desc = "spell" },
				{
					"[w",
					function()
						Snacks.words.jump(-math.max(vim.v.count, 1))
					end,
					desc = "word",
				},
			},
			{
				mode = { "n", "v" },
				{ "_", group = "textcase" },
				{ "_C", textcase_operator("to_constant_case"), desc = "CONSTANT_CASE" },
				{ "_d", textcase_operator("to_dot_case"), desc = "dot.case" },
				{ "_p", textcase_operator("to_pascal_case"), desc = "PascalCase" },
				{ "_P", textcase_operator("to_path_case"), desc = "path/case" },
				{ "_S", textcase_operator("to_phrase_case"), desc = "Sentence case" },
				{ "_c", textcase_operator("to_camel_case"), desc = "camelCase" },
				{ "_l", textcase_operator("to_lower_case"), desc = "lower case" },
				{ "_D", textcase_operator("to_dash_case"), desc = "dash-case" },
				{ "_s", textcase_operator("to_snake_case"), desc = "snake_case" },
				{ "_t", textcase_operator("to_title_case"), desc = "Title Case" },
				{ "_u", textcase_operator("to_upper_case"), desc = "UPPER CASE" },
			},
			{
				mode = { "v" },
				{ "+", ':lua require"venn".draw_box("s")<cr>' },
			},
		},
	},
}
