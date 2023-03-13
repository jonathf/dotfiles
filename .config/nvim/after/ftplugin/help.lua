vim.api.nvim_create_autocmd(
  "BufWinEnter", { group="U", buffer=0, command="wincmd L" }
)