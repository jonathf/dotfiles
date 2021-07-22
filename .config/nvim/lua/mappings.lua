vim.g["mapleader"] = " "
vim.g["UltiSnipsExpandTrigger"] = "<nop>"
vim.g["UltiSnipsListSnippets"] = "<nop>"
vim.g["UltiSnipsJumpForwardTrigger"] = "<nop>"
vim.g["UltiSnipsJumpBackwardTrigger"] = "<nop>"

-- function expand_jump_iterate_tab()
--     local out = ""
--     if vim.fn.UltiSnips#CanExpandSnippet() then
--       vim.fn.UltiSnips#ExpandSnippet()
--     else if pumvisible() then
--       out = "\\<c-n>"
--     else if col('.') == 1 || getline('.')[col('.')-2] == " " then
--       out = "\\\<tab>"
--     else
--       let out = "\<c-n>"
--     end
--     return out
-- end
-- inoremap <silent> <tab> <C-R>=g:ExpandJumpIterateTab()<cr>

-- MY ESCAPE SEQUENCES --
vim.api.nvim_set_keymap("t", "<esc>", "<c-\\><c-n>", { noremap = true })
vim.api.nvim_set_keymap("n", "<esc>", "<esc>:silent! nohls<cr><Plug>(anzu-clear-search-status)", {})

-- IMPROVE THE DEFAULTS --
vim.api.nvim_set_keymap("n", "n", "<Plug>(anzu-n-with-echo)<Plug>(anzu-smart-sign-matchline)", {})
vim.api.nvim_set_keymap("n", "N", "<Plug>(anzu-N-with-echo)<Plug>(anzu-smart-sign-matchline)", {})
vim.api.nvim_set_keymap("n", "*", "<Plug>(anzu-star-with-echo)<Plug>(anzu-smart-sign-matchline)", {})
vim.api.nvim_set_keymap("n", "#", "<Plug>(anzu-sharp-with-echo)<Plug>(anzu-smart-sign-matchline)", {})

