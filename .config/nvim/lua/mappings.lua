vim.g["mapleader"] = " "

vim.api.nvim_set_keymap("i", "<c-s>", "<c-g>u<Esc>[s1z=`]a<c-g>u", {noremap = true})

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
      ["c"] = {":lua vim.lsp.buf.code_action()<cr>", "Code Action"}
    },
    ["s"] = {":set spell!<cr>", "Toggle spelling"},
    ["p"] = {
      name = "+Python",
      ["i"] = {':lua require"terminal".insert("ipython")<cr>', "Insert"},
      ["o"] = {':lua require"terminal".open("ipython")<cr>', "Open"},
      ["l"] = {':lua require"terminal".run_line"ipython"<cr>', "Run line"},
      ["f"] = {':lua require"terminal".run_file"ipython"<cr>', "Run file"},
      ["t"] = {':lua require"terminal".run_file{repl="fish", cmd="pytest -vv --doctest-modules"}<cr>', "Pytest"},
      ["d"] = {':lua require"terminal".run_file{repl="fish", cmd="pytest -vv --doctest-modules --pdb"}<cr>', "Debug"},
      ["c"] = {':lua require"terminal".close()<cr>', "Close"},
    },
  },
})
