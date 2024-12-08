return {
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = { "lua_ls" } -- Ensure lua_ls is installed
        }
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        opts = {} -- No need to pass options for mason-lspconfig
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "williamboman/mason-lspconfig.nvim" },
	opts = {
    		inlay_hints = { enabled = true },
  	},
        config = function()
            local lspconfig = require("lspconfig")
            local mason_lspconfig = require("mason-lspconfig")

            -- Set up Mason-LSPConfig and ensure lua_ls is installed
            mason_lspconfig.setup()


            -- Use setup_handlers for dynamic server setup
            mason_lspconfig.setup_handlers({
                function(server_name) -- Default handler
                    lspconfig[server_name].setup({})
                end,
                ["lua_ls"] = function()
                    lspconfig.lua_ls.setup({
                        settings = {
                            Lua = {
                                diagnostics = { globals = { "vim" } },
                            },
                        },
                    })
                end,
            })
        end,
    },
}