-- SOME PREFERRED CHANGES --
vim.api.nvim_set_keymap("n", "s", ":w<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "D", ":quit<cr>", { noremap = true })

-- CTRL-MOVE --
vim.api.nvim_set_keymap("n", "<c-l>", "<c-w>l", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-h>", "<c-w>h", { noremap = true })
vim.api.nvim_set_keymap("i", "<c-l>", "<esc><c-w>l", { noremap = true })
vim.api.nvim_set_keymap("i", "<c-k>", "<esc><c-w>k", { noremap = true })
vim.api.nvim_set_keymap("t", "<c-l>", "<c-\\><c-n><c-w>l", { noremap = true })
vim.api.nvim_set_keymap("t", "<c-h>", "<c-\\><c-n><c-w>h", { noremap = true })

-- JUMPING --
vim.api.nvim_set_keymap("n", "<c-u>", "<c-u>zz", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-d>", "<c-d>zz", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-f>", "<c-f>zz", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-s>", "<c-s>zz", { noremap = true })

vim.api.nvim_set_keymap("i", "<C-s>", "<c-o>:lua vim.lsp.buf.signature_help()<cr>", { noremap = true })

vim.api.nvim_set_keymap("n", "å", ":Gcd<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "æ", ":exec ':cd '.fnamemodify(expand('%'), ':h')<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "ø", ":exec ':cd '.fnamemodify(expand('%'), ':h')<cr> :lua require'FTerm'.open()<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "Ø", ":silent exec ':cd '.fnamemodify(expand('%'), ':h')<cr>:vs<cr>:terminal<cr>", { noremap = true })

require'which-key'.register({
  ["]"] = {
    name = "+Next",
    ["b"] = { ":bnext<cr>", "Next buffer" },
    ["c"] = { ":cnext<cr>", "Next error" },
    ["h"] = { ":lua require'gitsigns'.next_hunk()<cr>", "Next git hunk" },
    ["s"] = { "]s", "Next spelling error" },
    ["l"] = { ":lua vim.lsp.diagnostic.goto_next()<cr>", "Next LSP error" },
    ["u"] = { ":call UltiSnips#JumpForward<cr>", "Next snippet" },
  },
  ["["] = {
    name = "+Previous",
    ["b"] = { ":bprev<cr>", "Next buffer" },
    ["c"] = { ":cprev<cr>", "Next error" },
    ["h"] = { ":lua require'gitsigns'.prev_hunk()<cr>", "Next git hunk" },
    ["s"] = { "[s", "Spell" },
    ["l"] = { ":lua vim.lsp.diagnostic.goto_prev()<cr>", "Next LSP error" },
    ["u"] = { ":call UltiSnips#JumpBackwards<cr>", "Next snippet" },
  },
  ["<leader>"] = {
    ["<leader>"] = {":ls<cr>:b<space>", "Change buffer .."},
    ["s"] = {
      name = "+Spell",
      ["s"] = {":set spell!<cr>" },
      ["]"] = {"]s", "next" },
      ["["] = {"[s", "previous" },
      ["="] = {"z=", "suggest" },
      ["g"] = {"zg", "insert" },
    },
    ["g"] = {
      name = "+Git",
      ["]"] = { ":lua require'gitsigns'.next_hunk()<cr>", "Next hunk" },
      ["["] = { ":lua require'gitsigns'.prev_hunk()<cr>", "Previous hunk" },
      ["g"] = { ":Git ", "git .." },
      ["d"] = { ":Gvdiffsplit! ", "git diff .." },
      ["s"] = { ":lua require'gitsigns'.stage_hunk()<cr>", "Stage hunk" },
      ["S"] = { ":lua require'gitsigns'.stage_buffer()<cr>", "Stage buffer" },
      ["r"] = { ":lua require'gitsigns'.reset_hunk()<cr>", "Reset hunk" },
      ["R"] = { ":lua require'gitsigns'.reset_buffer()<cr>", "Reset buf" },
      ["U"] = { ":lua require'gitsigns'.reset_buffer_index()<cr>", "Reset hard" },
      ["u"] = { ":lua require'gitsigns'.undo_stage_hunk()<cr>", "Unstage hunk" },
      ["p"] = { ":lua require'gitsigns'.preview_hunk()<cr>", "Preview" },
      ["b"] = { ":lua require'gitsigns'.blame_line()<cr>", "Blame line" },
      ["B"] = { ":Git blame<cr>", "Blame buffer" },
    },
    ["d"] = {
      name = "+DAP",
      ["c"] = { ":lua require'dap'.continue()<cr>", "Continue" },
      ["b"] = { ":lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint" },
      ["n"] = { ":lua require'dap'.step_over()<cr>", "Step over" },
      ["i"] = { ":lua require'dap'.step_into()<cr>", "Step into" },
      ["o"] = { ":lua require'dap'.step_out()<cr>", "Step out" },
      ["d"] = { ":lua require'dap'.repl.open(nil, 'belowright vsplit')<cr>", "REPL" },
    },
    ["l"] = {
      name = "+LSP",
      ["]"] = { ":lua vim.lsp.diagnostic.goto_next()<cr>", "Next" },
      ["["] = { ":lua vim.lsp.diagnostic.goto_prev()<cr>", "Previous" },
      ["s"] = { ":lua vim.lsp.buf.signature_help()<cr>", "Signature" },
      ["h"] = { ":lua vim.lsp.buf.hover()<cr>", "Hover" },
      ["a"] = { ":lua vim.lsp.buf.references()<cr>", "References" },
      ["r"] = { ":lua vim.lsp.buf.rename()<cr>", "Rename" },
      ["d"] = { ":lua vim.lsp.buf.implementation()<cr>", "Implementation" },
      ["i"] = { ":lua vim.lsp.buf.incoming_calls()<cr>", "Incomming" },
      ["o"] = { ":lua vim.lsp.buf.outgoing_calls()<cr>", "Outgoing" },
      ["f"] = { ":lua vim.lsp.buf.range_formatting()<cr>", "Format" },
      ["t"] = { ":lua vim.lsp.buf.type_definition()<cr>", "Type definition" },
    },
    ["t"] = {
      name = "+Term",
      ["o"] = { ":lua require'FTerm.terminal':new():setup():open()<cr>", ""},
      ["i"] = { ":lua require'FTerm.terminal':new{ cmd = 'ipython\n' }:setup():open()<cr>", ""},
      ["t"] = { ":lua require'FTerm.terminal':new():setup():run('t '..vim.fn.expand('%')..'\n' )<cr>", ""},
    },
  },
})
