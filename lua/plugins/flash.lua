return {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {
    modes = {
      char = {
        enabled = true,
        keys = {},
      }
    }
  },
  keys = {
    {
      "of", 
      mode = {"n"},
      function ()
        require("flash").jump({
          search = {
            forward = true,  -- Changed: boolean, not string
            wrap = false,    -- Changed: boolean, not string
            multi_window = false  -- Changed: removed quotes from key
          },
          jump = { offset = 0 }
        }) 
      end,
      desc = "flash f"
    },
    {
      "of", 
      mode = {"x", "o" },
      function ()
        require("flash").jump({
          search = {
            forward = true,  -- Changed: boolean, not string
            wrap = false,    -- Changed: boolean, not string
            multi_window = false  -- Changed: removed quotes from key
          },
          jump = { offset = 1 }
        }) 
      end,
      desc = "flash f"
    },
    {
      "oF", 
      mode = { "n" }, 
      function () 
        require("flash").jump({
          search = {
            forward = false,  -- Changed: boolean, not string
            wrap = false,     -- Changed: boolean, not string
            multi_window = false  -- Changed: removed quotes from key
          },
          jump = { offset = 0 }
        }) 
      end,
      desc = "flash F"
    },
    {
      "oF", 
      mode = { "x", "o" }, 
      function () 
        require("flash").jump({
          search = {
            forward = false,  -- Changed: boolean, not string
            wrap = false,     -- Changed: boolean, not string
            multi_window = false  -- Changed: removed quotes from key
          },
          jump = { offset = 1 }
        }) 
      end,
      desc = "flash F"
    },
    {
      "ot", 
      mode = { "n" }, 
      function ()
        require("flash").jump({
          search = { 
            forward = true,      -- Changed: boolean, not string
            wrap = false,     -- Changed: boolean, not string
            multi_window = false, -- Changed: removed quotes from key
            mode = "search",    -- Changed: use "search" not "char"
          },
          label = { after = false, before = true },
          jump = { offset = -1 }
        })
      end,
      desc = "flash t"
    },
    {
      "ot", 
      mode = { "x", "o" }, 
      function ()
        require("flash").jump({
          search = { 
            forward = true,      -- Changed: boolean, not string
            wrap = false,     -- Changed: boolean, not string
            multi_window = false, -- Changed: removed quotes from key
            mode = "search",    -- Changed: use "search" not "char"
          },
          label = { after = false, before = true },
          jump = { offset = 0 }
        })
      end,
      desc = "flash t"
    },
    {
      "oT",
      mode = { "n" },
      function ()
        require("flash").jump({
          search = {
            forward = false,  -- Changed: boolean, not string
            wrap = false,     -- Changed: boolean, not string
            multi_window = false  -- Changed: removed quotes from key
          },
          label = { after = false, before = true },
          jump = { offset = -1 }
        })
      end,
      desc = "flash T"
    },
    {
      "oT",
      mode = { "x", "o" },
      function ()
        require("flash").jump({
          search = {
            forward = false,  -- Changed: boolean, not string
            wrap = false,     -- Changed: boolean, not string
            multi_window = false  -- Changed: removed quotes from key
          },
          label = { after = false, before = true },
          jump = { offset = 0 }
        })
      end,
      desc = "flash T"
    },
    { "ok", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "Ok", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}
