local function window_open(files, argv, stdin_buf)
  if vim.tbl_contains(argv, "-O") then
    for _, file in ipairs(files) do
      vim.cmd("vsplit " .. file.fname)
    end
  elseif vim.tbl_contains(argv, "-o") then
    for _, file in ipairs(files) do
      vim.cmd("split " .. file.fname)
    end
  elseif stdin_buf ~= nil then
    vim.cmd("edit " .. vim.api.nvim_buf_get_name(stdin_buf))
  else
    vim.cmd("edit " .. files[#files].fname)
  end
  require"jonathf.terminal".close("fish")
  return vim.api.nvim_get_current_buf()
end

-- local function post_open(bufnr, winnr, ft, is_blocking)
local function post_open()
  require"jonathf.terminal".close("fish")
end

return {
  "willothy/flatten.nvim",
  config = true,
  opts = {
    block_for = { gitcommit = true },
    window = { open = window_open },
    callback = { post_open = post_open },
  }
}
