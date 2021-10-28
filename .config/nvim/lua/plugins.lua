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

  use {"terrortylor/nvim-comment", config = function()
    require"nvim_comment".setup{line_mapping = "--", operator_mapping = "-"} end}

  -- use "tpope/vim-fugitive"
  use "wellle/targets.vim"

  use {"chrisbra/Recover.vim", config = function()
    vim.g["RecoverPlugin_Edit_Unmodified"] = 1
  end}

  use {"osyo-manga/vim-anzu", config = function()
    vim.g["anzu_status_format"] = "%p %#WarningMsg#[%i/%l]"
  end}

  use {"folke/which-key.nvim",
       config = function() require("which-key").setup{
         plugins = {spelling = {enabled = true, suggestions = 40}}} end}
  use {"lewis6991/gitsigns.nvim", requires = "nvim-lua/plenary.nvim",
    config = function() require"gitsigns".setup{
      keymaps = {noremap = false}, yadm = {enable = true}} end}
  -- use {"windwp/windline.nvim", config = function()
  --   require"wlsample.airline"
  --   vim.cmd[[:WindLineFloatToggle]]
  -- end}

  -- Filetype specific --
  -----------------------
  use {"cespare/vim-toml", ft = {"toml"}}
  use {"jonathf/vim-fish", ft = {"fish"}}
  use {"euclidianAce/BetterLua.vim", ft = {"lua"}}
  use {"zorab47/vim-gams"}
  use {"Vimjas/vim-python-pep8-indent", ft = {"python"}}
  -- use {"Valloric/python-indent"}

  use "jamessan/vim-gnupg"
  use {"nvim-neorg/neorg", run = ":TSInstall norg", requires = {"nvim-lua/plenary.nvim"},
    config = function()
    require"neorg".setup{
      load = {
          ["core.defaults"] = {},
          ["core.norg.completion"] = {config = {engine = "nvim-cmp"}},
      },
    }
    local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()
    parser_configs.norg = {
        install_info = {
            url = "https://github.com/nvim-neorg/tree-sitter-norg",
            files = { "src/parser.c", "src/scanner.cc" },
            branch = "main"
        },
    }
  end}

  -- Completion --
  ----------------
  use {"hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-path", "hrsh7th/cmp-nvim-lua", "ray-x/cmp-treesitter",
      "nvim-neorg/neorg",
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require"cmp"
      local luasnip = require"luasnip"
      cmp.setup{
        -- documentation = false,
        snippet = {expand = function(args) require('luasnip').lsp_expand(args.body) end},
        experimental = {
          native_menu = false,
          ghost_text = true,
        },
        sources = {
          {name = "path"},
          {name = "nvim_lua"},
          {name = "nvim_lsp"},
          {name = "luasnip"},
          {name = "neorg"},
          {name = "treesitter", keyword_length = 5},
          {name = "cmp_gh_issues"},
        },
        mapping = {
          ['<C-n>'] = cmp.mapping.select_next_item{behavior = cmp.SelectBehavior.Insert},
          ['<C-p>'] = cmp.mapping.select_prev_item{behavior = cmp.SelectBehavior.Insert},
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-y>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.close(),
          ['<CR>'] = cmp.mapping.confirm{behavior = cmp.ConfirmBehavior.Replace, select = false},
          ["<tab>"] = cmp.mapping(function(fallback)
            if luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
            elseif cmp.visible() then cmp.select_next_item()
            -- elseif has_words_before() then cmp.complete()
            else fallback() end
            return ""
          end, { "i", "s" }),
        },
        formatting = {
        },
      } end}

  use {"L3MON4D3/LuaSnip"}

  -- Theme: Tomorrow-Night --
  ---------------------------
  use {"marko-cerovac/material.nvim", config = function()
    vim.g.material_style = 'darker'
    require('material').setup{
      disable = {background = true, term_colors = true},
      contrast_windows = {},
      custom_colors = {
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
      },
    }
    vim.cmd[[colorscheme material]]
  end}
  use {"norcalli/nvim-colorizer.lua",
    config = function() require"colorizer".setup{} end}

  -- Treesitter --
  ----------------
  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate", config = function()
    require'nvim-treesitter.configs'.setup{
      ensure_installed = "maintained",
      highlight = {enable = true},
      indent = {enable = false},
    }
  end}
  use {"nvim-treesitter/playground"}

  -- Language Server Protocol --
  ------------------------------
  use {"neovim/nvim-lspconfig", requires = {"tjdevries/nlua.nvim"},
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
      require"lspconfig".pylsp.setup{
        capabilities = capabilities,
        settings = {pylsp = {plugins = {pylint = {enabled = false, args = {}, executable = "pylint"}}}},
      }
      require'lspconfig'.r_language_server.setup{
        capabilities = capabilities,
      }
      require"nlua.lsp.nvim".setup(require("lspconfig"),
        {globals = {"awesome", "screen", "client", "root"},
         library = {["/usr/share/awesome/lib"] = true}})
    end}
  use {"ray-x/lsp_signature.nvim",
       config = function() require"lsp_signature".setup{
       doc_lines = 0, floating_window = false, hint_prefix = ""} end}
  use {"ahmedkhalf/lsp-rooter.nvim", config = function() require("lsp-rooter").setup{} end}
  use {"weilbith/nvim-lsp-smag"}

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
end)
