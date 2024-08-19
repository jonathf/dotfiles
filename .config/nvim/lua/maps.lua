local subs = require "subs"

vim.keymap.set("t", "<esc>", "<c-\\><c-n>", {noremap = true, silent = true})

vim.keymap.set("c", "<down>", "<c-n>", {noremap = true})
vim.keymap.set("c", "<up>", "<c-p>", {noremap = true})

subs.normal_sub("»", "^", "%t", {noremap = true})
subs.visual_sub("»", "^", "%t", {noremap = true})
subs.operator_sub("»", "^", "%t", {noremap = true})

subs.normal_sub("«", "^%t", "", {noremap = true})
subs.visual_sub("«", "^%t", "", {noremap = true})
subs.operator_sub("«", "^%t", "", {noremap = true})

-- vim.keymap.set("n", "æ", ":silent! exec ':cd '.fnamemodify(expand('%'), ':h')<cr>:", {noremap = true})
-- vim.keymap.set("n", "ø", function() require"term".insert"fish" end, {noremap = true})
-- vim.keymap.set("n", "å", ":Gcd<cr>:", {noremap = true})

vim.keymap.set("v", "+", ':lua require"venn".draw_box("s")<cr>')

vim.keymap.set("c", "<m-bs>", "<c-w>", {noremap = true})

vim.keymap.set("c", "<s-cr>", function()
  require("noice").redirect(vim.fn.getcmdline() or "")
end, { desc = "Redirect Cmdline" })
