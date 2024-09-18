return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		defaults = {
			{ "<leader>c", group = " Code Actions" },
			{ "<leader>d", group = "󰍉 Diagnostic" },
			{ "<leader>f", group = " Find Files" },
			{ "<leader>h", group = " Harpoon" },
			{ "<leader>m", group = "󰉼 Modify buffer" },
			{ "<leader>r", group = " LSP Actions" },
			{ "<leader>s", group = " Session" },
			{ "<leader>t", group = " Troubles" },
			{ "<leader>w", group = "󰖶 Wrap" },
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)
		wk.register(opts.defaults)
	end,
}
