return {
  { 
    "nvim-lua/plenary.nvim", -- lua functions that many plugins use 
  },
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  }

}
