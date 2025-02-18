return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",  -- LSP source for nvim-cmp
        "hrsh7th/cmp-buffer",    -- Buffer source for nvim-cmp
        "hrsh7th/cmp-path",      -- Path source for nvim-cmp
		"L3MON4D3/LuaSnip",
		"windwp/nvim-autopairs",
    },
    opts = function()
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local cmp = require("cmp")

		cmp.event:on(
			"confirm_done",
			cmp_autopairs.on_confirm_done()
		)

        return {
            -- Enable completion
            completion = {
                completeopt = "menu,noinsert, noselect",  -- Options for popup menu. Add menuone to enable menu with 1 suggestion
            },



            -- Snippet setup (even though not strictly necessary, nvim-cmp expects this)
            snippet = {
                expand = function(args)
                    -- Expand snippets (use if you have snippets configured)
	 	    		require("luasnip").lsp_expand(args.body)
                end,
            },

            -- Key mappings for navigating and selecting items
            mapping = {
                ["<Tab>"] = require("cmp").mapping.select_next_item(), -- Next item with Tab
                ["<S-Tab>"] = require("cmp").mapping.select_prev_item(), -- Previous item with Shift+Tab
				["<CR>"] = require("cmp").mapping.confirm({ select = false })
            },

            -- Completion sources
            sources = {
                { name = "nvim_lsp" },  -- LSP source
				{ name = "luasnip" },    -- LuaSnip source for snippets
                { name = "buffer" },    -- Buffer source
                { name = "path" },      -- Path source
            },


            experimental = {
                native_menu = false,  -- Disable native menu for completion
                ghost_text = true,    -- Enable ghost text (preview of completion)
            },
        }
    end,
}

