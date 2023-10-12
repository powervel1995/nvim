return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		local function fg(name)
			---@type {foreground?:number}?
			---@diagnostic disable-next-line: deprecated
			local hl = vim.api.nvim_get_hl and vim.api.nvim_get_hl(0, { name = name })
				or vim.api.nvim_get_hl_by_name(name, true)
			---@diagnostic disable-next-line: undefined-field
			local fg = hl and (hl.fg or hl.foreground)
			return fg and { fg = string.format("#%06x", fg) } or nil
		end

		local colors = {
			blue = "#65D1FF",
			green = "#3EFFDC",
			violet = "#FF61EF",
			yellow = "#FFDA7B",
			red = "#FF4A4A",
			fg = "#c3ccdc",
			bg = "#112638",
			inactive_bg = "#2c3043",
		}

		-- configure lualine with modified theme
		lualine.setup({
			options = {
				theme = "auto",
				globalstatus = true,
				disabled_filetypes = { statusline = { "dashboard", "alpha" } },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = {
					{
						"diagnostics",
						symbols = {
							error = " ",
							warn = " ",
							info = " ",
							hint = " ",
						},
					},
					{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
					{ "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
					-- { "filename" },
					-- stylua: ignore
					-- {
					--   function() return require("nvim-navic").get_location() end,
					--   cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
					-- },
				},
				lualine_x = {
          -- stylua: ignore
          {
            function() return require("noice").api.status.command.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
            color = fg("Statement"),
          },
          -- stylua: ignore
          {
            function() return require("noice").api.status.mode.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
            color = fg("Constant"),
          },
          -- stylua: ignore
          {
            function() return "  " .. require("dap").status() end,
            cond = function () return package.loaded["dap"] and require("dap").status() ~= "" end,
            color = fg("Debug"),
          },
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					{
						"diff",
						symbols = {
							added = " ",
							modified = " ",
							removed = " ",
						},
					},
				},
				-- lualine_x = {
				--   {
				--     lazy_status.updates,
				--     cond = lazy_status.has_updates,
				--     color = { fg = "#ff9e64" },
				--   },
				--   { "encoding" },
				--   { "fileformat" },
				--   { "filetype" },
				-- },
				lualine_y = {
					{ "progress", separator = " ", padding = { left = 1, right = 0 } },
					{ "location", padding = { left = 0, right = 1 } },
				},
				lualine_z = {
					function()
						-- return " " .. os.date("%R")
						return os.date("%r")
					end,
				},
			},
		})
	end,
}
