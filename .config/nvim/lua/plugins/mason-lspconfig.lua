local servers = {
  dockerls = {},
  jsonls = {},
  clangd = {},
  taplo = {},
  terraformls = {},
  jdtls = {},
  bashls = {},
  esbonio = {},
  pylsp = {},
  lua_ls = { Lua = {
    diagnostics = { globals = { "vim", "awesome" } },
  } },
}

return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
  config = function()
    vim.diagnostic.config { virtual_text = true, signs = false }
    -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    -- Ensure the servers above are installed
    local mason_lspconfig = require"mason-lspconfig"
    mason_lspconfig.setup {
      ensure_installed = vim.tbl_keys(servers),
    }
    mason_lspconfig.setup_handlers {
      function(server_name)
        require("lspconfig")[server_name].setup {
          capabilities = capabilities,
          -- on_attach = on_attach,
          settings = servers[server_name],
        }
      end,
    }
  end,
}
