local on_attach = require("util.lsp").on_attach
-- local capabilities = require('blink.cmp').get_lsp_capabilities()

vim.lsp.config.luals = {
  -- Command and arguments to start the server.
  cmd = { 'lua-language-server' },
  -- capabilities = capabilities,
  on_attach = on_attach,
  -- Filetypes to automatically attach to.
  filetypes = { 'lua' },
  settings = { --Custom settings for lua
    Lua = {
-- make language server recognise "vim" global
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
    --make the language server aware of runtime files
        library = {
          -- vim.fn.env.VIMRUNTIME,
          vim.fn.expand("$VIMRUNTIME/lua"),
          vim.fn.expand("$XDG_CONFIG_HOME") .. "/nvim/lua",
        },
      },
      single_file_support = true,
    },
  },
  -- Sets the "root directory" to the parent directory of the file in the
  -- current buffer that contains either a ".luarc.json" or a
  -- ".luarc.jsonc" file. Files that share a root directory will reuse
  -- the connection to the same LSP server.
  root_markers = { '.luarc.json', '.luarc.jsonc' },
  -- Specific settings to send to the server. The schema for this is
  -- defined by the server. For example the schema for lua-language-server
  -- can be found here https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
}

vim.lsp.enable({'luals'})
