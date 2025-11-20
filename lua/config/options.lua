local opt = vim.opt

-- Override vim.notify to use snacks
-- vim.notify = function(msg, level, opts)
--   Snacks.notifier.notify(msg, level, opts)
-- end

-- Tab / Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

 
-- opt.laststatus=0
-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.cursorline = true

--Folds for nvim-UFO
opt.foldcolumn = '1'
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true

-- Appearance
opt.number = true
opt.termguicolors = true
opt.colorcolumn = "100"
opt.signcolumn = "yes"
opt.cmdheight = 1
opt.scrolloff = 10
opt.completeopt = "menuone,noinsert,noselect"
opt.relativenumber = true
opt.signcolumn = "number"

--vim.opt.guifont = "JetBrainsMono NF:h16"

vim.opt.shortmess:append("I") -- This disables the intro message
-- Behaviour
opt.hidden = true
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.undofile = true
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
opt.iskeyword:append("-")
opt.selection = "exclusive"
opt.mouse = "a"
opt.clipboard:append("unnamedplus")
opt.modifiable = true
opt.guicursor =
	"n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
opt.encoding = "UTF-8"

-- Performance
opt.redrawtime = 10000
opt.maxmempattern = 20000
vim.o.shada = "'100,<50,s10,:1000,/100,@100,h" -- Limit ShaDa file (for startup)

vim.o.winborder = 'rounded'   -- Use border in floating windows
-- Example in your init.lua or a file like lua/config/lsp.lua

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
---@diagnostic disable-next-line: duplicate-set-field
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = "rounded" -- Or any other border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end


