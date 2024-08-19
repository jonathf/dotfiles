return {
  "johmsalas/text-case.nvim",
  config = function()
    require"textcase".setup{
      default_keymappings_enabled = false,
    }
  end,
  lazy = false,
}
