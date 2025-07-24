return {
	'saghen/blink.cmp',
	version = '*',
	opts = {
		completion = {
			accept = {
				-- experimental auto brackets
				auto_brackets = {
					enabled = true,
				},
			},
			list = {
				selection = {
					preselect = false,
					auto_insert = false,
				}
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 100,
			},
			ghost_text = {
				enabled = true,
			},
		},
		sources = {
			default = { 'lsp', 'path', 'snippets', 'buffer' },  -- disable buffer to remove txt completions
		},
		keymap = {
			preset = 'default',
			['<CR>'] = { 'accept', 'fallback' },
			['<Tab>'] = { 'select_next', 'fallback' },
			['<S-Tab>'] = { 'select_prev', 'fallback' },
			--['<Esc>'] = { 'hide', 'fallback' },
			['<C-space'] = { 'cancel', 'fallback' },

		}
	}

}
