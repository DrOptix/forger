return {
	"neovim/nvim-lspconfig",

	event = { "BufReadPre", "BufNewFile" },

	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"williamboman/mason-lspconfig.nvim",
	},

	config = function()
		-- Change the Diagnostic symbols in the sign column
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local on_attach = function(ev)
			-- Buffer local mappings.
			local opts = { buffer = ev.buf, silent = true }

			-- Show available code actions, in visual mode will apply to selection
			opts.desc = "Show available code actions"
			vim.keymap.set({ "n", "v" }, "<LEADER>ca", vim.lsp.buf.code_action, opts)

			opts.desc = "Smart rename"
			vim.keymap.set("n", "<LEADER>rn", vim.lsp.buf.rename, opts)

			opts.desc = "Go to previous diagnostic"
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

			opts.desc = "Go to next diagnostic"
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

			opts.desc = "Show documentation for what is under cursor"
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		end

		require("mason-lspconfig").setup_handlers({
			-- Default handler for installed servers
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
					on_attach = on_attach,
				})
			end,

			-- Configure Lua
			["lua_ls"] = function()
				lspconfig.lua_ls.setup({
					capabilities = capabilities,
					on_attach = on_attach,
					settings = {
						Lua = {
							-- make the language server recognize "vim" global
							diagnostics = {
								globals = { "vim" },
							},
							completion = {
								callSnippet = "Replace",
							},
							workspace = {
								-- Make language server aware of runtime files
								library = {
									[vim.fn.expand("$VIMRUNTIME/lua")] = true,
									[vim.fn.stdpath("config") .. "/lua"] = true,
								},
							},
						},
					},
				})
			end,

			-- Configure C#
			["omnisharp"] = function()
				local home_dir = os.getenv("HOME")
                local omnisharp_relative_path = "~/.local/share/nvim/mason/bin/omnisharp"

				-- Replace "~" with the home directory
				local omnisharp_full_path = home_dir .. omnisharp_relative_path:sub(2)

				lspconfig["omnisharp"].setup({
					cmd = {
						omnisharp_full_path,
						"--languageserver",
						"--hostPID",
						tostring(vim.fn.getpid()),
					},
					capabilities = capabilities,
					on_attach = on_attach,
				})
			end,
		})
	end,
}
