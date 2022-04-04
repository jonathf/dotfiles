-- files --
vim.g.python3_host_prog = vim.fn.stdpath("config") .. "/venv/bin/python"
vim.o.backup = true
vim.o.backupdir = vim.fn.stdpath("data") .. "/backup"
vim.o.gdefault = true
vim.o.undofile = true
vim.o.spelllang = "en_us,nb"
vim.cmd [[let $VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"]]
vim.o.grepprg = "rg\\ --vimgrep\\ --no-heading\\ --smart-case"
vim.o.grepformat = "%f:%l:%c:%m,%f:%l:%m"

-- indentation --

vim.o.breakindent = true -- break has same indentation
vim.o.copyindent = true -- copy indentation on newline
vim.o.expandtab = true -- convert tabs to spaces
vim.o.shiftwidth = 2 -- number of spaces in tabs
vim.o.softtabstop = 2 -- Insert spaces instead of tabs
vim.o.tabstop = 2 -- number of spaces in a tab
vim.o.joinspaces = false -- 'J' after '.' creates single space.
vim.o.shiftround = true -- rounds down number of spaces for tab alignment
vim.o.number = true -- line numbering
vim.o.relativenumber = true -- line numbering

-- visuals --

-- vim.o.inccommand = "nosplit"
vim.o.list = true
vim.o.listchars = "tab:↦ ,trail:▮,nbsp:░"
vim.o.formatoptions = "croqnlj" -- continue commenting
vim.o.previewheight = 3
vim.o.scrolloff = 5 -- never reach bottom
vim.o.linebreak = true -- smart (fake) auto-line break
-- vim.o.statusline = "%L %f%=%m%w %P %n"
vim.o.termguicolors = true
vim.o.virtualedit = "block"
vim.o.cursorline = true
-- vim.o.cursorlineopt = "number,line"

-- behavior --

vim.o.clipboard = "unnamed,unnamedplus" -- common clipboard for all vim sessions
vim.o.completeopt = "menuone,noinsert,noselect"
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.mouse = "n" -- enable mouse
-- vim.o.startofline = false                  -- leave the cursor in place
vim.o.spell = false -- Check my (natural language) spelling
vim.o.splitbelow = true -- default hsplits to down position
vim.o.splitright = true -- default vsplits to right position
vim.o.wildmode = "longest:full,full"

-- folding --
vim.o.foldenable = true -- disallow folding by default
vim.o.foldlevel = 99999
vim.o.foldmethod = "expr"
