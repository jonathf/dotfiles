return {
  "williamboman/mason.nvim",
  lazy = false,
  dependencies = {
    "neovim/nvim-lspconfig",
  },
  opts = {
    pip = { upgrade_pip = true },
    ui = {
      icons = {
        package_installed = "X",
        package_pending = ".",
        package_uninstalled = "O"
      },
      width = 1,
      height = 1,
    },
  }
}
