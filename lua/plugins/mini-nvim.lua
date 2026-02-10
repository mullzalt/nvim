return {
  { 
    'nvim-mini/mini.ai',
    version = false, 
    config = function()
      require('mini.ai').setup({})
    end
  },
  { 
    'nvim-mini/mini.icons',
    version = false, 
    config = function()
      require('mini.icons').setup({})
    end
  },
  { 
    'nvim-mini/mini.comment',
    version = false, 
    config = function()
      require('mini.comment').setup({})
    end
  },
  { 'nvim-mini/mini.pairs',
    version = false, 
    config = function()
      require('mini.pairs').setup({})
    end
  },
  { 'nvim-mini/mini.surround',
    version = false, 
    config = function()
      require('mini.surround').setup({})
    end
  },
  { 'nvim-mini/mini.jump', 
    version = false, 
    config = function()
      require('mini.jump').setup({})
    end
  },
  { 'nvim-mini/mini.statusline', 
    version = false, 
    config = function()
      require('mini.statusline').setup({})
    end
  },
  { 'nvim-mini/mini.snippets',
    version = false, 
    config = function()
      require('mini.snippets').setup({})
    end
  },
  {
    'nvim-mini/mini.keymap',
    version = false,
    config = function()
      local map_multistep = require("mini.keymap").map_multistep
      map_multistep('i', '<Tab>',   { 
        'minisnippets_next',
        'minisnippets_expand',  
        {
          condition = function()
            if vim.fn.pumvisible() ~= 1 then
              return false
            end
            local info = vim.fn.complete_info({ "items", "selected" })
            return #info.items == 1 and info.selected ~= -1
          end,
          action = function()
            return "<C-y>"
          end,

        },
        'pmenu_next'
      })
      map_multistep('i', '<S-Tab>', { 'minisnippets_prev', 'pmenu_prev' })
      map_multistep('i', '<CR>',    { 'pmenu_accept', 'minipairs_cr' })
      map_multistep('i', '<BS>',    { 'minipairs_bs' })
    end
  },
  { 
    'nvim-mini/mini.completion',
    version = false, 
    config = function()
      require('mini.completion').setup({})
    end
  },
  {
    'nvim-mini/mini.clue',
    version = false,
    config = function()
    require("mini.completion").setup()
    local miniclue = require('mini.clue')
    miniclue.setup({
      triggers = {
        -- Leader triggers
        { mode = { 'n', 'x' }, keys = '<Leader>' },

        -- `[` and `]` keys
        { mode = 'n', keys = '[' },
        { mode = 'n', keys = ']' },

        -- Built-in completion
        { mode = 'i', keys = '<C-x>' },

        -- `g` key
        { mode = { 'n', 'x' }, keys = 'g' },

        -- Marks
        { mode = { 'n', 'x' }, keys = "'" },
        { mode = { 'n', 'x' }, keys = '`' },

        -- Registers
        { mode = { 'n', 'x' }, keys = '"' },
        { mode = { 'i', 'c' }, keys = '<C-r>' },

        -- Window commands
        { mode = 'n', keys = '<C-w>' },

        -- `z` key
        { mode = { 'n', 'x' }, keys = 'z' },
      },

      clues = {
        -- Enhance this by adding descriptions for <Leader> mapping groups
        { mode = { 'n', 'x' }, keys = '<leader>f', desc = 'Find'},
        { mode = { 'n', 'x' }, keys = '<leader>w', desc = 'Wrapping'},
        miniclue.gen_clues.square_brackets(),
        miniclue.gen_clues.builtin_completion(),
        miniclue.gen_clues.g(),
        miniclue.gen_clues.marks(),
        miniclue.gen_clues.registers(),
        miniclue.gen_clues.windows(),
        miniclue.gen_clues.z(),
      },
      window = {
        delay = 300,
      },
    })
    end
  },
  {
    'nvim-mini/mini.bufremove',
    version = false,
    config = function()
      require('mini.bufremove').setup({})
    end
  }
}
