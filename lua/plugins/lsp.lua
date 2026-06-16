return {
	{
		"williamboman/mason.nvim",
		keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
		build = ":MasonUpdate",
		opts_extend = { "ensure_installed" },
		opts = {
			ui = {
				border = "rounded",
			},
			ensure_installed = {
				"vtsls",
				"tailwindcss",
				"html",
				"cssls",
				"emmet_ls",
				"lua_ls",
				"jsonls",
				"markdownlint-cli2",
				"markdown-toc",
				"phpstan",

				"tinymist",
				"typos_lsp",
				"prettypst",

				"eslint",
				"prettier",
				"stylua",
				"php-cs-fixer",
			},
		},
	},

	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"mason.nvim",
			{ "mason-org/mason-lspconfig.nvim", config = function() end },
		},

		config = function()
			vim.diagnostic.config({
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = " ",
						[vim.diagnostic.severity.WARN] = " ",
						[vim.diagnostic.severity.HINT] = " ",
						[vim.diagnostic.severity.INFO] = " ",
					},
				},
				underline = true,
				update_in_insert = false,
				severity_sort = true,
				virtual_text = {
					spacing = 4,
					prefix = "●",
				},
				float = {
					border = "rounded",
					source = "if_many",
				},
			})

			local lspconfig = require("lspconfig")

			local capabilities = vim.lsp.protocol.make_client_capabilities()

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					local opts = function(str)
						return { buffer = ev.buf, desc = str }
					end

					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts("Hover"))
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts("Goto Declaration"))
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts("Goto Definition"))
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts("Goto Implementation"))
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts("Buffer References"))
					vim.keymap.set("n", "<M-k>", vim.lsp.buf.signature_help, opts("Signature Help"))
					vim.keymap.set("i", "<M-k>", vim.lsp.buf.signature_help, opts("Signature Help"))
					vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts("Code Rename"))
					vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("Code Action"))

					vim.keymap.set("n", "<leader>t", vim.diagnostic.open_float, opts("Open diagnostics"))

					-- vim.keymap.set('n', '<leader>cf', function()
					--   vim.lsp.buf.format { async = true }
					-- end, opts("Code Format Buffer"))
				end,
			})

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
						telemetry = { enable = false },
					},
				},
			})

			lspconfig.vtsls.setup({
				capabilities = capabilities,
				settings = {
					typescript = {
						inlayHints = {
							parameterNames = { enabled = "literals" },
							parameterTypes = { enabled = true },
							variableTypes = { enabled = false },
							propertyDeclarationTypes = { enabled = true },
							functionLikeReturnTypes = { enabled = true },
						},
					},
				},
			})

			lspconfig.jsonls.setup({
				capabilities = capabilities,
			})

			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
				filetypes = {
					"html",
					"css",
					"scss",
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
				},
			})

			lspconfig.html.setup({
				capabilities = capabilities,
				filetypes = { "html", "blade" },
			})

			lspconfig.cssls.setup({
				capabilities = capabilities,
			})

			lspconfig.emmet_ls.setup({
				capabilities = capabilities,
				filetypes = {
					"html",
					"css",
					"scss",
					"javascriptreact",
					"typescriptreact",
				},
			})

			lspconfig.marksman.setup({
				capabilities = capabilities,
			})

			lspconfig.tinymist.setup({
				capabilities = capabilities,
			})

			lspconfig.blade_formatter.setup({
				capabilities = capabilities,
				filetypes = {
					"blade",
				},
			})

			lspconfig.phpstan.setup({
				cmd = {
					"vendor/bin/phpstan",
					"analyse",
					"--error-format=json",
					"--no-progress",
				},
				filetypes = { "php" },
				root_dir = lspconfig.util.root_pattern("composer.json", "phpstan.neon", ".git"),
			})

			lspconfig.intelephense.setup({
				capabilities = capabilities,
				filetypes = {
					"php",
				},
			})
		end,
	},

	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		config = function()
			require("conform").setup({
				format_on_save = {
					timeout_ms = 1000,
					lsp_fallback = false,
				},
				formatters = {
					["markdown-toc"] = {
						condition = function(_, ctx)
							for _, line in ipairs(vim.api.nvim_buf_get_lines(ctx.buf, 0, -1, false)) do
								if line:find("<!%-%- toc %-%->") then
									return true
								end
							end
						end,
					},
					["markdownlint-cli2"] = {
						condition = function(_, ctx)
							local diag = vim.tbl_filter(function(d)
								return d.source == "markdownlint"
							end, vim.diagnostic.get(ctx.buf))
							return #diag > 0
						end,
					},
					["php-cs-fixer"] = {
						command = "php-cs-fixer",
						args = {
							"fix",
							"--rules=@PSR12", -- Formatting preset. Other presets are available, see the php-cs-fixer docs.
							"$FILENAME",
						},
						stdin = false,
					},
				},
				formatters_by_ft = {
					["markdown"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
					["markdown.mdx"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
					lua = { "stylua" },
					blade = { "blade-formatter" },
					php = { "php-cs-fixer" },

					javascript = { "prettier" },
					javascriptreact = { "prettier" },
					typescript = { "prettier" },
					typescriptreact = { "prettier" },

					html = { "prettier" },
					css = { "prettier" },
					scss = { "prettier" },
					json = { "prettier" },
				},
			})

			vim.keymap.set({ "n", "v" }, "<leader>cf", function()
				require("conform").format({ async = true })
			end, { desc = "Code Format buffer" })
		end,
	},
}
