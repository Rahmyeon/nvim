-- Highlight entire line for errors
-- Highlight the line number for warnings
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

-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
--   vim.lsp.handlers.hover, {
--     border = "rounded"
--   }
-- )

-- vim.lsp.open_floating_preview({
--   border = "rounded"
-- })
