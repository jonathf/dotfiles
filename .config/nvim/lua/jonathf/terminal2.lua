local handlers = {}
local M = {}
local config = {
  bash = {
    repl = "bash --norc",
    shell_exec_file = "bash ",
    repl_exec_file = "bash ",
  },
  fish = {
    repl = "fish",
    shell_exec_file = "fish ",
    repl_exec_file = "./",
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

--- Locate a terminal instance.
--
-- If it does not exists, creating on first.
--
-- repl: string
--   Name of the REPL it should initiate.
--
-- return: terminmal handle
local function get_term_handle(name)
  if name == nil then name = vim.bo.filetype end
  local config_ft = config[name]
  if handlers[config_ft.repl] == nil then handlers[config_ft.repl] = {} end
  local repl_ = handlers[config_ft.repl]
  local project_dir = vim.fn.getcwd()
  if repl_[project_dir] == nil then
    repl_[project_dir] = require"consolation".Wrapper:new()
  end
  return repl_[project_dir]
end

--- Go to terminal window.
--
-- If no terminal instance exists, create one. Also ensures that only one
-- terminal window is open.
local function switch_to_terminal(name)
  get_term_handle(name):open()
end

local function send_command(name, cmd)
  get_term_handle(name):open()
  get_term_handle(name):send_command(cmd)
end

M.do_ = function(cmd, name)
  get_term_handle(name):send_command(cmd)
end

--- Close previously opened terminal window
M.close = function(name)
  get_term_handle(name):close()
end

M.insert = function(name)
  get_term_handle(name):open()
  vim.cmd("startinsert")
end

M.open = function(name)
  local current_win = vim.api.nvim_get_current_win()
  get_term_handle(name):open()
  vim.api.nvim_set_current_win(current_win)
end

M.exec_current_line = function(name)
  get_term_handle(name):open{cmd = vim.api.nvim_get_current_line()}
end

local function exec(name, cmd)
  get_term_handle(name):open{cmd = cmd .. vim.fn.expand("%:p")}
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
