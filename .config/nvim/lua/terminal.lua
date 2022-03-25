local handlers = {}
local M = {}

--- Create a hidden terminal instance
--
-- Make it locatable folder location/REPL-name pair. The former is take from
-- current buffer, while the latter is explicitly given.
--
-- repl: string
--   Name of the REPL it should initiate.
--
-- return: terminmal handle
local build = function(repl)
  local current_dir = vim.fn.expand("%:p:h")
  local current_id = vim.fn.bufnr()
  vim.cmd(":lcd " .. current_dir)
  vim.cmd(":e term://" .. repl)

  local term_handle = {
    repl = repl,
    buf_id = vim.fn.bufnr(),
    term_id = vim.b.terminal_job_id
  }
  vim.api.nvim_buf_set_option(term_handle.buf_id, "bufhidden", "hide")
  vim.api.nvim_set_current_buf(current_id)
  return term_handle
end

--- Locate a terminal instance.
--
-- If it does not exists, creating on first.
--
-- repl: string
--   Name of the REPL it should initiate.
--
-- return: terminmal handle
M.find = function(repl)
  if repl == nil then repl = "" end
  if handlers[repl] == nil then handlers[repl] = {} end
  local repls = handlers[repl]

  local project_dir = vim.fn.getcwd()

  if repls[project_dir] == nil then repls[project_dir] = build(repl) end
  return handlers[repl][project_dir]
end

--- Go to terminal window.
--
-- If no terminal instance exists, create one. Also ensures that only one
-- terminal window is open.
M.go_to = function(repl, term_handle)
  if term_handle == nil then term_handle = M.find(repl) end

  M.close(repl, term_handle)

  -- open new terminal window
  vim.cmd [[:vsplit]]
  vim.api.nvim_set_current_buf(term_handle.buf_id)
end

--- Close previously opened terminal window
M.close = function(repl, term_handle)
  if repl == nil then
    for repl, _ in pairs(handlers) do M.close(repl) end
  elseif type(repl) == "table" then
    for _, repl in ipairs(handlers) do M.close(repl) end
  elseif type(repl) == "string" then
    if term_handle == nil then term_handle = M.find(repl) end
    for _, win_id in pairs(vim.fn.win_findbuf(term_handle.buf_id)) do
      vim.cmd(vim.fn.win_id2win(win_id) .. "quit")
    end
  end
end

M.insert = function(repl, term_handle)
  M.go_to(repl, term_handle)
  vim.cmd [[:normal i]]
end

M.open = function(repl, term_handle)
  local current_win = vim.api.nvim_get_current_win()
  M.go_to(repl, term_handle)
  vim.api.nvim_set_current_win(current_win)
end

M.send = function(repl, cmd, term_handle)
  if term_handle == nil then term_handle = M.find(repl) end
  vim.fn.chansend(term_handle.term_id, cmd .. "\n")
end

M.run_line = function(args)
  if type(args) == "string" then args = {repl = args} end
  local current_line = vim.api.nvim_get_current_line()
  term_handle = args["term_handle"]
  if term_handle == nil then term_handle = M.find(args["repl"]) end
  M.open(args["repl"], term_handle)
  M.send(args["repl"], current_line, term_handle)
end

M.run_file = function(args)
  if type(args) == "string" then args = {repl = args} end
  if args["term_handle"] == nil then args["term_handle"] = M.find(args["repl"]) end
  if args["cmd"] == nil then args["cmd"] = "" end
  cmd = string.format("%s %s", args["cmd"], vim.fn.expand("%:p"))
  M.open(args["repl"], args["term_handle"])
  M.send(repl, cmd, args["term_handle"])
end

return M
