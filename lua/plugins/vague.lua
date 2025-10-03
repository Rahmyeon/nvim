
return {
  "vague2k/vague.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other plugins
  opts = {
    on_highlights = function(highlights, colors)
      highlights["@keyword.return"] = { fg = "#cb9595", bold = true, italic = true } -- brightened
      highlights["Statement"] = { fg = "#cb9595", bold = true, italic = true } -- brightened
      highlights["@keyword.variable"] = { fg = "#cdcdcd", bold = false, italic = true } -- brightened
      highlights["@lsp.type.variable"] = { fg = "#cdcdcd", bold = false, italic = true } -- brightened
      highlights["@lsp.type.method"] = { fg = "#bb9dbd", bold = false, italic = true } -- brightened
      highlights["@lsp.type.method.lua"] = { fg = "#6e93b1", bold = false, italic = true } -- brightened
      highlights["@lsp.type.function"] = { fg = "#6e93b1", bold = false, italic = true } -- brightened
      highlights["@lsp.typemod.function"] = { fg = "#6e93b1", bold = false, italic = true } -- brightened

      highlights["@keyword.function"] = { fg = "#bb9dbd", bold = false, italic = true } -- brightened
      highlights["@keyword.function.lua"] = { fg = "#bb9dbd", bold = false, italic = true } -- brightened
      highlights["@keyword.vim"] = { fg = "#bb9dbd", bold = false, italic = true } -- brightened
      highlights["@lsp.typemod.function.defaultLibrary"] = { fg = "#e1bc92", bold = false, italic = true } -- brightened
      highlights["@lsp.typemod.variable.defaultLibrary"] = { fg = "#e4bedd", bold = false, italic = true } -- brightened


      highlights["@lsp.type.method"] = { fg = "#b6cdfb", bold = false, italic = true } -- brightened
      -- highlights["@string"] = { fg = "#d6c4b7", bold = false, italic = true } -- brightened
      highlights["@boolean"] = { fg = "#e1bc92", bold = false, italic = true } -- brightened
      highlights["@number"] = { fg = "#e1bc92", bold = false, italic = true } -- brightened
      highlights["@string"] = { fg = "#b7d6b7", bold = false, italic = true } -- brightened
      highlights["String"] = { fg = "#b7d6b7", bold = false, italic = true } -- brightened
      -- highlights["@boolean"] = { fg = "#b7d6b7", bold = false, italic = true } -- brightened
      -- highlights["@number"] = { fg = "#b7d6b7", bold = false, italic = true } -- brightened
      -- highlights["@keyword.variable.member.lua"] = { fg = "#9bb4bc", bold = false, italic = true } -- brightened
      highlights["@lsp.type.property"] = { fg = "#cdcdcd", bold = false, italic = true } -- brightened
      -- highlights["@lsp.type.modifier"] = { fg = "#b6cdfb", bold = false, italic = true } -- brightened
      highlights["@lsp.type.modifier"] = { fg = "#bb9dbd", bold = false, italic = true } -- brightened
      -- highlights["@lsp.type.class"] = { fg = "#b7d6b7", bold = false, italic = true } -- brightened
      highlights["@lsp.type.class"] = { fg = "#d6c4b7", bold = false, italic = true } -- brightened
      highlights["SpecialChar"] = { fg = "#d6c4b7", bold = false, italic = true } -- brightened
      highlights["@lsp.type.parameter"] = { fg = "#cb9595", bold = false, italic = true } -- brightened

      highlights["@keyword.hints"] = { fg = "#90a0b5", bold = false, italic = true } -- brightened
      highlights["Error"] = { fg = "#cb9595", bold = false, italic = true } -- brightened
      highlights["ErrorMsg"] = { fg = "#cb9595", bold = false, italic = true } -- brightened
      highlights["DiagnosticError"] = { fg = "#cb9595", bold = false, italic = true } -- brightened
      highlights["SnacksPickerGitStatusUntracked"] = { fg = "#cb9595", bold = false, italic = true } -- brightened
      highlights["SnacksPickerGitStatusModified"] = { fg = "#e1bc92", bold = false, italic = true } -- brightened
      highlights["@keyword"] = { fg = "#bb9dbd", bold = false, italic = true } -- brightened
      highlights["@keyword.conditional"] = { fg = "#bb9dbd", bold = false } -- brightened
      highlights["@string.regexp"] = { fg = "#e4bedd", bold = false } -- brightened
      highlights["@constant.builtin"] = { fg = "#e1bc92", bold = true } -- brightened
      highlights["@constant"] = { fg = "#e1bc92", bold = true } -- brightened
      highlights["@constructor.lua"] = { fg = "#cdcdcd" } -- brightened
      -- highlights["SnacksDashboardTitle"] = { fg = "#cb9595" }
      highlights["SnacksDashboardHeader"] = { fg = "#6e94b2" }
      highlights["snacksdashboardDesc"] = { fg = "#cdcdcd" }
      highlights["snacksdashboardIcon"] = { fg = "#cdcdcd" }
      highlights["markdownH1"] = { fg = "#cb9595"}
      highlights["markdownH2"] = { fg = "#e1bc92"}
      highlights["markdownH3"] = { fg = "#6e93b1"}
      
      highlights["markdownH1Delimeter"] = { fg = "#cb9595"}
      highlights["markdownH2Delimeter"] = { fg = "#e1bc92"}
      highlights["markdownH3Delimeter"] = { fg = "#6e93b1"}
      
      colors.error = "#cb9595" 
      colors.bg = "#0f0d0e"
      colors.string = "#b7d6b7"
      colors.inactiveBg = "#1c1c24"
      colors.fg = "#cdcdcd"
      colors.line = "#252530"
      colors.comment = "#606079"
      colors.func = "#6e93b1"
      colors.number = "#e1bc92"
      colors.property = "#c3c3d5"
      colors.visual = "#333738"
      colors.warning = "#e1bc92"
      colors.hint = "#90a0b5"
      colors.keyword = "#6e94b2"
      colors.delta = "#f3be7c"

      highlights.StatusLine = { fg = colors.fg, bg = colors.bg }
      highlights.StatusLineNC = { fg = colors.comment, bg = colors.inactiveBg }

      highlights.StatusLineModeNormal   = { fg = colors.bg, bg = colors.keyword, bold = true }
      highlights.StatusLineModeInsert   = { fg = colors.bg, bg = colors.string, bold = true }
      highlights.StatusLineModeVisual   = { fg = colors.bg, bg = "#bb9dbd", bold = true }
      highlights.StatusLineModeCommand  = { fg = colors.bg, bg = colors.number, bold = true }
      highlights.StatusLineModeOther    = { fg = colors.bg, bg = colors.comment, bold = true }

      highlights.StatusLineModeSeparatorNormal   = { fg = colors.keyword, bg = colors.bg }
      highlights.StatusLineModeSeparatorInsert   = { fg = colors.string, bg = colors.bg }
      highlights.StatusLineModeSeparatorVisual   = { fg = "#bb9dbd", bg = colors.bg }
      highlights.StatusLineModeSeparatorCommand  = { fg = colors.number, bg = colors.bg }
      highlights.StatusLineModeSeparatorOther    = { fg = colors.comment, bg = colors.bg }

      highlights.StatusLineTitle   = { fg = colors.fg, bold = true }
      highlights.StatusLineItalic  = { fg = colors.comment, italic = true }
      highlights.StatusLineError   = { fg = colors.error, bold = true }
      highlights.StatusLineWarning = { fg = colors.warning }
      highlights.StatusLineHint    = { fg = colors.hint }
      highlights.StatusLineSpinner = { fg = colors.delta }
    end,
    -- optional configuration here
  }
}
