vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap


-- move line in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected line down", expr = true, silent = true})
vim.keymap.set("v", "<S-Down>", ":m '>+1<CR>gv=gv", { desc = "Move selected line down", expr = true, silent = true})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected line up", expr = true, silent = true})
vim.keymap.set("v", "<S-Up>", ":m '<-2<CR>gv=gv", { desc = "Move selected line up", expr = true, silent = true})

-- join line
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join line", silent = true})
vim.keymap.set("n", "<S-Down>", "mzJ`z", { desc = "Join line", silent = true})

-- better scroll
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll half page down", silent = true})
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll half page up", silent = true})

vim.keymap.set("n", "n", "nzzzv", { desc = "Find next matching patern", silent = true})
vim.keymap.set("n", "N", "Nzzzv", { desc = "Find previous matching patern", silent = true})

-- toggle wrap
vim.keymap.set("n", "<leader>ww", "<cmd>set wrap!<cr>", { desc = "Toggle text wrap", remap = true })

-- better up/down
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({"n", "v"}, "x", '"_x')

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
