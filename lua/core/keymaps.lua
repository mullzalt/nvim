vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- join line
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join Line", silent = true })

-- better scroll
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll Down", silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll Up", silent = true })

vim.keymap.set("n", "n", "nzzzv", { desc = "Find Next", silent = true })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Find Previous", silent = true })

-- toggle wrap
vim.keymap.set("n", "<leader>ww", "<cmd>set wrap!<cr>", { desc = "Toggle Wrap", remap = true })

-- better up/down
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste Without Yank" })
vim.keymap.set({ "n", "v" }, "x", '"_x')

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to Clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank Line to Clipboard" })
vim.keymap.set("n", "Y", "yy", { desc = "Yank Line" })

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete (No Register)" })
vim.keymap.set({ "n", "v" }, "<leader>x", '"_x', { desc = "Delete Char (No Register)" })

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Next Quickfix" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Prev Quickfix" })

-- better indenting
vim.keymap.set("v", "<Tab>", ">gv", { desc = "Indent", silent = true })
vim.keymap.set("v", ">", ">gv", { desc = "Indent", silent = true })

vim.keymap.set("v", "<S-Tab>", "<gv", { desc = "Dedent", silent = true })
vim.keymap.set("v", "<", "<gv", { desc = "Dedent", silent = true })

-- nohl
vim.keymap.set("n", "<Esc>", "<cmd>:nohlsearch<cr>")

-- Copy path
vim.keymap.set("n", "<leader>cp", function()
	local path = vim.fn.expand("%")
	vim.fn.setreg("+", path)
	vim.notify("Copied: " .. path)
end, { desc = "Copy Relative Path" })

vim.keymap.set("n", "<leader>cP", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	vim.notify("Copied: " .. path)
end, { desc = "Copy Absolute Path" })

-- Marks: mm/mM to set (built-in), mj/mJ to jump, ' unified with `
vim.keymap.set({ "n", "x", "o" }, "'", "`", { remap = true })
vim.keymap.set("n", "mj", "`m", { desc = "Jump to Local Mark" })
vim.keymap.set("n", "mJ", "`M", { desc = "Jump to Global Mark" })
