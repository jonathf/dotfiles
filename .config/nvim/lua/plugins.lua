-- Auto-rebuild on changes
vim.cmd [[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]]

-- Install Packer if missing
local install_path = vim.fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
  vim.api.nvim_command "packadd packer.nvim"
end

-- Packer package manager --
----------------------------
return require("packer").startup(function()
  use "wbthomason/packer.nvim"

  use {"terrortylor/nvim-comment",
    config = function() require"nvim_comment".setup{ line_mapping = "--", operator_mapping = "-"} end}

  -- use "tpope/vim-fugitive"
  use "wellle/targets.vim"

  use "chrisbra/Recover.vim"
  vim.g["RecoverPlugin_Edit_Unmodified"] = 1

  use "osyo-manga/vim-anzu"
  vim.g["anzu_status_format"] = "%/ %#WarningMsg#[%i/%l]"

  -- Filetype specific --
  -----------------------
  use {"Vimjas/vim-python-pep8-indent", ft = {"python"}}
  use {"cespare/vim-toml", ft = {"toml"}}
  use {"jonathf/vim-fish", ft = {"fish"}}
  use {"euclidianAce/BetterLua.vim", ft = {"lua"}}
  use "jamessan/vim-gnupg"
  use {"vhyrro/neorg", run = ":TSInstall norg", config = function()
    require"neorg".setup{
      load = {["core.defaults"] = {}}}
    local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()
    parser_configs.norg = {
        install_info = {
            url = "https://github.com/vhyrro/tree-sitter-norg",
            files = { "src/parser.c" },
            branch = "main"
        },
    }
  end}

  use {"hrsh7th/nvim-compe",
       config = function() require"compe".setup{
          documentation = false,
          source = {path = true, nvim_lsp = true, ultisnips = true, neorg = true},
       } end}
  use {"folke/which-key.nvim",
       config = function() require("which-key").setup{
         plugins = {spelling = {enabled = true, suggestions = 40}}} end}

  use {"SirVer/ultisnips"}
  vim.g["UltiSnipsEditSplit"] = "vertical"
  use {"L3MON4D3/LuaSnip"}

  use {"lewis6991/gitsigns.nvim", requires = "nvim-lua/plenary.nvim",
    config = function() require"gitsigns".setup{
      keymaps = {noremap = false}, yadm = {enable = true}} end}

  -- Theme: Tomorrow-Night --
  ---------------------------
  use {"marko-cerovac/material.nvim", config = function()
    vim.g.material_style = 'darker'
    vim.g.material_disable_background = true
    vim.g.material_disable_teminal = true
    vim.g.material_custom_colors = {
      white        =  '#ffffff', gray         =  '#c5c8c6', variable     =  '#c5c8c6',
      black        =  '#1d1f21', red          =  '#cc6666', green        =  '#b5bd68',
      yellow       =  '#f0c674', blue         =  '#81a2be', paleblue     =  '#5f819d',
      cyan         =  '#8abeb7', purple       =  '#b294bb', orange       =  '#de935f',
      pink         =  '#85678f', error        =  '#a54242', link         =  '#5e8d87',
      cursor       =  '#ffffff', fg           =  '#e0e0e0', text         =  '#727272',
      comments     =  '#616161', disabled     =  '#474747', line_numbers =  '#424242',
      selection    =  '#404040', highlight    =  '#373b41', active       =  '#323232',
      border       =  '#282a2e', contrast     =  '#1d1f21', accent       =  '#FF9800',
      sidebar      =  '#282a2e', float        =  '#282a2e',
    }
    require"material".set()
  end}

  use {"norcalli/nvim-colorizer.lua",
    config = function() require"colorizer".setup{} end}

  -- Treesitter --
  ----------------
  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate", config = function()
    require'nvim-treesitter.configs'.setup{
      ensure_installed = "maintained",
      highlight = {enable = true},
      indent = {enable = true},
    }
  end}
  use {"nvim-treesitter/playground"}

  -- Language Server Protocol --
  ------------------------------
  use {"neovim/nvim-lspconfig", config = function() require"lspconfig".pylsp.setup{
    settings = {pylsp = {plugins = {pylint = {enabled = true, args = {}, executable = "pylint"}}}}
  } end}
  use {"tjdevries/nlua.nvim", requires = {"neovim/nvim-lspconfig"},
       config = function() require"nlua.lsp.nvim".setup(require("lspconfig"),
       {globals = {"awesome", "screen", "client", "root"},
        library = {["/usr/share/awesome/lib"] = true},
      }) end}
  use {"ray-x/lsp_signature.nvim",
       config = function() require"lsp_signature".setup{
       doc_lines = 0, floating_window = false, hint_prefix = ""} end}
  use {"ahmedkhalf/lsp-rooter.nvim", config = function() require("lsp-rooter").setup{} end}

  -- Debug Adapter Protocol --
  ----------------------------
  use {"mfussenegger/nvim-dap", config = function()
    local dap = require("dap")
    dap.adapters.python = {
      type = "executable",
      command = vim.fn.stdpath("config").."/venv/bin/python",
      args = { "-m", "debugpy.adapter" },
    }
    dap.configurations.python = {{
      type = "python",
      request = "launch",
      program = "${file}",
      pythonPath = function() return os.getenv("VIRTUAL_ENV").."/bin/python" end,
    }}
  end}
  use {"mfussenegger/nvim-dap-python", requires = {"nvim-dap", "nvim-treesitter"}, config = function()
    local dappy = require"dap-python"
    dappy.setup(vim.fn.stdpath("config").."/venv/bin/python")
    dappy.test_runner = 'pytest'
  end}
  use {"theHamsta/nvim-dap-virtual-text", requires = {"nvim-dap", "nvim-treesitter"}, config = function()
    vim.g.dap_virtual_text = true
  end}

  use {"/home/jonathf/source/tangle.nvim", requires = {"nvim-treesitter/nvim-treesitter"}}
  use {"michaelb/sniprun", run = "bash install.sh"}

end)
