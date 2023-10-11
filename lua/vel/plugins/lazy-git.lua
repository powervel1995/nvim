return {
	"kdheepak/lazygit.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{
			mode = { "n" },
			"<Leader>gg",
			"<cmd>LazyGitCurrentFile<cr>",
			desc = "Lazy Git",
		},
	},
	config = function() end,
}
