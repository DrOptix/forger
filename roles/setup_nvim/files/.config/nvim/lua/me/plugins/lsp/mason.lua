return {
	"williamboman/mason.nvim",

	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},

	config = function()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "⏳",
					package_uninstalled = "❌",
				},
			},
		})

		require("mason-lspconfig").setup({
			-- Auto install configured servers (with lspconfig)
			automatic_installation = true,

			-- List of LSP servers for Mason to install
			ensure_installed = {
				"lua_ls",
			},
		})
	end,
}
