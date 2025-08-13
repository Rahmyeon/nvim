local on_attach = require("util.lsp").on_attach
local util = require("util.util")
-- local lspconfig = require("lspconfig")
-- python

-- local capabilities = require('blink.cmp').get_lsp_capabilities()
vim.lsp.config.omnisharp = ({
	on_attach = on_attach,
  cmd = { "omnisharp", "-z", "--hostPID", "12345", "DotNet:enablePackageRestore=false", "--encoding", "utf-8", "--languageserver" },
  filetypes = { "cs", "vb" },
    root_dir = vim.fs.root(
      0, 
      function(name, path)
        return name:match('%.sln$') ~= nil
          or name:match('%.csproj$') ~=nil
          or name:match('.git') ~=nil
          or name:match('omnisharp.json') ~=nil
          or name:match('function.json') ~=nil
      end),
  init_options = {},
	capabilities = {
    workspace = {
      workspaceFolders = false
    }
  },
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
  }
})


vim.lsp.enable({'omnisharp'})
