-- local util = require 'util.util'
local on_attach = require("util.lsp").on_attach
-- local lspconfig = require("lspconfig")

-- local capabilities = require('blink.cmp').get_lsp_capabilities()
local language_id_mapping = {
  bib = 'bibtex',
  pandoc = 'markdown',
  plaintex = 'tex',
  rnoweb = 'rsweave',
  rst = 'restructuredtext',
  tex = 'latex',
  text = 'plaintext',
}

local function get_language_id(_, filetype)
  return language_id_mapping[filetype] or filetype
end


vim.lsp.config.ltex_plus = ({
  -- capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "bib", "gitcommit", "markdown", "org", "plaintex", "rst", "rnoweb", "tex", "pandoc", "quarto", "rmd", "context", "html", "xhtml", "mail", "text" },
  cmd = { "ltex-ls-plus" },
  root_markers = {'.git' },
  get_language_id = get_language_id,
  single_file_support = true,
  handlers = {
    ["$/progress"] = function(_, result, ctx) end,
  },
  settings = {
		ltex = {
			language = "en-GB",
      completionEnabled = true,
      enabled = {
        'bib',
        'context',
        'gitcommit',
        'html',
        'markdown',
        'org',
        'pandoc',
        'plaintex',
        'quarto',
        'mail',
        'mdx',
        'rmd',
        'rnoweb',
        'rst',
        'tex',
        'latex',
        'text',
        'typst',
        'xhtml',
      },
		},
	},
})


vim.lsp.enable({'ltex_plus'})
