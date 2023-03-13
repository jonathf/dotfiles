-- https://github.com/hrsh7th/nvim-cmp
--
-- Suggestions while you type

return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "ray-x/cmp-treesitter",
    "lukas-reineke/cmp-under-comparator",
    "L3MON4D3/LuaSnip",
    "folke/neodev.nvim",
  },
  event = "InsertEnter",
  config = function()
    local cmp = require"cmp"
    local luasnip = require"luasnip"
    cmp.setup {
      mapping = cmp.mapping.preset.insert{
        ["<tab>"] = function(fallback)
          if require"luasnip".expand_or_locally_jumpable() then
            require"luasnip".expand_or_jump()
          elseif require"cmp".visible() then
            require"cmp".select_next_item()
          else
            fallback()
          end
        end,
      },
      formatting = {},
      sources = {
        { name = "neorg" },
        { name = "path" },
        { name = "nvim_lua" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "treesitter" },
        { name = "buffer",
          option = { get_bufnrs = function() return { vim.api.nvim_get_current_buf() } end } }
      },
      view = { entries = "native" },
      sorting = {
        comparators = {
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.score,
          require "cmp-under-comparator".under,
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end
      },
    }
  end,
}
