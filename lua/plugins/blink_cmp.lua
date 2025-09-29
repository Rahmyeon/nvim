return {
  'saghen/blink.cmp',
  version = '*',
  -- commit = '095dc77',
  -- !Important! Make sure you're using the latest release of LuaSnip
  -- `main` does not work at the moment
  dependencies = {
    -- {
    --   {
    --     'Kaiser-Yang/blink-cmp-dictionary',
    --     dependencies = { 'nvim-lua/plenary.nvim' }
    --   },
    -- },
    {'rafamadriz/friendly-snippets'},
    { 'L3MON4D3/LuaSnip', version = 'v2.*', lazy = true },
  },
  opts_extend = {
    "sources.default",
    "sources.completion.enabled_providers"
  },
  event = { "InsertEnter", "CmdlineEnter"},
  -- ---@module 'blink.cmp'
  -- ---@type blink.cmp.Config
  opts = {
    snippets = { preset = 'luasnip' },
    fuzzy = { implementation = "prefer_rust" },
    cmdline = {
      keymap = {
        preset = 'enter',
        ['<C-k>'] = {'select_prev' },
        ['<C-j>'] = { 'select_next'},
        ['<space>'] = { 'accept', 'fallback' },
        ['<tab>'] = { 'accept', 'fallback' }
      },
      completion = {
        list = {
          selection = {
          preselect = false,
          auto_insert = true
          }
        },
        menu = { auto_show = true }
      }
    },
    sources = {
    default = {
        -- 'dictionary',
        'lsp',
        'path',
        'snippets',
        'buffer',
        -- 'lazydev',
        -- 'markdown'
      },
    providers = {
      -- lazydev = {
      --   name = "Lazydev",
      --   module = 'lazydev.integrations.blink',
      --   score_offset = 70,
      -- },
      lsp = {
        name = "lsp",
        module = 'blink.cmp.sources.lsp',
        score_offset = 100,
        max_items = 3,
      },
      buffer = {
        name = "buffers",
        module = 'blink.cmp.sources.buffer',
        score_offset = 75,
        max_items = 3,
      },
      snippets = {
        name = "snippets",
        module =  'blink.cmp.sources.snippets',
        max_items = 4,
        score_offset = -40,
      },
      -- markdown = {
      --   name = 'RenderMarkdown',
      --   module = 'render-markdown.integ.blink',
      --   fallbacks = { 'lsp' },
      --   score_offset = 85,
      --  },
       -- dictionary = {
       --  name = 'Dict',
       --  module = 'blink-cmp-dictionary',
       --  enabled = true,
       --  min_keyword_length = 5,
       --  max_items = 8,
       --  score_offset = 65,
       --  opts = {
       --    dictionary_directories = { "~/dictionaries"},
       --    -- separate_output = function(output)
       --    --     local items = {}
       --    --     for line in output:gmatch("[^\r\n]+") do
       --    --         table.insert(items, {
       --    --             label = line,
       --    --             insert_text = line,
       --    --             documentation = nil
       --    --         })
       --    --     end
       --    --     return items
       --    -- end
       --   }
       -- }
     }
   },
   keymap = {
     preset = 'enter',
     ['<C-k>'] = {'select_prev' },
     ['<C-j>'] = { 'select_next'},
     -- ['<space>'] = { 'accept', 'fallback' },
     ['<tab>'] = { 'accept', 'fallback' }
   },
   appearance = {
     use_nvim_cmp_as_default = true,
     nerd_font_variant = 'mono'
   },
   completion = {
      list = {
        selection = {
        preselect = false,
        auto_insert = true
        }
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
      ghost_text = { enabled = true },
      menu = {
        draw = {
          columns = {
            { "label", "label_description", gap = 1},
            { "kind_icon", gap = 2, "kind" },
          }
        },
        border = "rounded",
        winhighlight = 'Normal:BlinkCmpMenu,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None',
      },
    },
    enabled = function ()
      local filetype = vim.bo[0].filetype
      if filetype == "snacks_picker_input" then
        return false
      end
      return true
    end
  },
}
