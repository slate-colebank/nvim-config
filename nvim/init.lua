vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.cmd("set number relativenumber")


require("config.lazy")

vim.cmd("colorscheme cyberdream")



vim.cmd([[highlight Normal guibg=NONE ctermbg=NONE]])
vim.cmd([[highlight NormalFloat guibg=NONE ctermbg=NONE]])

-- leader keybinds
vim.keymap.set("n", "<Leader>F", ":Telescope find_files<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>O", ":Oil<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>L", ":Lazy<CR>", { noremap = true, silent = true })

-- Toggle inlay hints
vim.keymap.set("n", "<Leader>I", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { noremap = true, silent = true, desc = "Toggle inlay hints" })


vim.opt.cursorline = true
-- vim.opt.cursorcolumn = true
-- vim.cmd([[highlight CursorLineNr guibg=bg guifg=#00ff00]])


-- require('java').setup()
-- require('lspconfig').jdtls.setup({})
-- Java keybinds
-- vim.keymap.set({ "n" }, "<C-j>b", ":lua require'dap'.toggle_breakpoint()<CR>")
-- vim.keymap.set({ "n" }, "<C-j>c", ":lua require'dap'.continue()<CR>")
-- vim.keymap.set({ "n" }, "<C-j>o", ":lua require'dap'.step_over()<CR>")
-- vim.keymap.set({ "n" }, "<C-j>i", ":lua require'dap'.toggle_breakpoint()<CR>")
-- vim.keymap.set({ "n" }, "<C-j>b", ":lua require'dap'.toggle_breakpoint()<CR>")

-- Conceal level for obsidian.nvim
vim.opt.conceallevel = 1

