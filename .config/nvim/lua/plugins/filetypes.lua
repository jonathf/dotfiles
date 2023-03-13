return {
  {"cespare/vim-toml", ft = "toml"},
  {"jonathf/vim-fish", ft = "fish"},
  {"euclidianAce/BetterLua.vim", ft = "lua"},
  {"zorab47/vim-gams", ft = "gams"},
  {"Vimjas/vim-python-pep8-indent", ft = "python"},
  {"jamessan/vim-gnupg"},
  {"Glench/Vim-Jinja2-Syntax", ft = "html"},
  {"hashivim/vim-terraform", ft = "terraform"},
  {"goerz/jupytext.vim", ft = {"ipynb", "json"}},

  {
    "chrisbra/csv.vim",
    ft = "csv",
    config = function()
      vim.g.csv_no_conceal = 1
      vim.g.csv_nl = 1
      vim.g.csv_highlight_column = "y"
    end,
  },
  -- Setup neovim lua configuration
  {
    "folke/neodev.nvim",
    opts = {},
  },
}
