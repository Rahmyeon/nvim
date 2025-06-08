local diagnostic_signs = require("util.icons").diagnostic_signs
local M = {}

M.config = function()
  for type, icon in pairs(diagnostic_signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end
end

return M
