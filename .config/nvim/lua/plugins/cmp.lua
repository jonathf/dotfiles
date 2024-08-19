-- https://github.com/hrsh7th/nvim-cmp
--
-- Suggestions while you type

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-cmdline",
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
          elseif has_words_before() and cmp.visible() then
            cmp.select_next_item()
            cmp.mapping.confirm({ select = true })
          else
            fallback()
          end
        end,
        ["<up>"] = function() cmp.select_prev_item() end,
        ["<down>"] = function() cmp.select_next_item() end,
      },
      sources = {
        { name = "lazydev", group_index = 0 },
        { name = "path" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "treesitter" },
        { name = "buffer",
          option = { get_bufnrs = function() return { vim.api.nvim_get_current_buf() } end } }
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end
      },
    }
  end,
}
