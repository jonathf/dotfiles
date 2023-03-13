return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    load = {
      ["core.defaults"] = {},
      ["core.completion"] = {config = {name = "norg", engine = "nvim-cmp"}},
      ["core.esupports.metagen"] = {}
    },
  },
}
