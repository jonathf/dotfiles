local lookup = {
  ["utf-8"] = "",
  lua = "",
  unix = "",
  dos = "\\r\\n",
  mac = "\\r",
  python = "",
  help = "",
}

local function fmt(arg)
  local out = lookup[arg]
  if out == nil then return arg end
  return out
end

local function diff_source()
  local gitsigns = vim.b["gitsigns_status_dict"]
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
      head = gitsigns.head,
    }
  end
end

return {
  "nvim-lualine/lualine.nvim",
  lazy = false,
  dependencies = {
    "kyazdani42/nvim-web-devicons",
    "arkav/lualine-lsp-progress",
  },
  opts = {
    options = {
      icons_enabled = false,
      theme = "auto",
      component_separators = {left = "", right = ""},
      section_separators = {left = "", right = ""},
      disabled_filetypes = {},
      always_divide_middle = false,
      globalstatus = true,
      extensions = {},
    },
    sections = {
      lualine_a = {},
      lualine_b = {
        {"FugitiveHead", fmt = fmt},
        {"diff", source = diff_source},
        -- {"branch", fmt = fmt},
      },
      lualine_c = {
        {"encoding", fmt = fmt},
        {"filetype", fmt = fmt},
        {"fileformat", fmt = fmt},
      },
      lualine_x = {
        {"%S"}, -- show partial cmds
        {"diagnostics", sources = {"nvim_lsp", "nvim_diagnostic"}},
      },
      lualine_y = {
        {"searchcount"},
        {"selectioncount", fmt = function(arg)
          if arg ~= "" then
            arg = arg .. vim.api.nvim_get_mode()["mode"]
          end
          return arg
        end},
        {"macro_recording", fmt = function()
          local rr = vim.fn.reg_recording()
          if rr ~= "" then
            rr = "rec:" .. rr
          end
          return rr
        end},
        {"progress", fmt = function(arg)
          local mode = vim.api.nvim_get_mode()["mode"]
          if mode == "v" or mode:sub(-1) == "V" then
            return ""
          end
          return arg
        end}
      },
      lualine_z = {"location"},
    },
    inactive_sections = {},
    winbar = {
    },
    inactive_winbar = {
    },
    tabline = {
      lualine_a = {},
      lualine_b = {{
        "buffers",
        mode = 4,
        show_filename_only = true,
        symbols = {modified = "+"},
        buffers_color = {
          active = {fg="#ffffff"},
          inactive = {fg="#9a9a9a"},
        },
      }},
      lualine_c = {
        {"navic", navic_opts = {icons = {}}},
      },
      lualine_x = {
        {"lsp_progress", display_components = { "lsp_client_name", { "title", "message" }}},
      },
      lualine_y = {
        {"filename", fmt=function() return vim.fn.expand("%:~:h") end},
      },
      lualine_z = {},
    },
    extensions = {},
  }
}
