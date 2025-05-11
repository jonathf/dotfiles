local servers = {
	basedpyright = {
		settings = {
			basedpyright = {
				analysis = {
					typeCheckingMode = "basic",
				},
			},
		},
	}, -- python
	bashls = {}, -- bash
	-- clangd = {}, -- C/C++
	dockerls = {}, -- docker
	esbonio = {}, -- sphinx
	fixjson = {}, -- json
	gitlab_ci_ls = {}, -- yaml.gitlab
	helm_ls = {
		settings = {
			["helm-ls"] = {
				yamlls = { path = "yaml-language-server" },
			},
		},
	}, -- yaml.helm
	htmlbeautifier = {},
	jsonls = {}, -- json
	jqls = {},
	lua_ls = {
		settings = {
			Lua = {
				runtime = { version = "LuaJIT" },
				workspace = {
					checkThirdParty = false,
					library = { unpack(vim.api.nvim_get_runtime_file("", true)) },
				},
				completion = { callSnippet = "Replace" },
			},
		},
		on_init = function(client)
			if client.workspace_folders then
				local path = client.workspace_folders[1].name
				if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
					return
				end
			end

			client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
				runtime = {
					-- Tell the language server which version of Lua you're using
					-- (most likely LuaJIT in the case of Neovim)
					version = "LuaJIT",
				},
				-- Make the server aware of Neovim runtime files
				workspace = {
					checkThirdParty = false,
					library = {
						vim.env.VIMRUNTIME,
						-- Depending on the usage, you might want to add additional paths here.
						-- "${3rd}/luv/library"
						-- "${3rd}/busted/library",
					},
					-- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
					-- library = vim.api.nvim_get_runtime_file("", true)
				},
			})
		end,
	}, -- lua
	marksman = {}, -- markdown
	markdown_oxide = {}, -- markdown
	-- ["python-lsp-server"] = {
	-- 	settings = {
	-- 		pylsp = {
	-- 			plugins = {
	-- 				-- rope_autoimport = { enabled = false },
	-- 				-- black = { enabled = true },
	-- 				ruff = {
	-- 					enabled = false,
	-- 					formatEnabled = true,
	-- 				},
	-- 			},
	-- 		},
	-- 	},
	-- }, -- python
	rstcheck = {}, -- rst
	-- ruff = {},
	-- ruff_lsp = {
	--   init_options = {
	--     settings = {
	--       args = {},
	--     },
	--   },
	-- },
	sqlfluff = {}, -- sql
	stylua = {},
	taplo = {}, -- toml
	selene = {}, -- lua linter
	terraformls = {}, -- terraoform
	tflint = {}, -- terraform
	yamlls = {}, -- yaml
}

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			-- "WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "folke/lazydev.nvim", ft = "lua", opts = {} },
			"hrsh7th/cmp-nvim-lsp",
			{ "towolf/vim-helm", ft = { "yaml" } },
		},
		event = "VeryLazy",
		config = function()
			vim.lsp.set_log_level("off")
			vim.diagnostic.config({
				virtual_text = {
					prefix = "◨ ",
					-- format = function()
					-- 	return ""
					-- end,
					virt_text_pos = "eol_right_align",
				},
				-- virtual_lines = { current_line = true },
				signs = false,
			})
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			require("mason").setup({
				pip = { upgrade_pip = true },
				ui = {
					icons = {
						package_installed = "X",
						package_pending = "…",
						package_uninstalled = "i",
					},
					-- width = 1,
					-- height = 1,
				},
			})

			-- You can add other tools here that you want Mason to install
			-- for you, so that they are available from within Neovim.
			local ensure_installed = vim.tbl_keys(servers)
			vim.list_extend(ensure_installed, {
				"stylua", -- lua
				"yamlfmt", -- yaml
			})
			-- require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
			require("mason-lspconfig").setup({
				automatic_installation = false,
				ensure_installed = {},
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						-- This handles overriding only values explicitly passed
						-- by the server configuration above. Useful when disabling
						-- certain features of an LSP (for example, turning off formatting for tsserver)
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						server.on_attach = function(client, bufnr)
							if client.server_capabilities.documentHighlightProvider then
								client.server_capabilities.documentHighlightProvider = false
							end
							-- require("nvim-navic").attach(client, bufnr)
						end
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
			vim.cmd([[LspStart]])
		end,
	},
}
