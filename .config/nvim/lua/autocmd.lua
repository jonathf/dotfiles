vim.api.nvim_create_augroup("U", {})

vim.api.nvim_create_autocmd("BufWritePre", {
  group = "U",
  once = true,
  callback = function() vim.o.backupext = vim.o.backupext.."-"..os.date("%y%m") end,
  desc = "Roll backup ext every month.",
})

vim.api.nvim_create_autocmd("CmdwinEnter", {
  group = "U",
  callback = function() vim.keymap.set("n", "<esc>", ":q<cr>", {buffer = true}) end,
  desc = "Escapeable command window.",
})

vim.api.nvim_create_autocmd({
  "BufEnter", "FocusGained", "InsertLeave", "WinEnter",
}, {
  group = "U",
  callback = function()
    if not vim.o.number then return end
    if vim.api.nvim_get_mode().mode ~= "i" then
      vim.o.relativenumber = true
    end
  end,
  desc = "Absolute numbers outside normal",
})

vim.api.nvim_create_autocmd({
  "BufLeave", "FocusLost", "InsertEnter", "WinLeave"
}, {
  group = "U",
  callback = function()
    if not vim.o.number then return end
    vim.o.relativenumber = false
  end,
  desc = "Relative numbers in normal mode",
})

vim.api.nvim_create_autocmd("BufReadPost", {
  group = "U",
  callback = function()
    local cursor = vim.api.nvim_buf_get_mark(0, '"')
    if cursor[1] > 0 and cursor[1] <= vim.api.nvim_buf_line_count(0) then
      vim.api.nvim_win_set_cursor(0, cursor)
    end
  end,
  desc = "Remember last cursor position",
})
