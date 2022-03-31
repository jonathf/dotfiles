vim.g["mapleader"] = " "

vim.api.nvim_set_keymap("i", "<c-s>", "<c-g>u<Esc>[s1z=`]a<c-g>u", {noremap = true})

-- LUASNIPS COMMAND --
vim.api.nvim_set_keymap("i", "<c-k>", "<cmd>lua if require'luasnip'.expand_or_jumpable() then require'luasnip'.expand_or_jump() end<cr>", {noremap = true})
-- vim.api.nvim_set_keymap("i", "<c-j>", "<cmd>lua if require'luasnip'.choice_active() then require'luasnip'.change_choice(-1) end<cr>", {noremap = true})
vim.api.nvim_set_keymap("s", "<c-k>", "<cmd>lua if require'luasnip'.expand_or_jumpable() then require'luasnip'.expand_or_jump() end<cr>", {noremap = true})
vim.api.nvim_set_keymap("s", "<c-j>", "<cmd>lua if require'luasnip'.choice_active() then require'luasnip'.change_choice(-1) end<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "<c-k>", ":lua if require'luasnip'.expand_or_jumpable() then require'luasnip'.expand_or_jump() end<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "<c-j>", ":lua if require'luasnip'.choice_active() then require'luasnip'.change_choice(-1) end<cr>", {noremap = true})

-- MY ESCAPE SEQUENCES --
vim.api.nvim_set_keymap("t", "<esc>", "<c-\\><c-n>", {noremap = true})
vim.api.nvim_set_keymap("n", "<esc>", "<esc>:silent! nohls<cr><Plug>(anzu-clear-search-status)", {})


-- IMPROVE THE DEFAULTS --
vim.api.nvim_set_keymap("n", "n", "<Plug>(anzu-n-with-echo)", {})
vim.api.nvim_set_keymap("n", "N", "<Plug>(anzu-N-with-echo)", {})
vim.api.nvim_set_keymap("n", "*", "<Plug>(anzu-star-with-echo)", {})
vim.api.nvim_set_keymap("n", "#", "<Plug>(anzu-sharp-with-echo)", {})

-- SOME PREFERRED CHANGES --
vim.api.nvim_set_keymap("n", "s", ":w<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "D", ":quit<cr>", {noremap = true})

-- CTRL-MOVE --
vim.api.nvim_set_keymap("n", "<c-l>", "<c-w>l", {noremap = true})
vim.api.nvim_set_keymap("n", "<c-h>", "<c-w>h", {noremap = true})
vim.api.nvim_set_keymap("i", "<c-l>", "<esc><c-w>l", {noremap = true})
vim.api.nvim_set_keymap("i", "<c-h>", "<esc><c-w>h", {noremap = true})
vim.api.nvim_set_keymap("t", "<c-l>", "<c-\\><c-n><c-w>l", {noremap = true})
vim.api.nvim_set_keymap("t", "<c-h>", "<c-\\><c-n><c-w>h", {noremap = true})

-- JUMPING --
vim.api.nvim_set_keymap("n", "<c-u>", "<c-u>zz", {noremap = true})
vim.api.nvim_set_keymap("n", "<c-d>", "<c-d>zz", {noremap = true})

vim.api.nvim_set_keymap("n", "å", ":Gcd<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "æ", ":exec ':cd '.fnamemodify(expand('%'), ':h')<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "ø", ':lua require"terminal".insert"fish"<cr>', {noremap = true})
-- vim.api.nvim_set_keymap("n", "ø", ":silent exec ':cd '.fnamemodify(expand('%'), ':h')<cr>:vs<cr>:terminal<cr>", {noremap = true})

require'which-key'.register({
  -- ["ø"] = {':lua require"terminal".open"fish"<cr>', "Open terminal"},
  ["]"] = {
    name = "+Next",
    ["b"] = { ":bnext<cr>", "Next buffer" },
    ["c"] = { ":cnext<cr>", "Next error" },
    ["g"] = { ":lua require'gitsigns'.next_hunk()<cr>", "Next git hunk" },
    ["s"] = { "]s", "Next spelling error" },
    ["l"] = { ":lua vim.lsp.diagnostic.goto_next()<cr>", "Next LSP error" },
  },
  ["["] = {
    name = "+Previous",
    ["b"] = { ":bprev<cr>", "Previous buffer" },
    ["c"] = { ":cprev<cr>", "Previous error" },
    ["g"] = { ":lua require'gitsigns'.prev_hunk()<cr>", "Previous git hunk" },
    ["s"] = { "[s", "Previous spelling error" },
    ["l"] = { ":lua vim.lsp.diagnostic.goto_prev()<cr>", "Previous LSP error" },
  },
  ["<leader>"] = {
    ["<leader>"] = {":ls<cr>:buffer <c-d>", "Change buffer .."},
    ["a"] = {
      name = "+Args",
      ["a"] = {":argadd <c-r>=fnameescape(expand('%:p:h'))<cr>/*<c-d>", "Add current file"},
    },
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
      ["s"] = {":lua vim.lsp.buf.signature_help()<cr>", "Signature"},
      ["h"] = {":lua vim.lsp.buf.hover()<cr>", "Hover"},
      ["r"] = {":lua vim.lsp.buf.rename()<cr>", "Rename"},
      ["i"] = {":lua vim.lsp.buf.incoming_calls()<cr>", "Incomming"},
      ["o"] = {":lua vim.lsp.buf.outgoing_calls()<cr>", "Outgoing"},
      ["a"] = {":lua vim.lsp.buf.code_action()<cr>", "Code Action"}
    },
    ["r"] = {
      name = "+Reload",
      ["v"] = {":luafile ~/.config/nvim/init.lua<cr>", "Vim"},
      ["c"] = {":luafile %<cr>", "Current"},
    },
    ["s"] = {":set spell!<cr>", "Toggle spelling"},
    ["p"] = {
      ["c"] = {':lua require"terminal".close()<cr>', "Close"},
    },
  },
})

