return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		defaults = {
			["<leader>f"] = { name = " Find Files" },
			["<leader>h"] = { name = " Harpoon" },
			["<leader>t"] = { name = " Troubles" },
			["<leader>w"] = { name = "󰖶 Wrap" },
			["<leader>d"] = { name = "󰍉 Diagnostic" },
			["<leader>s"] = { name = "  Session" },
			["<leader>r"] = { name = " LSP Actions" },
			["<leader>c"] = { name = " Code Actions" },
			["<leader>m"] = { name = "󰉼 Modify buffer" },
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)
		wk.register(opts.defaults)
	end,
}
