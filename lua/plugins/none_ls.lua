return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- "windwp/nvim-autopairs",
    'nvim-mini/mini.pairs',
    "williamboman/mason.nvim",
  },
  event = "VeryLazy",
  config = function ()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- Lua
        null_ls.builtins.diagnostics.selene.with({
          extra_args = { "--config", vim.fn.expand("$HOME") .. "/AppData/Local/nvim/selene.toml" }
        })
        ,
        null_ls.builtins.formatting.stylua,     -- Formatter
        -- Python
        null_ls.builtins.diagnostics.mypy,      -- diagnostsics
        -- null_ls.builtins.diagnostics.ruff,      -- diagnostics
        null_ls.builtins.formatting.black,      -- Formatter
        -- C/C++
        null_ls.builtins.formatting.clang_format, -- Formatter
      },
    })


  end
}
