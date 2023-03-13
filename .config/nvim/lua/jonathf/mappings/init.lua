local substitute = require"jonathf.mappings.substitute"

vim.keymap.set("n", "<esc>", "<esc>:silent! nohls<cr>", {noremap = true})
vim.keymap.set("t", "<esc>", "<c-\\><c-n>", {noremap = true})

vim.keymap.set("n", "<down>", "<c-w>j", {noremap = true})
vim.keymap.set("n", "<up>", "<c-w>k", {noremap = true})
vim.keymap.set("n", "<left>", "<c-w>h", {noremap = true})
vim.keymap.set("n", "<right>", "<c-w>l", {noremap = true})

substitute.normal_sub("»", "^", "%t", {noremap = true})
substitute.visual_sub("»", "^", "%t", {noremap = true})
substitute.operator_sub("»", "^", "%t", {noremap = true})

substitute.normal_sub("«", "^%t", "", {noremap = true})
substitute.visual_sub("«", "^%t", "", {noremap = true})
substitute.operator_sub("«", "^%t", "", {noremap = true})

vim.keymap.set("n", "dd", function() return vim.fn.getline(".") == "" and '"_dd' or 'dd' end, {expr = true})
vim.keymap.set("n", "s", ":write<cr>", {noremap = true})
vim.keymap.set("n", "æ", ":exec ':cd '.fnamemodify(expand('%'), ':h')<cr>:", {noremap = true})
vim.keymap.set("n", "ø", function() require"jonathf.terminal".insert"fish" end, {noremap = true})
vim.keymap.set("n", "å", ":Gcd<cr>:", {noremap = true})
