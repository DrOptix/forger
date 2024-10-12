return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {},
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		-- Configure treesitter
		treesitter.setup({
			-- Enable syntax highlighting
			highlight = {
				enable = true,
			},

			-- Enable indentation
			indent = { enable = true },

			-- Ensure these language parsers are installed
			ensure_installed = {
				-- Programming languages
				"c_sharp",
				"rust",
				"c",
				"lua",
				"javascript",
				"typescript",
				"tsx",
				"svelte",

				-- Markup and styling
				"html",
				"css",
				"markdown",
				"markdown_inline",

				-- Data formats
				"json",
				"yaml",

				-- Shell and scripting
				"bash",
				"fish",

				-- Others
				"dockerfile",
				"gitignore",
			},

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})
	end,
}
