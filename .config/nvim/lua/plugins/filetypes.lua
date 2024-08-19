return {
  {"cespare/vim-toml", ft = "toml"},
  {"jonathf/vim-fish", ft = "fish"},
  {"euclidianAce/BetterLua.vim", ft = "lua"},
  {"zorab47/vim-gams", ft = "gams"},
  {"Vimjas/vim-python-pep8-indent", ft = "python"},
  {"nmac427/guess-indent.nvim", opts = {}, ft = "python"},
  {"jamessan/vim-gnupg", event = "VeryLazy"},
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
  {
      "stevearc/oil.nvim",
      opts = {},
      ft = {"unix"},
      event = { 'BufReadPre', 'BufNewFile' },
  },
}
