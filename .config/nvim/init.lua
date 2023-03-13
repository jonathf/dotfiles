-- Package management with Lazy.nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Nested session handle with Flatten.nvim

if os.getenv("NVIM") ~= nil then
  require "lazy".setup {{ "willothy/flatten.nvim", config = true }}
  return
end

-- Loading native settings, mappings and auto-commands

require "jonathf".setup()

-- Loading plugins

require "lazy".setup("plugins", {
  install = {colorscheme = {"kenagawa-dragon"}},
  ui = {
    size = { width = 1., height = 1. },
    icons = {
      cmd = "cmd",
      config = "cfg",
      event = "event",
      ft = "ft",
      init = "init",
      keys = "key",
      plugin = "plugin",
      runtime = "runtime",
      source = "src",
      start = "start",
      task = "task",
      lazy = "lazy",
    },
  },
})
