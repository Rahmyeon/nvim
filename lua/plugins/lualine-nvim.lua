	--local theme = require("lualine.themes.gruvbox-material")
	--local theme = require("lualine.themes.gm_light_hard")
local macro_status = require("Setup.lualine_func")

return {
	"nvim-lualine/lualine.nvim",
  dependencies = {
    -- { 'zaldih/themery.nvim' },
    {'nvim-tree/nvim-web-devicons'},
  },
	lazy = false,
  opts = {
		options = {
			theme = 'catppuccin-macchiato',
			-- theme = 'mellow',
			globalstatus = true,
			component_separators = { left = "|", right = "|" },
			section_separators = { left = "", right = "" },
		},
		tabline = {
			lualine_a = { "mode" },
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_c = { macro_status.config.recording },
			lualine_x = { "filename", "filetype" },
			lualine_y = { "lsp_status" },
			lualine_z = { "location" },
		},
		sections = {},
  }
}
