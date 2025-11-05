-- local keymap = vim.keymap
local map = vim.keymap.set
local M = {}

M.on_attach = function(client, bufnr)
  -- key bind options
  local opts = { noremap = true, silent = true, buffer = bufnr }

---- set keybinds
  -- -- keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts) -- show definiton, references
  -- keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts) -- go to definition
  -- -- keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definiton and make edits in window
  -- --  keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation<CR>", opts) -- go to implementation
  -- keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
----  Enhanced LSP code action menu without additional plugins
  -- -- keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
  -- -- keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show diagnostics for line
  -- -- keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
  -- -- keymap.set("n", "<leader>pd", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to prev diagnostic in buffer
  -- -- keymap.set("n", "<leader>nd", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
  -- keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what's under the cursor

  -- keymap.set("n", "<leader>lo", "<cmd>LSoutLinToggle<CR>", opts) -- see outline for right hand side
  if client.name == "pyright" then
    map("n", "<leader>oi", "<cmd>PyrightOrganizeImports<CR>", opts)
    end
  end

return M
