return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- Initially created for `nightfly` theme, but seems to work for `nord` too.
		local new_colors = {
			blue = "#65d1ff",
			green = "#3effdc",
			violet = "#ff61ef",
			yellow = "#ffda7b",
			black = "#000000",
		}

		local theme = require("lualine.themes.nord")
		theme.normal.a.bg = new_colors.blue
		theme.insert.a.bg = new_colors.green
		theme.visual.a.bg = new_colors.violet
		theme.command = {
			a = {
				gui = "bold",
				bg = new_colors.yellow,
				fg = new_colors.black,
			},
		}

		-- Configure lualine with modified theme
		local lazy_status = require("lazy.status")
		require("lualine").setup({
			options = {
				theme = theme,
			},
			sections = {
				lualine_x = {
					-- Lazy pending updates count
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
			},
		})
	end,
}
