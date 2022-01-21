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

  -- N_- :: line comment
  -- N__ :: block comment
  use {"numToStr/Comment.nvim", config = function()
    require("Comment").setup{
      toggler = {line = "--", block = "__"},
      opleader = {line = "-", block = "_"},
    } end
  }

  -- O_i O_I :: "inside" operator
  -- O_o O_O :: "outside" operator
  -- optional infix modifier: n:next, l:last
  -- target: ()[]{}<>'"`,.;:+-=~_*#/|\&$
  use {"wellle/targets.vim"}

  -- N_ys :: surround an text object
  -- O_s :: modify surrounded text object
  -- targets: ()[]{}<>'"`
  use {"tpope/vim-surround", require = "tpope/vim-repeat"}

  -- Recovery diff
  use {"chrisbra/Recover.vim", config = function() vim.g["RecoverPlugin_Edit_Unmodified"] = 1 end}

  -- count number in status with N_* N_# N_n N_N
  use {"osyo-manga/vim-anzu", config = function() vim.g["anzu_status_format"] = "%p %#WarningMsg#[%i/%l]" end}

  -- Help menu for everything
  use {"folke/which-key.nvim",
       config = function() require("which-key").setup{
         plugins = {spelling = {enabled = true, suggestions = 40}}} end}

  -- use {"winston0410/range-highlight.nvim", require = {"winston0410/cmd-parser.nvim"}, config = function()
  --   require"range-highlight".setup{} end}
  --
  -- use "tpope/vim-fugitive"
  use {"lewis6991/gitsigns.nvim", requires = "nvim-lua/plenary.nvim",
    config = function() require"gitsigns".setup{
      keymaps = {noremap = false}, yadm = {enable = true}} end}

  -- Filetype highlighting
  use {"cespare/vim-toml", ft = {"toml"}}
  use {"jonathf/vim-fish", ft = {"fish"}}
  use {"euclidianAce/BetterLua.vim", ft = {"lua"}}
  use {"zorab47/vim-gams", ft = {"gams"}}
  use {"Vimjas/vim-python-pep8-indent", ft = {"python"}}

  -- Editing encrypted files
  use "jamessan/vim-gnupg"

  -- Completion engine
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "ray-x/cmp-treesitter",
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require"cmp"
      local luasnip = require"luasnip"
      cmp.setup{
        -- documentation = false,
        snippet = {expand = function(args) require('luasnip').lsp_expand(args.body) end},
        experimental = {native_menu = false, ghost_text = true},
        sources = {
          {name = "path"},
          {name = "nvim_lua"},
          {name = "nvim_lsp"},
          {name = "luasnip"},
          {name = "treesitter", keyword_length = 5},
        },
        mapping = {
          ['<C-n>'] = cmp.mapping.select_next_item{behavior = cmp.SelectBehavior.Select},
          ['<C-p>'] = cmp.mapping.select_prev_item{behavior = cmp.SelectBehavior.Select},
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-e>'] = cmp.mapping.close(),
          ["<tab>"] = cmp.mapping(function(fallback)
            if luasnip.expand_or_jumpable() then luasnip.expand_or_jump(); return end
            if cmp.visible() then cmp.select_next_item(); return end
            if luasnip.expand_or_jumpable() then luasnip.expand_or_jump(); return end
            fallback()
          end, {"i", "s"}),
          ["<cr>"] = cmp.mapping(function(fallback)
            if cmp.visible() then cmp.confirm{behavior = cmp.ConfirmBehavior.Insert, select = true}; return end
            fallback()
          end, {"i", "s"}),
        },
        formatting = {},
      }
    end}

  -- Snippet engine
  use {"L3MON4D3/LuaSnip", config=function()
    local types = require("luasnip.util.types")
    require"luasnip".config.setup{
      history = true,
      updateevents = "TextChanged,TextChangedI",
      ext_opts = {
        [types.insertNode] = {passive = {hl_group = "Todo"}},
        [types.functionNode] = {passive = {hl_group = "Comment"}},
      },
      ext_base_prio = 200,
      ext_prio_increase = 3,
    }
  end}

  -- Color theme
  use {"marko-cerovac/material.nvim", config = function()
    vim.g.material_style = 'darker'
    require"material".setup{
      disable = {background = true, term_colors = true},
      custom_colors = {
        white        =  '#ffffff', gray         =  '#c5c8c6', variable     =  '#c5c8c6',
        black        =  '#1d1f21', red          =  '#cc6666', green        =  '#b5bd68',
        yellow       =  '#f0c674', blue         =  '#81a2be', paleblue     =  '#5f819d',
        cyan         =  '#8abeb7', purple       =  '#b294bb', orange       =  '#de935f',
        pink         =  '#85678f', error        =  '#a54242', link         =  '#5e8d87',
        cursor       =  '#ffffff', fg           =  '#e0e0e0', text         =  '#727272',
        comments     =  '#616161', disabled     =  '#474747', line_numbers =  '#424242',
        selection    =  '#404040', highlight    =  '#373b41', active       =  '#1d1f21',
        border       =  '#282a2e', contrast     =  '#1d1f21', accent       =  '#FF9800',
        sidebar      =  '#282a2e', float        =  '#282a2e',
      },
    }
    vim.cmd[[colorscheme material]]
  end}
  use {"norcalli/nvim-colorizer.lua", config = function() require"colorizer".setup{} end}

  --- Treesitter
  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate", config = function()
    require'nvim-treesitter.configs'.setup{
      ensure_installed = "maintained",
      highlight = {enable = true},
      indent = {enable = false},
    }
  end}
  use {"nvim-treesitter/playground"}

  --- Language Server Protocol
  use {"neovim/nvim-lspconfig", requires = {"tjdevries/nlua.nvim"},
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
      require"lspconfig".pylsp.setup{
        capabilities = capabilities,
      }
      require'lspconfig'.r_language_server.setup{
        capabilities = capabilities,
      }
      require"nlua.lsp.nvim".setup(require("lspconfig"),
        {globals = {"awesome", "screen", "client", "root"},
         library = {["/usr/share/awesome/lib"] = true}})
    end}

  --- Tags through LSP
  use {"weilbith/nvim-lsp-smag"}

  --- Anchor PWD to project root
  use {"ahmedkhalf/project.nvim", config = function()
    require("project_nvim").setup{
      patterns = {".git", "Makefile", "pyproject.toml"},
      exclude_dirs = {".git", ".37", ".38", ".39"}
    }
  end}
end)
