local hipatterns = require('mini.hipatterns')
hipatterns.setup({
  highlighters = {
    hex_color = hipatterns.gen_highlighter.hex_color(),
  }
})
--
local miniclue = require('mini.clue')
miniclue.setup({
  window = {
    -- which-key usually appears fairly quickly. 
    -- Default is 1000ms, suggested 0-500ms.
    -- delay = 0,

    config = {
      -- WIDTH: 
      -- 'auto' is good, but to get the full-width "bar" look of which-key,
      -- you can try setting a fixed large number or `vim.o.columns`.
      width = 'auto',

      -- POSITION: 
      -- This is the magic. Anchor to South-West (Bottom-Left).
      -- 'auto' row/col will stick it to the corner.
      anchor = 'sW',
      row = 'auto',
      col = 'auto',
    },
  },
  triggers = {
    -- Leader triggers
    { mode = 'n', keys = '<Leader>' },
    { mode = 'x', keys = '<Leader>' },

    -- Built-in completion
    { mode = 'i', keys = '<C-x>' },

    -- `g` key
    { mode = 'n', keys = 'g' },
    { mode = 'x', keys = 'g' },

    -- Marks
    { mode = 'n', keys = "'" },
    { mode = 'n', keys = '`' },
    { mode = 'x', keys = "'" },
    { mode = 'x', keys = '`' },

    -- Registers
    { mode = 'n', keys = '"' },
    { mode = 'x', keys = '"' },
    { mode = 'i', keys = '<C-r>' },
    { mode = 'c', keys = '<C-r>' },

    -- Window commands
    { mode = 'n', keys = '<C-w>' },

    -- `z` key
    { mode = 'n', keys = 'z' },
    { mode = 'x', keys = 'z' },
  },

  clues = {
    -- Enhance this by adding descriptions for <Leader> mapping groups
    miniclue.gen_clues.builtin_completion(),
    miniclue.gen_clues.g(),
    miniclue.gen_clues.marks(),
    miniclue.gen_clues.registers(),
    miniclue.gen_clues.windows(),
    miniclue.gen_clues.z(),
  },
})

-- require("mini.ai").setup({
-- })
require("mini.surround").setup({
  mappings = {
    add = "gsa", -- Add surrounding in Normal and Visul modes
    -- delete = "gsd", -- Delete surrounding
    -- find = "gsf", -- Find surrounding (to the right)
    -- find_left = "gsF", -- Find surrounding (to the left)
    -- highlight = "gsh", -- Highlight surrounding
    -- replce = "gsr", -- Replace surrounding
    update_n_lines = "gsn", -- Update `n_lines`
  },
})

-- mini.ai basic setup
require("mini.ai").setup({
  n_lines = 500,

  custom_textobjects = {
    -- Blocks: if/for/while, code blocks, etc.
    o = require("mini.ai").gen_spec.treesitter({
      a = { "@block.outer", "@conditional.outer", "@loop.outer" },
      i = { "@block.inner", "@conditional.inner", "@loop.inner" },
    }),

    -- Functions
    f = require("mini.ai").gen_spec.treesitter({
      a = {"@function.outer", "@method.outer"},
      i = {"@function.inner", "@method.inner"},
    }),

    -- Classes
    c = require("mini.ai").gen_spec.treesitter({
      a = "@class.outer",
      i = "@class.inner",
    }),

    -- HTML tags
    t = {
      "<([%p%w]-)%f[^<%w][^<>]->.-</%1>",
      "^<.->().*()</[^/]->$",
    },

    -- Digits
    d = { "%f[%d]%d+" },

    -- Word variants with case rules
    e = {
      {
        "%u[%l%d]+%f[^%l%d]",
        "%f[%S][%l%d]+%f[^%l%d]",
        "%f[%P][%l%d]+%f[^%l%d]",
        "^[%l%d]+%f[^%l%d]",
      },
      "^().*()$",
    },

    -- Whole buffer object ("g")
    -- g = require("mini.ai").gen_spec.buffer(),

    -- Function call textobject: u
    u = require("mini.ai").gen_spec.function_call(),

    -- Function call with restricted name character set: U
    U = require("mini.ai").gen_spec.function_call({
      name_pattern = "[%w_]",
    }),
  },
})

