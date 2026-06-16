return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-mini/mini.icons" },
	opts = {},
	keys = {
		{
			"<leader>ff",
			function()
				require("fzf-lua").files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>fg",
			function()
				require("fzf-lua").live_grep()
			end,
			desc = "Find Grep",
		},
		{
			"<leader>fc",
			function()
				require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Find in Config",
		},
		{
			"<leader>fh",
			function()
				require("fzf-lua").helptags()
			end,
			desc = "Find Help",
		},
		{
			"<leader>fk",
			function()
				require("fzf-lua").keymaps()
			end,
			desc = "Find Keymaps",
		},
		{
			"<leader>fb",
			function()
				require("fzf-lua").buffers()
			end,
			desc = "Find existing Buffers",
		},
		{
			"<leader>fB",
			function()
				require("fzf-lua").builtin()
			end,
			desc = "Find Builtin FZF",
		},
		{
			"<leader>fw",
			function()
				require("fzf-lua").grep_cword()
			end,
			desc = "Find current Word",
		},
		{
			"<leader>fW",
			function()
				require("fzf-lua").grep_cWORD()
			end,
			desc = "Find current WORD",
		},
		{
			"<leader>fd",
			function()
				require("fzf-lua").diagnostics_document()
			end,
			desc = "Find Diagnostics in current Document",
		},
		{
			"<leader>fD",
			function()
				require("fzf-lua").diagnostics_workspace()
			end,
			desc = "Find Diagnostics in Workspace",
		},
		{
			"<leader>fr",
			function()
				require("fzf-lua").history()
			end,
			desc = "Find Recent",
		},
		{
			"<leader>fR",
			function()
				require("fzf-lua").resume()
			end,
			desc = "Find Resume",
		},
		{
			"<leader>f/",
			function()
				require("fzf-lua").lgrep_curbuf()
			end,
			desc = "Find grep the current buffer",
		},
	},
}
