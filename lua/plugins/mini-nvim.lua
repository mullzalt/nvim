local function get_relative_cwd()
	return vim.fn.expand("%:.")
end

return {
	{
		"nvim-mini/mini.ai",
		version = false,
		config = function()
			require("mini.ai").setup({})
		end,
	},
	{
		"nvim-mini/mini.icons",
		version = false,
		config = function()
			require("mini.icons").setup({})
		end,
	},

	{
		"nvim-mini/mini-git",
		version = false,
		config = function()
			require("mini.git").setup({})
		end,
	},
	{
		"nvim-mini/mini.diff",
		version = false,
		config = function()
			require("mini.diff").setup({})
		end,
	},
	{
		"nvim-mini/mini.comment",
		version = false,
		config = function()
			require("mini.comment").setup({})
		end,
	},
	{
		"nvim-mini/mini.pairs",
		version = false,
		config = function()
			require("mini.pairs").setup({})
		end,
	},
	{
		"nvim-mini/mini.surround",
		version = false,
		config = function()
			require("mini.surround").setup({})
		end,
	},
	{
		"nvim-mini/mini.jump",
		version = false,
		config = function()
			require("mini.jump").setup({})
		end,
	},
	{
		"nvim-mini/mini.statusline",
		version = false,
		config = function()
			local statusline = require("mini.statusline")

			statusline.setup({
				content = {
					active = function()
						local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
						local git = MiniStatusline.section_git({ trunc_width = 40 })
						local diff = MiniStatusline.section_diff({ trunc_width = 75 })
						local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })
						local diagnostics = statusline.section_diagnostics({
							trunc_width = 75,
							signs = {
								ERROR = "",
								WARN = "",
								HINT = "",
								INFO = "",
							},
						})

						MiniStatusline.section_filename({ trunc_width = 140 })
						local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
						local location = MiniStatusline.section_location({ trunc_width = 75 })
						local search = MiniStatusline.section_searchcount({ trunc_width = 75 })

						return statusline.combine_groups({
							{ hl = mode_hl, strings = { string.upper(mode) } },
							{ hl = "MiniStatuslineDevinfo", strings = { git, diff } },
							"%<",
							{ hl = "MiniStatuslineDevinfo", strings = { lsp, diagnostics } },
							"%=", -- End left alignment
							{ hl = "MiniStatuslineFilename", strings = { get_relative_cwd() } },
							{ hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
							{ hl = mode_hl, strings = { search, location } },
						})
					end,
				},
			})
		end,
	},
	{
		"nvim-mini/mini.keymap",
		version = false,
		config = function()
			local map_multistep = require("mini.keymap").map_multistep
			map_multistep("i", "<Tab>", { "pmenu_next" })
			map_multistep("i", "<S-Tab>", { "pmenu_prev" })
			map_multistep("i", "<CR>", { "pmenu_accept", "minipairs_cr" })
			map_multistep("i", "<BS>", { "minipairs_bs" })
		end,
	},
	{
		"nvim-mini/mini.completion",
		version = false,
		config = function()
			require("mini.completion").setup({})
		end,
	},
	{
		"nvim-mini/mini.clue",
		version = false,
		config = function()
			require("mini.completion").setup()
			local miniclue = require("mini.clue")
			miniclue.setup({
				triggers = {
					-- Leader triggers
					{ mode = { "n", "x" }, keys = "<Leader>" },

					-- `[` and `]` keys
					{ mode = "n", keys = "[" },
					{ mode = "n", keys = "]" },

					-- Built-in completion
					{ mode = "i", keys = "<C-x>" },

					-- `g` key
					{ mode = { "n", "x" }, keys = "g" },

					-- Marks
					{ mode = { "n", "x" }, keys = "'" },
					{ mode = { "n", "x" }, keys = "`" },

					-- Registers
					{ mode = { "n", "x" }, keys = '"' },
					{ mode = { "i", "c" }, keys = "<C-r>" },

					-- Window commands
					{ mode = "n", keys = "<C-w>" },

					-- `z` key
					{ mode = { "n", "x" }, keys = "z" },
				},

				clues = {
					-- Enhance this by adding descriptions for <Leader> mapping groups
					{ mode = { "n", "x" }, keys = "<leader>f", desc = "Find" },
					{ mode = { "n", "x" }, keys = "<leader>w", desc = "Wrapping" },
					{ mode = { "n", "x" }, keys = "<leader>c", desc = "Code" },
					miniclue.gen_clues.square_brackets(),
					miniclue.gen_clues.builtin_completion(),
					miniclue.gen_clues.g(),
					miniclue.gen_clues.marks(),
					miniclue.gen_clues.registers(),
					miniclue.gen_clues.windows(),
					miniclue.gen_clues.z(),
				},
				window = {
					delay = 300,
				},
			})
		end,
	},
	{
		"nvim-mini/mini.bufremove",
		version = false,
		config = function()
			require("mini.bufremove").setup({})
		end,
	},
}
