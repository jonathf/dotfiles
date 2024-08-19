return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require"colorizer".setup(nil, {
      RGB = false,
      names = false,
      mode = "background",
    })
  end,
  lazy = false,
  priority = 1000,
}
