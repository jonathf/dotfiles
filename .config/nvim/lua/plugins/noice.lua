return {
  "folke/noice.nvim",
  keys = {{":"}, {"/"}, {"?"}},
  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    presets = {
      bottom_search = false,
      command_palette = false,
      long_message_to_split = true,
      inc_rename = true, -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = false, -- add a border to hover docs and signature help
    },
    cmdline = {
      format = {
          cmdline = { pattern = "^:", icon = ":", lang = "vim" },
          search_down = { kind = "search", pattern = "^/", icon = "/", lang = "regex" },
          search_up = { kind = "search", pattern = "^%?", icon = "?", lang = "regex" },
          filter = { pattern = "^:%s*!", icon = ":!", lang = "bash" },
          lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = ":lua ", lang = "lua" },
          help = { pattern = "^:%s*he?l?p?%s+", icon = ":h" },
          input = { view = "cmdline_input", icon = "󰥻 " },
      },
    },
    routes = {
      {
        filter = {
          event = "msg_show",
          kind = "",
          find = "written",
        },
        opts = { skip = true },
      },
    },
    views = {
      cmdline_popup = {
        position = { row = "95%", col = "10" },
        border = { style = "none", padding = { 1, 3 } },
        size = { width = 60, height = 1 },
        filter_options = {},
        win_options = {
          winhighlight = { Normal = "Visual" }
        },
      },
      popupmenu = {
        backend = "cmp",
        relative = "win",
        anchor = "SW",
        border = { style = "none", padding = { 1, 3 } },
        size = { width = 60, height = 10 },
      },
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    {
      "rcarriga/nvim-notify",
      opts = {
        icons = {
          DEBUG = "D",
          ERROR = "E",
          INFO = "I",
          TRACE = "D",
          WARN = "W",
        },
        render = "compact",
      },
    },
  },
}
