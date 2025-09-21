local on_attach = require("util.lsp").on_attach
-- local lspconfig = require("lspconfig")

local util = require("util.util")
-- local capabilities = require('blink.cmp').get_lsp_capabilities()
vim.lsp.config.csharp_ls = ({
	on_attach = on_attach,
  cmd = {"csharp-ls"},
  filetypes = { "cs" },
    root_dir = vim.fs.root(
      0, 
      function(name, path)
        return name:match('%.sln$') ~= nil
          or name:match('%.slnx$') ~=nil
          or name:match('%.csproj$') ~=nil
      end),
  -- root_dir = function(bufnr, on_dir)
  --   local fname = vim.api.nvim_buf_get_name(bufnr)
  --   on_dir(util.root_pattern '*.sln'(fname) or util.root_pattern '*.slnx'(fname) or util.root_pattern '*.csproj'(fname))
  -- end,
  -- root_dir = function(fname)
  --   local root_pattern = util.root_pattern('*.sln', '*.slnx', '*.csproj')
  --   return root_pattern(vim.fn.fnamemodify(fname, ':h'))  -- Pass directory, not file
  -- end,
  -- root_dir = function(fname)
  --   local root_pattern = util.root_pattern('*.sln', '*.slnx', '*.csproj')
  --   return root_pattern(fname)
  -- end,
    -- root_dir = util.root_pattern(
    --     '*.sln', -- Look for solution files
    --     '.git',  -- Common for any project (indicates a repo root)
    --     '*.csproj', -- Look for project files
    --     'Directory.Build.props', -- Custom MSBuild props
    --     'Directory.Build.targets' -- Custom MSBuild targets
    -- ),
  -- root_dir = function(fname)
  -- root_dir = function(fname)
  --   local root_pattern = util.root_pattern('*.sln', '*.slnx', '*.csproj', '.git')
  --   return root_pattern(fname)
  -- end,
  -- root_markers = { "*.sln", "*.csproj", "*.slnx"},
  init_options = {
    AutomaticWorkspaceInit = true
  },
})


vim.lsp.enable('csharp_ls')
