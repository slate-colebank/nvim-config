return {
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = { "lua_ls" },
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
		opts = {
			inlay_hints = { enabled = true },
			servers = {
				lua_ls = {},
			}
		},
		config = function()
			local lspconfig = require('lspconfig')

			-- Lua setup
			lspconfig.lua_ls.setup {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
					},
				}
			}



		end
	}
}

