-- @document.meta
-- title: settings
-- description: Neovim settings
-- authors: jonathf
-- created: 2023-07-08
-- updated: 2023-08-06
-- version: 1.1.1
-- tangle: {
--   languages: {
--     lua: jonathf/settings.lua
--   }
--   delimiter: filecontent
-- }
-- @end

-- * Filetype related settings

--   Lets disable Netrw plugin as we use Oil instead:

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--   Lets use the new lua-based filetype handler along side the old one:

vim.g.do_filetype_lua = 1
-- vim.g.did_load_filetypes = 0

--   Lets add some missing filetypes:

vim.filetype.add({ extension = {
	gms = "gams",
	ipynb = "notebook",
	keymap = "cpp",
} })

-- * Backup, swap and undo files

--   Turn backup and swapping on:

vim.o.backup = true
vim.o.undofile = true

--   Set location for backup, swap, undo and shada files:

local data_path = vim.fn.stdpath("data")
vim.o.backupdir = data_path .. "/backup//"
vim.o.directory = data_path .. "/swap//"
vim.o.undodir = data_path .. "/undo//"
vim.o.shadafile = data_path .. "/shada"

-- * Space, tab, indentation and newline behavior

--   Spaces are better than tabs, so we do what we can to convert to to spaces:

local tabwidth = 2
vim.o.expandtab = true
vim.o.shiftwidth = tabwidth
vim.o.softtabstop = tabwidth
vim.o.tabstop = tabwidth
vim.o.shiftround = true

--   Set up real and virtual indenting to continue on the next line:

vim.o.copyindent = true
vim.o.breakindent = true
vim.o.linebreak = true
vim.o.wrap = true

--   Make the various spaces visually distinct:

vim.o.list = true
vim.o.listchars = "tab:⇥ ,trail:▮,nbsp:░"
vim.o.showbreak = "⏵"

--   Rules for how and where to break up lines:

vim.o.textwidth = 79
vim.o.formatoptions = "croqnlj1"

-- * Substitution rules

--   Substitute all matches on each line by default:

vim.o.gdefault = true

-- * Spelling

vim.o.spell = false
vim.o.spelllang = "en_us,nb"

-- * Diff options

vim.o.diffopt = "internal,filler,closeoff,vertical,linematch:100"

-- * Command line rules

vim.o.completeopt = "menuone,preview"
vim.o.wildmode = "longest:full,full"

-- * Look and feel:

--   Visual mode stuff:
vim.o.virtualedit = "block,insert,onemore"
vim.o.inccommand = "nosplit"

vim.o.number = true
vim.o.relativenumber = true
vim.o.numberwidth = 1
vim.o.signcolumn = "number"
vim.o.mouse = "n"
vim.o.scrolloff = 5
vim.o.clipboard = "unnamed,unnamedplus"
vim.o.cmdheight = 0
vim.o.termguicolors = true
vim.o.showtabline = 1
vim.o.shortmess = "filnxtToOCFc"
vim.o.showcmdloc = "statusline"
vim.o.splitkeep = "screen"

--   Make sure splitting puts new buffer to the right or below:

vim.o.splitbelow = true
vim.o.splitright = true

-- * Folding

--   We like folding, but not don't collaps anything by default.

vim.o.foldenable = true
vim.o.foldlevel = 99999
vim.o.foldmethod = "expr"

-- * Map leader

--   Mapping leader:

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- * Providers

vim.g.python3_host_prog = "~/.venv/nvim/312/bin/python"
