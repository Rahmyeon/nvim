return { "catppuccin/nvim",
  name = "catppuccin",
  lazy = true,
  priority = 1001,
  opts = {
    -- integrations = {
    --   blink_cmp = true
    -- },
    -- transparent_background = true, -- disables setting the background color.
    auto_integrations = true,
    compile_path = vim.fn.stdpath "cache" .. "/catppuccin",
    -- transparent_background = false, -- disables setting the background color.
    color_overrides = {
      latte = {
       -- Core accents (Desaturated & slightly darker for visibility on white)
       rosewater = "#c995bd",
       flamingo = "#bf7d7d",
       pink = "#ab86ad",
       mauve = "#a67bc4",
       red = "#b56e6e",
       maroon = "#9c8f85", -- Matched the beige tone of your dark mode yellow/maroon
       peach = "#d69666",
       yellow = "#9c8f85", -- Kept identical to maroon (as per your dark config)
       green = "#7da67d",
       teal = "#5fa194",
       sky = "#6c91e0",
       sapphire = "#6a88c2",
       blue = "#5d7e99",
       lavender = "#8a8aa3",

       -- Text hierarchy (Inverted: Dark Grey to Lighter Grey)
       text = "#4c4f50",
       subtext1 = "#686a76",
       subtext0 = "#858896",

       -- Overlays (Mid-tones)
       overlay2 = "#7c8ca1",
       overlay1 = "#8c94a6",
       overlay0 = "#9ca0b0",

       -- Surfaces (Separators/UI elements)
       surface2 = "#acb0be",
       surface1 = "#bcc0cc",
       surface0 = "#ccd0da",

       -- Bases (Backgrounds: Warm/Paper White to Light Grey)
       base = "#f4f2f0",   -- A warm, "old paper" white
       mantle = "#e6e4e1", -- Slightly darker border
       crust = "#dcdad7",  -- Darkest background element
      },
      macchiato = {
       -- Core accents
       rosewater = "#e4bedd",
       flamingo = "#cb9595",
       pink = "#bb9dbd",
       mauve = "#c9a2e2",
       red = "#c48282",
       maroon = "#d6c4b7",
       peach = "#e7b58b",
       yellow = "#d6c4b7",
       green = "#b7d6b7",
       teal = "#89c5bb",
       sky = "#b6cdfb",
       sapphire = "#8eaeea",
       blue = "#6e93b1",
       lavender = "#c3c3d5",

       -- Text hierarchy
       text = "#cdcdcd",
       subtext1 = "#c3c3d5",
       subtext0 = "#90a0b5",

       -- Overlays
       overlay2 = "#6e94b2",
       overlay1 = "#606079",
       overlay0 = "#5a6a83",

       -- Surfaces
       surface2 = "#494d64",
       surface1 = "#333738",
       surface0 = "#252530",

       -- Bases
       base = "#1f202a",
       mantle = "#1c1c24",
       -- crust = "#232136",
       -- crust = "#0f0d0e",
        -- crust = "#1d1d1d"

      },
    },
    highlight_overrides = {
      latte = function (latte)
        return {
          ["@keyword.conditional"] = { fg = latte.pink}, -- brightened
          ["@keyword.function"] = { fg = latte.pink}, -- brightened
          ["@keyword.function.lua"] = { fg = latte.pink}, -- brightened
          ["@lsp.type.method"] = { fg = latte.pink }, -- brightened
          ["Keyword"] = { fg = latte.pink}, -- Brightened
          ["StatusLine"] = { bg = latte.crust}, -- Brightened
          ["Comment"] = { fg = latte.overlay1}, -- Brightened
          ["Normal"] = { bg = latte.crust },
          ["NormalNC"] = { bg = latte.crust },
          ["@comment"] = { fg = latte.overlay1}, -- Brightened
          ["@operator"] = { fg = latte.subtext0}, -- Brightened
          ["@lsp.type.comment"] = { fg = latte.overlay1}, -- Brightened
          ["@keyword.return"] = { fg = latte.red, bold = true, italic = true }, -- Brightened
          ["@keyword.variable"] = { fg = latte.text }, -- brightened
          ["@lsp.type.variable"] = { fg = latte.text }, -- brightened
          ["@lsp.type.property"] = { fg = latte.text }, -- brightened
          ["Delimiter"] = { fg = latte.text }, -- brightened
          ["@punctuation"] = { fg = latte.text }, -- brightened
          ["@punctuation.bracket"] = { fg = latte.text }, -- brightened
          ["@constructor.lua"] = { fg = latte.text }, -- brightened
          ["@lsp.type.parameter"] = { fg = latte.red }, -- brightened
          ["FloatBorder"] = { fg = latte.text, bg = "none" },
          ["NormalFloat"] = { bg = "none" },
          ["BlinkCmpMenuBorder"] = {  bg = "none" },
          ["BlinkCmpDocumentationBorder"] = {  bg = "none" },
          ["BlinkCmpMenu"] = { bg = "none" },
          -- ["BlinkCmpMenuSelection"] = {  bg = "none" },
          ["NoiceCmdlinePopupBorder"] = { fg = latte.blue },
          ["NoiceCmdlinePopupTitle"] = { fg = latte.blue },
          ["NoiceCmdlineIcon"] = { fg = latte.blue },
          -- ["Normal"] = { bg = "#0f0d0e" },
          -- ["NormalNC"] = { bg = "#0f0d0e" },
          ["Pmenu"] = { bg = "none" },
          -- ["PmenuSel"] = { bg = "#6e738d" },
          ["@markup.quote.markdown"] = { fg = latte.text, bold = false },
          SnacksPickerBox = { bg = "none" }, -- Added subtle bg
          VoidFloatTerm = { fg = latte.blue },
          SagaLightBulb = { fg = latte.yellow },

          StatusLineModeNormal   = { fg = latte.crust, bg = latte.blue, bold = true },
          StatusLineModeInsert   = { fg = latte.crust, bg = latte.green, bold = true },
          StatusLineModeVisual   = { fg = latte.crust, bg = latte.mauve, bold = true },
          StatusLineModeCommand  = { fg = latte.crust, bg = latte.peach, bold = true },
          StatusLineModeOther    = { fg = latte.crust, bg = latte.overlay0, bold = true },

          -- Separators
          StatusLineModeSeparatorNormal   = { fg = latte.blue, bg = latte.crust },
          StatusLineModeSeparatorInsert   = { fg = latte.green, bg = latte.crust },
          StatusLineModeSeparatorVisual   = { fg = latte.mauve, bg = latte.crust },
          StatusLineModeSeparatorCommand  = { fg = latte.peach, bg = latte.crust },
          StatusLineModeSeparatorOther    = { fg = latte.overlay0, bg = latte.crust },

          -- Extras
          StatusLineTitle   = { fg = latte.text, bold = true },
          StatusLineItalic  = { fg = latte.overlay0, italic = true },
          StatusLineError   = { fg = latte.red, bold = true },
          StatusLineWarning = { fg = latte.yellow },
          StatusLineHint    = { fg = latte.teal },
          StatusLineSpinner = { fg = latte.sky },
        }
      end,
      macchiato = function(macchiato)
        return {
          -- ["@lsp.type.class"] = { fg = "#d6c4b7", bold = false, italic = true } -- brightened
          -- ["SpecialChar"] = { fg = "#d6c4b7", bold = false, italic = true } -- brightened

          ["@keyword.conditional"] = { fg = macchiato.pink}, -- brightened
          ["@keyword.function"] = { fg = macchiato.pink}, -- brightened
          ["@keyword.function.lua"] = { fg = macchiato.pink}, -- brightened
          ["@lsp.type.method"] = { fg = macchiato.pink }, -- brightened
          ["Keyword"] = { fg = macchiato.pink}, -- Brightened
          ["StatusLine"] = { bg = macchiato.base}, -- Brightened
          ["Comment"] = { fg = macchiato.overlay1}, -- Brightened
          -- ["Normal"] = { bg = macchiato.crust },
          -- ["NormalNC"] = { bg = macchiato.crust },
          -- ["Normal"] = { bg = macchiato.crust },
          -- ["NormalNC"] = { bg = macchiato.crust },
          ["@comment"] = { fg = macchiato.overlay1}, -- Brightened
          ["@operator"] = { fg = macchiato.subtext0}, -- Brightened
          ["@lsp.type.comment"] = { fg = macchiato.overlay1}, -- Brightened
          ["@keyword.return"] = { fg = macchiato.red, bold = true, italic = true }, -- Brightened
          ["@keyword.variable"] = { fg = macchiato.text }, -- brightened
          ["@lsp.type.variable"] = { fg = macchiato.text }, -- brightened
          ["@lsp.type.property"] = { fg = macchiato.text }, -- brightened
          ["Delimiter"] = { fg = macchiato.text }, -- brightened
          ["@punctuation"] = { fg = macchiato.text }, -- brightened
          ["@punctuation.bracket"] = { fg = macchiato.text }, -- brightened
          ["@constructor.lua"] = { fg = macchiato.text }, -- brightened
          ["@lsp.type.parameter"] = { fg = macchiato.red }, -- brightened
          ["FloatBorder"] = { fg = macchiato.text, bg = "none" },
          ["NormalFloat"] = { bg = "none" },
          ["BlinkCmpMenuBorder"] = {  bg = "none" },
          ["BlinkCmpDocumentationBorder"] = {  bg = "none" },
          ["BlinkCmpMenu"] = { bg = "none" },
          -- ["BlinkCmpMenuSelection"] = {  bg = "none" },
          ["NoiceCmdlinePopupBorder"] = { fg = macchiato.blue },
          ["NoiceCmdlinePopupTitle"] = { fg = macchiato.blue },
          ["NoiceCmdlineIcon"] = { fg = macchiato.blue },
          -- ["Normal"] = { bg = "#0f0d0e" },
          -- ["NormalNC"] = { bg = "#0f0d0e" },
          ["Pmenu"] = { bg = "none" },
          -- ["PmenuSel"] = { bg = "#6e738d" },
          ["@markup.quote.markdown"] = { fg = macchiato.text, bold = false },
          SnacksPickerBox = { bg = "none" }, -- Added subtle bg
          -- VoidFloatTerm = { fg = macchiato.blue },
          -- SagaLightBulb = { fg = macchiato.yellow },

          StatusLineModeNormal   = { fg = macchiato.crust, bg = macchiato.blue, bold = true },
          StatusLineModeInsert   = { fg = macchiato.crust, bg = macchiato.green, bold = true },
          StatusLineModeVisual   = { fg = macchiato.crust, bg = macchiato.mauve, bold = true },
          StatusLineModeCommand  = { fg = macchiato.crust, bg = macchiato.peach, bold = true },
          StatusLineModeOther    = { fg = macchiato.crust, bg = macchiato.overlay0, bold = true },

          -- Separators
          StatusLineModeSeparatorNormal   = { fg = macchiato.blue, bg = macchiato.base },
          StatusLineModeSeparatorInsert   = { fg = macchiato.green, bg = macchiato.base },
          StatusLineModeSeparatorVisual   = { fg = macchiato.mauve, bg = macchiato.base },
          StatusLineModeSeparatorCommand  = { fg = macchiato.peach, bg = macchiato.base },
          StatusLineModeSeparatorOther    = { fg = macchiato.overlay0, bg = macchiato.base },

          -- Extras
          StatusLineTitle   = { fg = macchiato.text, bold = true },
          StatusLineItalic  = { fg = macchiato.overlay0, italic = true },
          StatusLineError   = { fg = macchiato.red, bold = true },
          StatusLineWarning = { fg = macchiato.yellow },
          StatusLineHint    = { fg = macchiato.teal },
          StatusLineSpinner = { fg = macchiato.sky },
        }
      end
    }
  }
}



