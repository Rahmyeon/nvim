local diagnostics = require("util.icons").diagnostics
local M = {}

M.config = function()
  for type, icon in pairs(diagnostics) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end
end

return M
