local on_attach = require("util.lsp").on_attach
-- local lspconfig = require("lspconfig")
-- python

-- local capabilities = require('blink.cmp').get_lsp_capabilities()
vim.lsp.config.omnisharp = ({
	capabilities = {
    workspace = {
      workspaceFolders = false
    }
  },
  -- Filetypes to automatically attach to.
  cmd = { "omnisharp", "-z", "--hostPID", "12345", "DotNet:enablePackageRestore=false", "--encoding", "utf-8", "--languageserver" },
  filetypes = { "cs", "vb" },
	on_attach = on_attach,
  settings = {
    FormattingOptions = {
      EnableEditorConfigSupport = true
    },
    MsBuild = {},
    RenameOptions = {},
    RoslynExtensionsOptions = {},
    Sdk = {
      IncludePrereleases = true
    }
  },
  init_options = {},
  root_markers = { ".sln", ".csproj", "omnisharp.json", "function.json" }
})


vim.lsp.enable({'omnisharp'})
