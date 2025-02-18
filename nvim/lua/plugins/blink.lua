return {
	'saghen/blink.cmp',
	version = '*',
	opts = {
		completion = {
			list = {
				selection = {
					preselect = false,
					auto_insert = false,
				}
			},
			ghost_text = { enabled = true },
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
