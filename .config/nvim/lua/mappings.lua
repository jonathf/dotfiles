vim.g["mapleader"] = " "
vim.g["UltiSnipsExpandTrigger"] = "<nop>"
vim.g["UltiSnipsListSnippets"] = "<nop>"
vim.g["UltiSnipsJumpForwardTrigger"] = "<nop>"
vim.g["UltiSnipsJumpBackwardTrigger"] = "<nop>"

vim.cmd[[
function! ExpandJumpIterateTab()
    let out = ""
    if col('.') == 1 || getline('.')[col('.')-2] == " "
       let out = "\<tab>"
    "elseif UltiSnips#CanExpandSnippet()
    "  call UltiSnips#ExpandSnippet()
    elseif luasnip#expand_or_jumpable()
      lua require"luasnip".expand_or_jump()
    elseif pumvisible()
      let out = "\<c-n>"
    else
      let out = "\<c-n>"
    endif
    return out
endfunction
inoremap <silent> <tab> <C-R>=g:ExpandJumpIterateTab()<cr>]]

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
vim.api.nvim_set_keymap("n", "ø", ":silent exec ':cd '.fnamemodify(expand('%'), ':h')<cr>:vs<cr>:terminal<cr>", { noremap = true })

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
    ["b"] = { ":bprev<cr>", "Previous buffer" },
    ["c"] = { ":cprev<cr>", "Previous error" },
    ["h"] = { ":lua require'gitsigns'.prev_hunk()<cr>", "Previous git hunk" },
    ["s"] = { "[s", "Previous spelling error" },
    ["l"] = { ":lua vim.lsp.diagnostic.goto_prev()<cr>", "Previous LSP error" },
    ["u"] = { ":call UltiSnips#JumpBackwards<cr>", "Previous snippet" },
  },
  ["<leader>"] = {
    ["<leader>"] = {":ls<cr>:buffer ", "Change buffer .."},
    ["s"] = {
      name = "+Spell",
      ["s"] = {":set spell!<cr>" },
      ["="] = {"z=", "suggest" },
      ["g"] = {"zg", "insert" },
    },
    ["g"] = {
      name = "+Git",
      ["g"] = { ":Git ", "git .." },
      ["d"] = { ":Gitsigns diffthis<cr>", "git diff" },
      ["D"] = { ":Gitsigns diffthis ", "git diff .." },
      ["s"] = { ":lua require'gitsigns'.stage_hunk()<cr>", "Stage hunk" },
      ["S"] = { ":lua require'gitsigns'.stage_buffer()<cr>", "Stage buffer" },
      ["r"] = { ":lua require'gitsigns'.reset_hunk()<cr>", "Reset hunk" },
      ["R"] = { ":lua require'gitsigns'.reset_buffer()<cr>", "Reset buffer" },
      ["U"] = { ":lua require'gitsigns'.reset_buffer_index()<cr>", "Reset buffer hard" },
      ["u"] = { ":lua require'gitsigns'.undo_stage_hunk()<cr>", "Unstage hunk" },
      ["p"] = { ":lua require'gitsigns'.preview_hunk()<cr>", "Preview hunk" },
      ["b"] = { ":lua require'gitsigns'.blame_line()<cr>", "Blame line" },
      ["B"] = { ":Git blame<cr>", "Blame buffer" },
    },
    ["d"] = {
      name = "+DAP",
      ["c"] = {":lua require'dap'.continue()<cr>", "Continue/Run"},
      ["b"] = {":lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint"},
      ["n"] = {":lua require'dap'.step_over()<cr>", "Next"},
      ["i"] = {":lua require'dap'.step_into()<cr>", "Into"},
      ["o"] = {":lua require'dap'.step_out()<cr>", "Out"},
      ["p"] = {":lua require'dap'.pause()<cr>", "Pause thread"},
      ["d"] = {":lua require'dap'.repl.open(nil, 'belowright vsplit')<cr>", "REPL"},
      ["a"] = {":lua require'dap'.disconnect()<cr>:lua require'dap'.close()<cr>", "Abort"},
      ["f"] = {":lua require'dap-python'.test_method()<cr>"},
      ["t"] = {":lua require'dap-python'.test_class()<cr>"},
    },
    ["l"] = {
      name = "+LSP",
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
    ["o"] = {
      name = "+Norg",
      ["d"] = {":Neorg keybind all core.norg.qol.todo_items.todo.task_done<cr>", "Task done"},
      ["u"] = {":Neorg keybind all core.norg.qol.todo_items.todo.task_undone<cr>", "Task undone"},
      ["p"] = {":Neorg keybind all core.norg.qol.todo_items.todo.task_pending<cr>", "Task pending"},
      ["t"] = {":Neorg keybind all core.norg.qol.todo_items.todo.task_cycle<cr>", "Task toggle" }
    },
  },
})
