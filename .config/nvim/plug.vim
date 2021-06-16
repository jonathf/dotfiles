call plug#begin()

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'wellle/targets.vim'

Plug 'chrisbra/Recover.vim'
let g:RecoverPlugin_Edit_Unmodified = 1

Plug 'osyo-manga/vim-anzu'
let g:anzu_status_format = "%/ %#WarningMsg#[%i/%l]"

Plug 'Vimjas/vim-python-pep8-indent', {'for': 'python'}
Plug 'cespare/vim-toml', {'for': 'toml'}
Plug 'jonathf/vim-fish', {'for': 'fish'}

Plug 'jamessan/vim-gnupg'

Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
let g:deoplete#enable_at_startup = 1
Plug 'Shougo/neco-vim', {'for': 'vim'}
Plug 'ujihisa/neco-look'
Plug 'deoplete-plugins/deoplete-jedi', {'for': 'python'}
Plug 'deoplete-plugins/deoplete-tag'
" Plug 'deoplete-plugins/deoplete-lsp'

Plug 'SirVer/ultisnips'
let g:UltiSnipsEditSplit="vertical"

" " Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
" Plug 'neovim/nvim-lspconfig'

Plug 'norcalli/nvim-colorizer.lua'

" " Plug 'untitled-ai/jupyter_ascending.vim', {'for': 'python'}
Plug 'nvim-lua/plenary.nvim'
" " Plug 'nvim-lua/popup.nvim'
" " Plug 'nvim-telescope/telescope.nvim'
Plug 'jonathf/harpoon'

call plug#end()

call deoplete#custom#source('ultisnips', 'rank', 9999)

lua require'colorizer'.setup()

lua << EOF
-- require'nvim-treesitter.configs'.setup{ 
--   ensure_installed = "maintained",
--   highlight = { enable = false }
-- }

-- local on_attach = function(client, bufnr)
--   local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
--   local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
-- 
--   buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
-- 
--   -- Mappings.
--   local opts = { noremap=true, silent=true }
--   buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
--   buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
--   buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
--   buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
--   buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
--   buf_set_keymap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
--   buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
--   buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
--   buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
--   buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
--   buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
--   buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
--   buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
--   buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
--   buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
--   buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
--   buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
-- 
--   -- Set some keybinds conditional on server capabilities
--   if client.resolved_capabilities.document_formatting then
--     buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
--   end
--   if client.resolved_capabilities.document_range_formatting then
--     buf_set_keymap("v", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
--   end
-- end
-- 
-- require'lspconfig'.pyls.setup{
--     cmd = {(os.getenv("VIRTUAL_ENV") or os.getenv("HOME").."/.config/nvim/venv").."/bin/pyls"},
--     -- on_attach = on_attach,
-- }
-- require'lspconfig'.bashls.setup()
-- require'lspconfig'.vimls.setup()
-- require'lspconfig'.texlab.setup()
EOF
