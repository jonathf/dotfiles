return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
        "seanbreckenridge/gitsigns-yadm.nvim",
        opts = {
            shell_timeout_ms = 1000,
        },
    },
  },
  opts = {
  -- keymaps = {noremap = false},
    _on_attach_pre = function(_, callback)
        require("gitsigns-yadm").yadm_signs(callback)
    end,
    signs = {
      add          = { text = '█' },
      change       = { text = '█' },
      delete       = { text = '█' },
      topdelete    = { text = '█' },
      changedelete = { text = '█' },
      untracked    = { text = '█' },
    },
  },
}
