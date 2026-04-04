vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
    },
  },
  virtual_text = true,
  severity_sort = true,
  update_in_insert = false,
})


vim.lsp.document_color.enable()

local diagnostics = require("util.icons").diagnostics
local M = {}

M.config = function()
  for type, icon in pairs(diagnostics) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end
end

return M
