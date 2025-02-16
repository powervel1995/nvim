return {
	{
		"olimorris/onedarkpro.nvim",
		priority = 1000, -- Ensure it loads first
		opts = {
			options = {},
			styles = {
				types = "NONE",
				methods = "italic",
				numbers = "NONE",
				strings = "NONE",
				comments = "italic",
				keywords = "bold,italic",
				constants = "NONE",
				functions = "italic",
				operators = "NONE",
				variables = "NONE",
				parameters = "NONE",
				conditionals = "italic",
				virtual_text = "NONE",
			},
			highlights = {
				CursorLine = { bg = "none" },
				CursorLineNr = { fg = "#fff000", bold = true },
				Whitespace = { fg = "#303642" },
				-- LineNr = { fg = "#8400ff" },
			},
		},
		config = function(_, opts)
			require("onedarkpro").setup(opts)
			vim.cmd.colorscheme("onedark_dark")
		end,
	},
}
