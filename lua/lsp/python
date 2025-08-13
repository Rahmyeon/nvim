local on_attach = require("util.lsp").on_attach
-- local lspconfig = require("lspconfig")
-- python

-- local capabilities = require('blink.cmp').get_lsp_capabilities()
vim.lsp.config.pyright = ({
	-- capabilities = capabilities,
  -- Filetypes to automatically attach to.
  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { 'python' },
	on_attach = on_attach,
	settings = {
		pyright = {
			disableOrganizeImports = false,
			analysis = {
				useLibraryCodeForTypes = true,
				autoSearchPaths = true,
				diagnosticMode = "workspace",
				autoImportCompletions = true,
			},
		},
	},
})


vim.lsp.enable({'pyright'})
