return { "catppuccin/nvim",
  name = "catppuccin",
  lazy = true,
  priority = 1001,
  opts = {
    integrations = {
      blink_cmp = true
    },
    -- transparent_background = true, -- disables setting the background color.
    -- transparent_background = false, -- disables setting the background color.
    highlight_overrides = {
      macchiato = function(macchiato)
        return {
          ["@keyword.return"] = { fg = macchiato.red, bold = true, italic = true }, -- Brightened
          ["FloatBorder"] = { fg = macchiato.blue, bg = "none" },
          ["NormalFloat"] = { bg = "none" },
          ["BlinkCmpMenuBorder"] = {  bg = "none" },
          ["BlinkCmpDocumentationBorder"] = {  bg = "none" },
          ["BlinkCmpMenu"] = { bg = "none" },
          -- ["BlinkCmpMenuSelection"] = {  bg = "none" },
          ["NoiceCmdlinePopupBorder"] = { fg = macchiato.blue },
          ["NoiceCmdlinePopupTitle"] = { fg = macchiato.blue },
          ["NoiceCmdlineIcon"] = { fg = macchiato.blue },
          ["Normal"] = { bg = "#0f0d0e" },
          ["NormalNC"] = { bg = "#0f0d0e" },
          ["Pmenu"] = { bg = "none" },
          ["PmenuSel"] = { bg = "#6e738d" },
          ["@markup.quote.markdown"] = { fg = macchiato.text, bold = false },
          SnacksPickerBox = { bg = "none" }, -- Added subtle bg
          VoidFloatTerm = { fg = macchiato.blue },
          SagaLightBulb = { fg = macchiato.yellow },

          StatusLineModeNormal   = { fg = macchiato.base, bg = macchiato.blue, bold = true },
          StatusLineModeInsert   = { fg = macchiato.base, bg = macchiato.green, bold = true },
          StatusLineModeVisual   = { fg = macchiato.base, bg = macchiato.mauve, bold = true },
          StatusLineModeCommand  = { fg = macchiato.base, bg = macchiato.peach, bold = true },
          StatusLineModeOther    = { fg = macchiato.base, bg = macchiato.overlay0, bold = true },

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



-- }
  -- { "ellisonleao/gruvbox.nvim" },
  --{
  --  'sainnhe/gruvbox-material',
  --    config = function()
  --      -- Optionally configure and load the colorscheme
  --      -- directly inside the plugin declaration.
  --      vim.g.gruvbox_material_enable_italic = true
  --      vim.g.gruvbox_material_background = "hard"
  --    end
  --},
  -- { "rose-pine/neovim" },
