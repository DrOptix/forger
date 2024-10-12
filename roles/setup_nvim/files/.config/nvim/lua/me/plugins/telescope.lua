return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		-- Utility library for Neovim plugins.
		{ "nvim-lua/plenary.nvim" },

		-- `fzf` sorter for Telescope
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

		-- Filetype icons for Neovim plugins and status lines.
		{ "nvim-tree/nvim-web-devicons" },

		-- Highlight and manage TODO comments in your code.
		{ "folke/todo-comments.nvim" },
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						-- Move to previous result
						["<C-k>"] = actions.move_selection_previous,

						-- Move to next result
						["<C-j>"] = actions.move_selection_next,
					},
				},
			},
		})

		telescope.load_extension("fzf")

		-----------------
		-- KEYBINDINGS --
		-----------------
		vim.keymap.set(
			"n",
			"<leader>ff",
			"<cmd>Telescope find_files<cr>",
			{ desc = "Fuzzy find files in current working directory" }
		)

		vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })

		vim.keymap.set(
			"n",
			"<leader>fs",
			"<cmd>Telescope live_grep<cr>",
			{ desc = "Find string in current working directory" }
		)

		vim.keymap.set(
			"n",
			"<leader>fc",
			"<cmd>Telescope grep_string<cr>",
			{ desc = "Find string under cursor in current working directory" }
		)

		vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
	end,
}
