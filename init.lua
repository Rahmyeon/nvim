vim.cmd([[
  syntax off
  filetype off
  filetype plugin indent off
]])
-- vim.cmd('syntax off')
-- vim.cmd('filetype off')
-- vim.cmd('filetype plugin indent off')


-- Higlights fix
-- vim.hl = vim.highlight

-- Disable built-in plugins
-- vim.g.loaded_gzip = 1
-- vim.g.loaded_matchit = 1
-- vim.g.loaded_matchparen = 1
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
-- vim.g.loaded_tarPlugin = 1
--
--
--.vim.g.loaded_zipPlugin = 1
-- vim.g.loaded_tutor = 1
-- vim.g.loaded_2html_plugin = 1
--
--.


local vim = vim
local g = vim.g

g.loaded_gzip = 1
g.loaded_zip = 1

g.loaded_zipPlugin = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1

g.loaded_getscript = 1
g.loaded_getscriptPlugin = 1
g.loaded_vimball = 1
g.loaded_vimballPlugin = 1
g.loaded_2html_plugin = 1

g.loaded_matchit = 1
g.loaded_matchparen = 1
g.loaded_logiPat = 1
g.loaded_rrhelper = 1

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_netrwSettings = 1
g.loaded_netrwFileHandlers = 1

-- Sets leader
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = " "

-- Lazy Setup
require("config.lazy")

require("oil").setup()
-- Setup directory is required
-- vim.cmd('runtime! lua/Setup/*.lua')
--#ffffff
-- Keymaps directory required
-- vim.cmd('runtime! lua/keymaps/*.lua')
-- 
-- -- Lsp directory required
-- vim.cmd('runtime! lua/lsp/*.lua')

-- vim.cmd.colorscheme("catppuccin-macchiato")
-- vim.cmd.colorscheme("mellow")
-- Example config in lua

-- Configure the appearance
-- vim.g.mellow_italic_functions = true
-- vim.g.mellow_bold_functions = true
-- 
-- vim.g.mellow_highlight_overrides = {
--   ["@keyword.return"] = { fg = "#d4849d", bold = true, italic = true }, -- Brightened
-- }


-- require('colorizer').setup()

-- require('-- require('colorizer').setup()|set nopaste').setup()
-- Enable true color support

-- Now load nvim-colorizer
-- disable status bar
-- vim.opt.laststatus=1
--  vim.lsp.set_log_level("debug")
-- require'lspconfig'.jdtls.setup{ cmd = {vim.fn.stdpath('data') .. "/mason/bin/jdtls.cmd"} }
-- require('lspconfig').jdtls.setup({})
-- require("config.statusline")
-- vim.cmd('syntax on')
-- vim.cmd('filetype on')
-- vim.cmd('filetype plugin indent on')
-- require("config.statusline")
-- require("config.sl")
-- This needs to be at bottom of your `init.lua`
-- require("lua.statusline")
require("statusline")
-- require("statusline")

vim.cmd([[
  syntax on
  filetype on
  filetype plugin indent on
]])
