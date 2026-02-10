return {
  "https://github.com/junegunn/fzf.vim",
  dependencies = {
    "https://github.com/junegunn/fzf",
  },
  keys = {
    { "<Leader>ff", "<Cmd>Files<CR>", desc = "Find Files" },
    { "<Leader>fr", "<Cmd>History<CR>", desc = "Find Recents" },
    { "<Leader>fb", "<Cmd>Buffers<CR>", desc = "Find Buffers" },
    { "<Leader>fg", "<Cmd>Rg<CR>", desc = "Find Grep" },
  },
}

