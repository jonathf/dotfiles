local servers = {
  bashls = {}, -- bash
  clangd = {}, -- C/C++
  dockerls = {}, -- docker
  esbonio = {}, -- sphinx
  fixjson = {}, -- json
  gitlab_ci_ls = {}, -- yaml.gitlab
  htmlbeautifier = {},
  jsonls = {}, -- json
  jq = {},
  lua_ls = {
    settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        workspace = {
          checkThirdParty = false,
          library = { unpack(vim.api.nvim_get_runtime_file("", true)) },
        },
        completion = { callSnippet = "Replace" },
      },
    },
  }, -- lua
  marksman = {}, -- markdown
  markdown_oxide = {}, -- markdown
  pylsp = {
    settings = {
      pylsp = {
        plugins = {
          -- rope_autoimport = { enabled = false },
          -- black = { enabled = true },
          ruff = {
            enabled = false,
            formatEnabled = true,
          },
        },
      },
    },
  }, -- python
  rstcheck = {}, -- rst
  -- ruff = {},
  -- ruff_lsp = {
  --   init_options = {
  --     settings = {
  --       args = {},
  --     },
  --   },
  -- },
  sqlls = {}, -- sql
  stylua = {},
  taplo = {}, -- toml
  selene = {}, -- lua linter
  terraformls = {}, -- terraoform
  tflint = {}, -- terraoform
  yamlls = {}, -- yaml
}

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    { "folke/lazydev.nvim", ft = "lua", opts = {} },
  },
  event = "VeryLazy",
  config = function()
    vim.lsp.set_log_level("off")
    vim.diagnostic.config({ virtual_text = true, signs = false })
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
      callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = event.buf,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = event.buf,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

    require("mason").setup({
      pip = { upgrade_pip = true },
      ui = {
        icons = {
          package_installed = "X",
          package_pending = "…",
          package_uninstalled = "i",
        },
        -- width = 1,
        -- height = 1,
      },
    })

    -- You can add other tools here that you want Mason to install
    -- for you, so that they are available from within Neovim.
    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      "stylua", -- lua
      -- "blackd-client", -- python
      "yamlfmt", -- yaml
    })
    require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

    require("mason-lspconfig").setup({
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          -- This handles overriding only values explicitly passed
          -- by the server configuration above. Useful when disabling
          -- certain features of an LSP (for example, turning off formatting for tsserver)
          server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
          require("lspconfig")[server_name].setup(server)
        end,
      },
    })
  end,
}
