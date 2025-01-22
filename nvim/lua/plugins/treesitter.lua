return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function()
            return {
                ensure_installed = { "lua", "c", "markdown", "python", "java" }, -- Ensure Lua parser is installed
                highlight = {
                    enable = true, -- Enable syntax highlighting
                    additional_vim_regex_highlighting = false, -- Disable Vim regex highlighting
                },
                indent = {
                    enable = true, -- Enable indentation support
                },
            }
        end,
    },
}

