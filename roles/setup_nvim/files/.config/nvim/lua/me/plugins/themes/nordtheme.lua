return {
	"shaunsingh/nord.nvim",
	priority = 1000,
	config = function()
		local mod_comments_color = "#76A1D7"
		local mod_comments_style = "italic"

		-- Set Nord theme
		require("nord").set()

		local mod_theme = {}

		-- Customize comments for traditional syntax highlighting
		mod_theme["Comment"] = { fg = mod_comments_color, style = mod_comments_style }

		-- Customize comments for Tree-sitter syntax highlighting
		mod_theme["TSComment"] = { fg = mod_comments_color, style = mod_comments_style }
		mod_theme["@comment"] = { fg = mod_comments_color, style = mod_comments_style }

		-- Borrowed from: https://github.com/shaunsingh/nord.nvim
		for group, color in pairs(mod_theme) do
			local style = color.style and "gui=" .. color.style or "gui=NONE"
			local fg = color.fg and "guifg=" .. color.fg or "guifg=NONE"
			local bg = color.bg and "guibg=" .. color.bg or "guibg=NONE"
			local sp = color.sp and "guisp=" .. color.sp or ""

			vim.cmd("highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg .. " " .. sp)
		end
	end,
}
