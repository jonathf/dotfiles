return {
  "folke/which-key.nvim",
  keys = {{"<leader>"}, {"["}, {"]"}},
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 3000
    local whichkey = require"which-key"
    whichkey.setup{keymaps = {noremap = false}, yadm = {enable = true}}
    whichkey.register({
      ["]"] = {
        name = "+Next",
        ["b"] = { ":bnext<cr>", "Next buffer" },
        ["c"] = { ":cnext<cr>", "Next error" },
        ["g"] = { ":lua require'gitsigns'.next_hunk()<cr>", "Next git hunk" },
        ["s"] = { "]s", "Next spelling error" },
        ["l"] = { ":lua vim.diagnostic.goto_next()<cr>", "Next LSP error" },
      },
      ["["] = {
        name = "+Previous",
        ["b"] = { ":bprev<cr>", "Previous buffer" },
        ["c"] = { ":cprev<cr>", "Previous error" },
        ["g"] = { ":lua require'gitsigns'.prev_hunk()<cr>", "Previous git hunk" },
        ["s"] = { "[s", "Previous spelling error" },
        ["l"] = { ":lua vim.diagnostic.goto_prev()<cr>", "Previous LSP error" },
      },
      ["<leader>"] = {
        ["<leader>"] = {":ls<cr>:buffer <c-d>", "Change buffer .."},
        ["a"] = {
          name = "+Args",
          ["a"] = {":argadd <c-r>=fnameescape(expand('%:p:h'))<cr>/*<c-d>", "Add current file"},
        },
        ["d"] = {":x<cr>", "close"},
        ["g"] = {
          name = "+Git",
          ["g"] = {":Git ", "git .."},
          ["d"] = {":Gitsigns diffthis<cr>", "git diff"},
          ["D"] = {":Gitsigns diffthis ", "git diff .."},
          ["s"] = {":lua require'gitsigns'.stage_hunk()<cr>", "Stage hunk"},
          ["S"] = {":lua require'gitsigns'.stage_buffer()<cr>", "Stage buffer"},
          ["r"] = {":lua require'gitsigns'.reset_hunk()<cr>", "Reset hunk"},
          ["R"] = {":lua require'gitsigns'.reset_buffer()<cr>", "Reset buffer"},
          ["U"] = {":lua require'gitsigns'.reset_buffer_index()<cr>", "Reset buffer hard"},
          ["u"] = {":lua require'gitsigns'.undo_stage_hunk()<cr>", "Unstage hunk"},
          ["p"] = {":lua require'gitsigns'.preview_hunk()<cr>", "Preview hunk"},
          ["b"] = {":lua require'gitsigns'.blame_line()<cr>", "Blame line"},
          ["B"] = {":Git blame<cr>", "Blame buffer"},
        },
        ["l"] = {
          name = "+LSP",
          ["f"] = {":lua vim.lsp.buf.format()<cr>", "Format"},
          ["s"] = {":lua vim.lsp.buf.signature_help()<cr>", "Signature"},
          ["h"] = {":lua vim.lsp.buf.hover()<cr>", "Hover"},
          ["r"] = {":lua vim.lsp.buf.rename()<cr>", "Rename"},
          ["i"] = {":lua vim.lsp.buf.incoming_calls()<cr>", "Incomming"},
          ["o"] = {":lua vim.lsp.buf.outgoing_calls()<cr>", "Outgoing"},
          ["a"] = {":lua vim.lsp.buf.code_action()<cr>", "Code Action"}
        },
        ["n"] = {
          name = "+Neorg",
        },
        ["r"] = {
          name = "+REPL",
          ["gg"] = {':lua require"jonathf.terminal".do_("normal gg")<cr>', "Scroll top"},
          ["G"] = {':lua require"jonathf.terminal".do_("normal G")<cr>', "Scroll bottom"},
          ["j"] = {':lua require"jonathf.terminal".do_("normal <c-d>")<cr>', "Scroll down"},
          ["k"] = {':lua require"jonathf.terminal".do_("normal <c-u>")<cr>', "Scroll up"},
          ["c"] = {':lua require"jonathf.terminal".close()<cr>', "Close"},
          ["i"] = {':lua require"jonathf.terminal".insert()<cr>', "Insert mode"},
          ["l"] = {':lua require"jonathf.terminal".exec_current_line()<cr>', "Execute current line"},
          ["o"] = {':lua require"jonathf.terminal".open()<cr>', "Open"},
          ["r"] = {':lua require"jonathf.terminal".exec_file()<cr>', "Execute file"},
        },
        ["t"] = {
          name = "+Terminal",
          ["gg"] = {':lua require"jonathf.terminal".do_("normal gg", "fish")<cr>', "Scroll top"},
          ["G"] = {':lua require"jonathf.terminal".do_("normal G", "fish")<cr>', "Scroll bottom"},
          ["j"] = {':lua require"jonathf.terminal".do_("normal <c-d>", "fish")<cr>', "Scroll down"},
          ["k"] = {':lua require"jonathf.terminal".do_("normal <c-u>", "fish")<cr>', "Scroll up"},
          ["c"] = {':lua require"jonathf.terminal".close("fish")<cr>', "Close"},
          ["f"] = {':lua require"jonathf.terminal".exec_file("fish")<cr>', "Execute fil"},
          ["i"] = {':lua require"jonathf.terminal".insert("fish")<cr>', "Insert mode"},
          ["l"] = {':lua require"jonathf.terminal".exec_current_line("fish")<cr>', "Execute current line"},
          ["o"] = {':lua require"jonathf.terminal".open("fish")<cr>', "Open terminal"},
          ["t"] = {':lua require"jonathf.terminal".exec_test("fish")<cr>', "Execute test"},
        },
        ["v"] = {
          name = "+Diffview",
          ["o"] = {':DiffviewOpen<cr>', "Open current buffer"},
          ["O"] = {':DiffviewOpen ', "Open .."},
          ["c"] = {':DiffviewClose<cr>', "Close"},
          ["h"] = {':DiffviewFileHistory %<cr>', "File history"},
        },
        ["w"] = {
          name = "+Window",
          ["h"] = {"<c-w>h"},
          ["j"] = {"<c-w>j"},
          ["k"] = {"<c-w>k"},
          ["l"] = {"<c-w>l"},
          ["v"] = {":vsplit<cr>", "Vertical split pane"},
          ["s"] = {":split<cr>", "Split pane"},
        },
      },
    })
  end
}
