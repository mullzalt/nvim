return {
	"Lommix/godot.nvim",
	config = function()
		local godot = require("godot")

		godot.setup()

		-- local function map(m, k, v)
		-- 	vim.keymap.set(m, k, v, { silent = true })
		-- end

		vim.keymap.set("n", "<leader>pr", godot.debugger.debug, { desc = "Godot Debugger" })
		vim.keymap.set("n", "<leader>pp", godot.debugger.debug_at_cursor, { desc = "Godot Debug at cursor" })
		vim.keymap.set("n", "<leader>pq", godot.debugger.quit, { desc = "Quit Godot debbuger" })
		vim.keymap.set("n", "<leader>pc", godot.debugger.continue, { desc = "Continue Godot Debugger" })
		vim.keymap.set("n", "<leader>ps", godot.debugger.step, { desc = "Step Godot Debugger" })
	end,
}
