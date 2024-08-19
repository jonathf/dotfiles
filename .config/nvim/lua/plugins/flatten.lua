return {
  "willothy/flatten.nvim",
  config = true,
  opts = {
    block_for = {
      gitcommit = true,
    },
    window = {
      open = "current",
    },
    callback = {
      post_open = function() -- (bufnr, winnr, ft, is_blocking)
        require"term".close("fish")
      end,
    },
  },
  lazy = false,
}
