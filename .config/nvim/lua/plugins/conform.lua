return {
  { -- Autoformat
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = {
      formatters = {
        terraform = {
          stdin = false,
          command = "terraform",
          args = { "fmt", "$FILENAME" },
        },
        ruff = {
          stdin = false,
          command = "ruff",
          args = { "format", "$FILENAME" },
        },
        tomlsort = {
          stdin = false,
          command = "toml-sort",
          args = { "$FILENAME" },
        },
        yamlfmt = {
          stdin = false,
          command = "yamlfmt",
          args = { "$FILENAME" },
        },
      },
      notify_on_error = true,
      format_on_save = vim.env.AUTO_FORMAT ~= nil and {
        timeout_ms = 500,
        lsp_falback = true,
      } or {},
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff" },
        yaml = { "yamlfmt" },
        terraform = { "terraform" },
        json = { "fixjson", "jq" },
        html = { "htmlbeautifier" },
        toml = { "tomlsort" },
        rst = { "docstrfmt" },
      },
    },
  },
}