vim.cmd [[
autocmd FileType python :lua whichkeyPython()
autocmd FileType r :lua whichkeyR()
autocmd FileType lua :lua whichkeyLua()
]]

_G.whichkeyPython = function()
  local buf = vim.api.nvim_get_current_buf()
  require'which-key'.register({
    ["<leader>"] = {
      ["p"] = {
        name = "+Python",
        ["i"] = {':lua require"terminal".insert"ipython --nosep"<cr>', "IPython", buffer = buf},
        ["o"] = {':lua require"terminal".open"ipython --nosep"<cr>', "Open", buffer = buf},
        ["l"] = {':lua require"terminal".run_line"ipython --nosep"<cr>', "Run line", buffer = buf},
        ["r"] = {':lua require"terminal".run_file"ipython --nosep"<cr>', "Run file", buffer = buf},
        ["f"] = {':exec "!tidy-imports --black --replace-star-import --action REPLACE ".bufname("%") | exec "!black ".bufname("%") | e <cr>', "Format", buffer = buf},
        ["t"] = {':lua require"terminal".run_file{repl="fish", cmd="pytest -vv --doctest-modules"}<cr>', "Pytest", buffer = buf},
        ["d"] = {':lua require"terminal".run_file{repl="fish", cmd="pytest -vv --doctest-modules --pdb"}<cr>', "Debug", buffer = buf},
    },
    },
  })
end

_G.whichkeyR = function()
  local buf = vim.api.nvim_get_current_buf()
  require'which-key'.register({
    ["<leader>"] = {
      ["p"] = {
        name = "+R",
        ["i"] = {':lua require"terminal".insert"R -q"<cr>', "Radian", buffer = buf},
        ["o"] = {':lua require"terminal".open"R -q"<cr>', "Open", buffer = buf},
        ["l"] = {':lua require"terminal".run_line"R -q"<cr>', "Run line", buffer = buf},
        ["r"] = {':lua require"terminal".run_file"R -q"<cr>', "Run file", buffer = buf},
        ["f"] = {':exec !R -q -e "library(\"formatR\"); args = commandArgs(trailingOnly=TRUE); formatR::tidy_source(args[1], file=args[1])"', "Format", buffer = buf},
      },
    },
  })
end

_G.whichkeyLua = function()
  local buf = vim.api.nvim_get_current_buf()
  require'which-key'.register({
    ["<leader>"] = {
      ["p"] = {
        name = "+Lua",
        ["f"] = {':exec "!lua-format -i ".bufname("%")<cr>', "Format", buffer = buf},
      },
    },
  })
nd
