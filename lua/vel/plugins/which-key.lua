return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	config = function()
		local wk = require("which-key")
		wk.register({
			["<leader>d"] = { name = "+Debug" },
			["<leader>da"] = { name = "+Adapters" },
			["<leader>r"] = { name = "+Replace" },
			["<leader>o"] = { name = "+Obsidian" },
			["<leader>u"] = { name = "+UI" },
			["<leader>c"] = { name = "+Code" },
			["<leader>f"] = { name = "+File/Find" },
			["<leader>b"] = { name = "+Buffer" },
			["<leader>g"] = { name = "+Git" },
			["<leader>q"] = { name = "+Quit/Session" },
			["<leader>s"] = { name = "+Search" },
			["<leader>w"] = { name = "+Window" },
			["<leader>x"] = { name = "+Diagnostics/Quickfix" },
		})
	end,
}
