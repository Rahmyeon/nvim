-- local hipatterns = require('mini.hipatterns')
-- hipatterns.setup({
--   highlighters = {
--     hex_color = hipatterns.gen_highlighter.hex_color(),
--   }
-- })
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
