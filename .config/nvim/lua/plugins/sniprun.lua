return {
  "michaelb/sniprun",
  build = "sh ./install.sh",
  opts = {
    repl_enable = { "Python_jupyter", "lua_nvim", },
    display = { "VirtualTextOk", "VirtualTextErr", "Api" },
  },
}
