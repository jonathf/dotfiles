local cmp = require"cmp"

-- _G.tab_complete = function()
--     local col = vim.fn.col('.') - 1
--     if luasnip.expand_or_jumpable() then
--         luasnip.expand_or_jump()
--     elseif cmp.visible() then
--         cmp.select_next_item()
--     elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
--         return vim.api.nvim_replace_termcodes("<tab>", true, true, true)
--     else
--         cmp.complete()
--     end
--     return ""
-- end
-- _G.s_tab_complete = function()
--     if cmp.visible() then
--         cmp.select_prev_item()
--     elseif luasnip.jumpable(-1) then
--         cmp.jump(-1)
--     else
--         return vim.api.nvim_replace_termcodes("<s-tab>", true, true, true)
--     end
--     return ""
-- end
-- _G.escape = function()
--   if cmp.visible() then cmp.close()
--   else vim.cmd[[:stopinsert]] end
-- end

-- vim.cmd[[
-- function! SuperTab()
--     if luasnip#expand_or_jumpable()
--       lua require"luasnip".expand_or_jump()
--       return ""
--     endif
--     if pumvisible()
--       return "\<down>"
--     endif
--     if col('.') == 1 || getline('.')[col('.')-2] == " "
--        return "\<tab>"
--     endif
--     return "\<c-n>"
-- endfunction
-- inoremap <silent> <tab> <C-R>=g:SuperTab()<cr>
-- ]]

-- vim.cmd[[imap <tab> <plug>luasnip-expand-or-jump]]
-- vim.api.nvim_set_keymap("i", "<tab>", "v:lua.tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("s", "<tab>", "v:lua.tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("i", "<s-tab>", "v:lua.s_tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("s", "<s-tab>", "v:lua.s_tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("i", "<c-e>", "<Plug>luasnip-next-choice", {})
-- vim.api.nvim_set_keymap("s", "<c-e>", "<Plug>luasnip-next-choice", {})

vim.g["mapleader"] = " "

-- MY ESCAPE SEQUENCES --
vim.api.nvim_set_keymap("t", "<esc>", "<c-\\><c-n>", { noremap = true })
vim.api.nvim_set_keymap("n", "<esc>", "<esc>:silent! nohls<cr><Plug>(anzu-clear-search-status)", {})

-- IMPROVE THE DEFAULTS --
vim.api.nvim_set_keymap("n", "n", "<Plug>(anzu-n-with-echo)", {})
vim.api.nvim_set_keymap("n", "N", "<Plug>(anzu-N-with-echo)", {})
vim.api.nvim_set_keymap("n", "*", "<Plug>(anzu-star-with-echo)", {})
vim.api.nvim_set_keymap("n", "#", "<Plug>(anzu-sharp-with-echo)", {})

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
    ["1"] = {":buffer 1<cr>", "Change to buffer 1"},
    ["2"] = {":buffer 2<cr>", "Change to buffer 2"},
    ["3"] = {":buffer 3<cr>", "Change to buffer 3"},
    ["4"] = {":buffer 4<cr>", "Change to buffer 4"},
    ["5"] = {":buffer 5<cr>", "Change to buffer 5"},
    ["6"] = {":buffer 6<cr>", "Change to buffer 6"},
    ["7"] = {":buffer 7<cr>", "Change to buffer 7"},
    ["8"] = {":buffer 8<cr>", "Change to buffer 8"},
    ["9"] = {":buffer 9<cr>", "Change to buffer 9"},
    ["<leader>"] = {":ls<cr>:buffer ", "Change buffer .."},
    ["s"] = {":set spell!<cr>", "Toggle spelling"},
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
      ["t"] = {":Neorg keybind all core.norg.qol.todo_items.todo.task_cycle<cr>", "Task toggle" },
    },
    ["t"] = {
      name = "+Term",
      ["t"] = {":exec ':cd '.fnamemodify(expand('%'), ':h')<cr>:exec ':vs term://pytest '.expand('%')<cr>", "Pytest"},
      ["T"] = {":exec ':cd '.fnamemodify(expand('%'), ':h')<cr>:exec ':vs term://pytest --pdb '.expand('%')<cr>", "PDB (post mortem)"},
      ["i"] = {":exec ':cd '.fnamemodify(expand('%'), ':h')<cr>:vs<cr>:terminal ipython --nosep -i", "IPython"},
      ["p"] = {":exec ':cd '.fnamemodify(expand('%'), ':h')<cr>:exec ':vs term://ipython --nosep -i -- '.expand('%')<cr>", "Python run"},
    },
  },
})
