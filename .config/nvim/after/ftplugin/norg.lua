vim.api.nvim_create_autocmd(
  "BufWritePost", {group = "U", buffer = 0, command = "Neorg tangle current-file"}
)
vim.bo.formatoptions = "crqnlj"

vim.api.nvim_set_hl(0, "@headline", {link = "Headline"})
vim.api.nvim_set_hl(0, "@codeblock", {link = "CodeBlock"})
vim.api.nvim_set_hl(0, "@dash", {link = "Dash"})
