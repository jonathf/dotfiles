-- Auto-rebuild on changes
vim.cmd [[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]]

-- Install Packer if missing
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.api.nvim_command 'packadd packer.nvim'
end

-- Packer package manager --
----------------------------
return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use { 'terrortylor/nvim-comment', config = function()
    require'nvim_comment'.setup{ line_mapping = "--", operator_mapping = "-" } end }

  use 'tpope/vim-fugitive'
  use 'wellle/targets.vim'

  use 'chrisbra/Recover.vim'
  vim.g['RecoverPlugin_Edit_Unmodified'] = 1

  use 'osyo-manga/vim-anzu'
  vim.g['anzu_status_format'] = '%/ %#WarningMsg#[%i/%l]'

  use { 'Vimjas/vim-python-pep8-indent', ft = { 'python' },
        requires = { 'neovim/nvim-lspconfig' },
        config = function() require'lspconfig'.pylsp.setup{} end}
  use { 'cespare/vim-toml', ft = { 'toml' } }
  use { 'jonathf/vim-fish', ft = { 'fish' } }
  use { 'euclidianAce/BetterLua.vim', ft = { 'lua' } }

  use 'jamessan/vim-gnupg'
  use { "jonathf/FTerm.nvim",
      config = function() require("FTerm").setup() end }

  -- use { 'Shougo/deoplete.nvim', run = ':UpdateRemotePlugins',
  --       config = function() vim.fn['deoplete#custom#source']('ultisnips', 'rank', 9999) end }
  -- use { 'deoplete-plugins/deoplete-lsp' }
  -- vim.g['deoplete#enable_at_startup'] = 1
  use { 'hrsh7th/nvim-compe',
        config = function() require'compe'.setup{
          documentation = false,
          source = { path = true, nvim_lsp = true, ultisnips = true },
        } end }
  use { "folke/which-key.nvim",
        config = function() require("which-key").setup {
          plugins = { spelling = { enabled = true, suggestions = 40, } } } end }

  use { 'SirVer/ultisnips' }
  vim.g['UltiSnipsEditSplit'] = 'vertical'

  use { 'norcalli/nvim-colorizer.lua',
        config = function() require'colorizer'.setup{} end }

  use { 'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim',
        config = function() require'gitsigns'.setup{
          yadm = { enable = true } } end }

  -- Language Server Protocol --
  ------------------------------
  use { 'neovim/nvim-lspconfig' }
  use { 'tjdevries/nlua.nvim', requires = { "neovim/nvim-lspconfig" },
        config = function() require'nlua.lsp.nvim'.setup(require('lspconfig'), {}) end }
  use { 'ray-x/lsp_signature.nvim',
      config = function() require'lsp_signature'.setup{
        doc_lines = 0, floating_window = false, hint_prefix = "" } end }

  -- Debug Adapter Protocol --
  ----------------------------
  use { 'mfussenegger/nvim-dap', config = function()
    local dap = require('dap')
    dap.adapters.python = {
      type = 'executable',
      command = os.getenv('HOME')..'/.config/nvim/venv/bin/python',
      args = { '-m', 'debugpy.adapter' },
    }
    dap.configurations.python = {{
      type = 'python',
      request = 'launch',
      program = '${file}',
      pythonPath = function() return os.getenv('VIRTUAL_ENV')..'/bin/python' end,
    }}
  end }

end)
