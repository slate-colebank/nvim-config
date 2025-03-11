return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		disable_frontmatter = true,
		workspaces = {
			{
				name = "main",
				path = "/mnt/c/Users/slate/OneDrive/Documents/ObsidianVaultGit/Obsidian Vault"
			},
		},
	},
}
