-- local util = require 'util.util'
-- local on_attach = require("util.lsp").on_attach
-- local lspconfig = require("lspconfig")

-- local capabilities = require('blink.cmp').get_lsp_capabilities()

vim.lsp.config.marksman = ({
  -- capabilities = capabilities,
  -- on_attach = on_attach,
  filetypes = { "markdown", "markdown.mdx" },
  cmd = { "marksman", "server" },
  root_markers = {'.git', '.marksman.toml'},
  single_file_support = true,
})

vim.lsp.enable({'marksman'})

