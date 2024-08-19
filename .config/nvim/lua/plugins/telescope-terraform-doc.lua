return {
  "ANGkeith/telescope-terraform-doc.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require"telescope".load_extension"terraform_doc"
  end,
}
