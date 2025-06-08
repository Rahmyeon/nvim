return { "catppuccin/nvim",
  name = "catppuccin",
  priority = 1001,
  opts = {
    integrations = {
      blink_cmp = true
    },
    transparent_background = true, -- disables setting the background color.
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
          ["BlinkCmpMenuSelection"] = {  bg = "none" },
          ["NoiceCmdlinePopupBorder"] = { fg = macchiato.blue },
          ["NoiceCmdlinePopupTitle"] = { fg = macchiato.blue },
          ["NoiceCmdlineIcon"] = { fg = macchiato.blue },
          ["Pmenu"] = { bg = "none" },
          ["@markup.quote.markdown"] = { fg = macchiato.text, bold = false },
          SnacksPickerBox = { bg = "none" }, -- Added subtle bg
          VoidFloatTerm = { fg = macchiato.blue },
          SagaLightBulb = { fg = macchiato.yellow }
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
