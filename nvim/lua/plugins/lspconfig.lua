return {
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = { 'lua_ls', 'typescript-language-server', 'basedpyright' },
        }
    },
    {
        "williamboman/mason-lspconfig.nvim",
        -- dependencies = { "williamboman/mason.nvim" },
        opts = {} -- No need to pass options for mason-lspconfig
    },
    {
        "neovim/nvim-lspconfig",
        -- dependencies = { "williamboman/mason-lspconfig.nvim", "williamboman/mason.nvim"},
		dependencies = { 'saghen/blink.cmp' },
		opts = {
			inlay_hints = { enabled = true },
			servers = {
				lua_ls = {},
				rust_analyzer = {},
				markdown_oxide = {},
				basedpyright = {},
				clangd = {},
				html = {},
				ts_ls = {},
			}
		},
		config = function()
			local lspconfig = require('lspconfig')
			local capabilities = require('blink.cmp').get_lsp_capabilities()



			-- Lua setup
			lspconfig.lua_ls.setup {
				capabilities = capabilities,
				settings = {
					Lua = {
						codeLens = {
							enable = true
						},
						diagnostics = {
							globals = { "vim" },
							underline = true,
							virtual_text = {
								source = "if_many",
							},
						},
						hint = {
							enable = true,
						},
						inlay_hints = {
							enabled = true,
						},
					},
				}
			}

			-- Python setup
			lspconfig.basedpyright.setup {
				capabilities = capabilities,

				settings = {
					basedpyright = {
						analysis = {
							-- typeCheckingMode = "standard",
							typeCheckingMode = "basic",
							inlayHints = {
							  variableTypes = true,
							  functionReturnTypes = true,
							  callArgumentNames = true,
							  functionParameterTypes = true,
							}
						}
					}
				},

			}


			-- Typescript setup
			lspconfig.ts_ls.setup {
				capabilities = capabilities,
				settings = {}
			}

		end
	}
}

