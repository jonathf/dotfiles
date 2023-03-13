return {
  -- O_i O_I :: "inside" operator
  -- O_o O_O :: "outside" operator
  -- optional infix modifier: n:next, l:last
  -- target: ()[]{}<>""`,.;:+-=~_*#/|\&$
  {
    "wellle/targets.vim",
    event = "InsertEnter",
  },

  -- N_ys :: surround an text object
  -- O_s :: modify surrounded text object
  -- targets: ()[]{}<>""`
  {
    "tpope/vim-surround",
    event = "VeryLazy",
    dependencies = "tpope/vim-repeat",
  },


  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
  },

  -- Recovery diff
  -- {"rhysd/conflict-marker.vim"},
  {
    "sindrets/diffview.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    opts = {
      use_icons = false,
      default_args = {
        DiffviewOpen = { "--untracked-files=no", "--imply-local" },
        DiffviewFileHistory = { "--base=LOCAL" },
      },
      hooks = {
        -- hack to not include fileview
        view_opened = function()
          require("diffview.actions").toggle_files()
        end,
      },
    },
  },

  {
    "pianocomposer321/consolation.nvim"
  },

}
