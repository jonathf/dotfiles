local nfunc = function(func)
  local old_func = vim.go.operatorfunc -- backup previous reference
  _G.__funcoperator = function(type)

    local start = vim.api.nvim_buf_get_mark(0, '[')[1]
    local end_ = vim.api.nvim_buf_get_mark(0, ']')[1]
    if type == "line" then start = start - 1 end
    local lines = vim.api.nvim_buf_get_lines(0, start, end_, false)
    for index,line in pairs(lines) do
      lines[index] = func(line)
    end
    vim.api.nvim_buf_set_lines(0, start, end_, false, lines)

    vim.go.operatorfunc = old_func -- restore previous opfunc
    _G.__funcoperator = nil -- deletes itself from global namespace
  end
    vim.go.operatorfunc = 'v:lua.__funcoperator'
  vim.api.nvim_feedkeys('g@', 'n', false)
end

local vfunc = function(func)
  local start = vim.fn.line(".")
  local end_ = vim.fn.line("v")
  if end_ < start then
    local tmp = end_
    end_ = start
    start = tmp
  end
  local lines = vim.api.nvim_buf_get_lines(0, start-1, end_, false)
  for index,line in pairs(lines) do
    lines[index] = func(line)
  end
  vim.api.nvim_buf_set_lines(0, start-1, end_, false, lines)
end

local ofunc = function(func)
  vim.print(123)
  local index = vim.fn.line(".")
  local lines = vim.api.nvim_buf_get_lines(0, index-1, index, false)
  lines[1] = func(lines[1])
  vim.api.nvim_buf_set_lines(0, index-1, index, false, lines)
end

local operators = {}
local count = 0

local M = {}

M.set_nmap = function(key, callback, opts)
  local name
  if operators[key] ~= nil then
    name = operators[key]
  else
    name = "_funcoperator_" .. count
    count = count + 1
    _G[name] = function() nfunc(callback) end
    operators[key] = name
  end
  vim.keymap.set("n", key, "<cmd>lua " .. name .. "()<cr>", opts)
end

M.set_omap = function(key, callback, opts)
  opts = vim.tbl_extend(
    "error", opts, {callback = function() ofunc(callback) end})
  vim.keymap.set("o", key, "", opts)
end

M.set_vmap = function(key, callback, opts)
  opts = vim.tbl_extend(
    "error", opts, {callback = function() vfunc(callback) end})
  vim.keymap.set("v", key, "", opts)
end

M.normal_sub = function(trigger, source, target, opts)
  local tab = string.rep(" ", vim.o.tabstop)
  source = source:gsub("%t", tab)
  target = target:gsub("%t", tab)
  local callback = function(line)
    return string.gsub(line, source, target)
  end
  M.set_nmap(trigger, callback, opts or {})
end

M.operator_sub = function(trigger, source, target, opts)
  local tab = string.rep(" ", vim.o.tabstop)
  source = source:gsub("%t", tab)
  target = target:gsub("%t", tab)
  local callback = function(line)
    return string.gsub(line, source, target)
  end
  M.set_omap(trigger, callback, opts or {})
end

M.visual_sub = function(trigger, source, target, opts)
  local tab = string.rep(" ", vim.o.tabstop)
  source = source:gsub("%t", tab)
  target = target:gsub("%t", tab)
  local callback = function(line)
    return string.gsub(line, source, target)
  end
  M.set_vmap(trigger, callback, opts or {})
end

return M
