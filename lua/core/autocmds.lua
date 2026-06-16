local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Highlight yanked text
local highlight_group = augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ timeout = 150 })
	end,
	group = highlight_group,
})

vim.api.nvim_create_autocmd({
	"FocusGained",
	"BufEnter",
	"CursorHold",
	"CursorHoldI",
}, {
	pattern = "*",
	command = "checktime",
})

vim.api.nvim_create_autocmd("FileChangedShellPost", {
	pattern = "*",
	callback = function()
		vim.notify("[autoread] reloaded: " .. vim.fn.expand("<afile>"), vim.log.levels.INFO)
	end,
})

vim.api.nvim_create_autocmd("FileChangedShell", {
	pattern = "*",
	callback = function()
		if vim.bo.modified then
			vim.notify("[conflict] file changed on disk but buffer has unsaved edits!", vim.log.levels.WARN)
			return
		end
	end,
})
