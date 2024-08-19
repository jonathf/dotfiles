return {
  'echasnovski/mini.nvim',
  event = "VeryLazy",
  config = function()
    require "mini.ai".setup()
    require "mini.comment".setup{
      mappings = {
          comment = '-',
          comment_line = '--',
          comment_visual = '-',
          textobject = '-',
        },
    }
  end
}
