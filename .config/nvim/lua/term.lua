-- handlers:
--   repr:
--     project_dir:
--       repl: str,
--       buf_id: str,
--       term_id: str,
local handlers = {}
local M = {}
local config = {
  bash = {
    repl = "bash --norc",
    repl_exec_file = "bash ",
    shell_exec_file = "bash ",
  },
  fish = {
    repl = "fish",
    repl_exec_file = "./",
    shell_exec_file = "fish ",
  },
  python = {
    repl = "ipython --nosep",
    repl_exec_file = "%run ",
    shell_exec_file = "ipython ",
    shell_exec_test = "pytest -vv --doctest-modules ",
  },
  terraform = {
    shell_exec_file = "",
    shell_exec_test = "terraform validate",
  },
  lua = {
    repl = "lua",
    shell_exec_file = "lua ",
  },
}

--- Create a hidden terminal instance
--
-- Make it locatable folder location/REPL-name pair. The former is take from
-- current buffer, while the latter is explicitly given.
--
-- repl: string
--   Name of the REPL it should initiate.
--
-- return: terminal handle
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
-- name: string
--   Name of the REPL it should initiate.
--
-- return: terminal handle
local function get_term_handle(name, repl)
  local project_dir = vim.fn.getcwd()
  if handlers[project_dir] == nil then handlers[project_dir] = {} end
  local handlers_ = handlers[project_dir]
  if name == nil then name = vim.bo.filetype end
  local config_ft = config[name]
  if repl == nil then repl = config_ft.repl end
  if handlers_[repl] == nil then handlers_[repl] = build(repl) end
  handlers_["current"] = handlers_[repl]
  return handlers_[repl]
end

--- Go to terminal window.
--
-- If no terminal instance exists, create one. Also ensures that only one
-- terminal window is open.
local function switch_to_terminal(name)
  local term_handle = get_term_handle(name)
  M.close(name)
  -- open new terminal window
  vim.cmd("vsplit")
  vim.api.nvim_set_current_buf(term_handle.buf_id)
end

local function send_command(name, cmd)
  local term_handle = get_term_handle(name)
  vim.fn.chansend(term_handle.term_id, cmd .. "\n")
end

M.do_ = function(cmd, name)
  local current_win = vim.api.nvim_get_current_win()
  switch_to_terminal(name)
  vim.cmd(cmd)
  vim.api.nvim_set_current_win(current_win)
end

--- Close previously opened terminal window
M.close = function(name, repl)
  local term_handle = get_term_handle(name, repl)
  for _, win_id in pairs(vim.fn.win_findbuf(term_handle.buf_id)) do
    vim.cmd(vim.fn.win_id2win(win_id) .. "quit")
  end
end

M.insert = function(name)
  switch_to_terminal(name)
  vim.cmd("startinsert")
end

M.open = function(name)
  local current_win = vim.api.nvim_get_current_win()
  switch_to_terminal(name)
  vim.api.nvim_set_current_win(current_win)
end

M.exec_current_line = function(shell)
  local current_line = vim.api.nvim_get_current_line()
  M.open(shell)
  send_command(shell, current_line)
end

local function exec(shell, cmd)
  M.open(shell)
  send_command(shell, cmd .. vim.fn.expand("%:p"))
end

M.exec_test = function(shell)
  exec(shell, config[vim.bo.filetype].shell_exec_test)
end

M.exec_file = function(shell)
  if shell == nil then
    exec(shell, config[vim.bo.filetype].repl_exec_file)
  else
    exec(shell, config[vim.bo.filetype].shell_exec_file)
  end
end

return M
