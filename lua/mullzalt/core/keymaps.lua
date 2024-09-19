vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

-- move line in visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected line down", expr = true, silent = true })
keymap.set("v", "<S-Down>", ":m '>+1<CR>gv=gv", { desc = "Move selected line down", expr = true, silent = true })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected line up", expr = true, silent = true })
keymap.set("v", "<S-Up>", ":m '<-2<CR>gv=gv", { desc = "Move selected line up", expr = true, silent = true })

-- join line
keymap.set("n", "J", "mzJ`z", { desc = "Join line", silent = true })
keymap.set("n", "<S-Down>", "mzJ`z", { desc = "Join line", silent = true })

-- better scroll
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll half page down", silent = true })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll half page up", silent = true })

keymap.set("n", "n", "nzzzv", { desc = "Find next matching patern", silent = true })
keymap.set("n", "N", "Nzzzv", { desc = "Find previous matching patern", silent = true })

-- toggle wrap
keymap.set("n", "<leader>ww", "<cmd>set wrap!<cr>", { desc = "Toggle text wrap", remap = true })

-- better up/down
keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
keymap.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- greatest remap ever
keymap.set("x", "<leader>p", [["_dP]])
-- keymap.set({ "n", "v" }, "x", '"_x')

-- next greatest remap ever : asbjornHaland
keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank selected to clipboard" })
keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank current line to clipboard" })

keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete to unregister" })
keymap.set({ "n", "v" }, "<leader>x", '"_x', { desc = "Delete under cursor to unregister" })

keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory" })
