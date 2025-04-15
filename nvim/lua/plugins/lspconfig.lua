return {
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = { "lua_ls", "rust_analyzer", "markdown_oxide", "basedpyright", "clangd", "html-lsp", "ts_ls" },
        }
    },
    {
        "williamboman/mason-lspconfig.nvim",
        -- dependencies = { "williamboman/mason.nvim" },
        opts = {} -- No need to pass options for mason-lspconfig
    },
	-- nvim-java setup before lspconfig
	{
		'nvim-java/nvim-java',
		opts = {}
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
						diagnostics = { globals = { "vim" } },
					},
				}
			}

			-- Rust setup
			lspconfig.rust_analyzer.setup {
				capabilities = capabilities,
			}

			-- Markdown setup
			lspconfig.markdown_oxide.setup {
				capabilities = capabilities,
			}

			-- Python setup
			lspconfig.basedpyright.setup {
				capabilities = capabilities,
				settings = {
					basedpyright = {
						analysis = {
							typeCheckingMode = "basic",
							inlayHints = {
							  variableTypes = true,
							  functionReturnTypes = true,
							  callArgumentNames = true,
							  functionParameterTypes = true,
							}
						}
					}
				}
			}

			-- Java setup
			lspconfig.jdtls.setup {
				capabilities = capabilities
			}

			-- C setup
			lspconfig.clangd.setup {
				capabilities = capabilities,
				settings = {
					inlay_hints = { enabled = true }
				}

			}

			-- HTML setup
			lspconfig.html.setup {
				capabilities = capabilities,
			}

			-- Typescript setup
			lspconfig.ts_ls.setup {
				capabilities = capabilities,
				settings = {}
			}

		end
	}
}

