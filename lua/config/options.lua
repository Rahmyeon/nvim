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
-- Status line
vim.o.laststatus = 3
vim.o.cmdheight = 1
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

-- Disable health checks for these providers.
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

-- windows specific
--
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
---@diagnostic disable-next-line: duplicate-set-field
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = "rounded" -- Or any other border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- In your init.lua or a plugin file
vim.o.exrc = true  -- Enable reading local config files
vim.o.secure = true  -- Prevent unsafe commands in local configs

require('vim._core.ui2').enable({
  enable = true, -- Whether to enable or disable the UI.
  msg = { -- Options related to the message module.
    ---@type 'cmd'|'msg' Default message target, either in the
    ---cmdline or in a separate ephemeral message window.
    ---@type string|table<string, 'cmd'|'msg'|'pager'> Default message target
    ---or table mapping |ui-messages| kinds and triggers to a target.
    targets = 'cmd',
    cmd = { -- Options related to messages in the cmdline window.
      height = 0.5 -- Maximum height while expanded for messages beyond 'cmdheight'.
    },
    dialog = { -- Options related to dialog window.
      height = 0.5, -- Maximum height.
    },
    msg = { -- Options related to msg window.
      height = 0.5, -- Maximum height.
      timeout = 4000, -- Time a message is visible in the message window.
    },
    pager = { -- Options related to message window.
      height = 1, -- Maximum height.
    },
  },
})


-- vim.o.cmdheight = 1
-- require("vim._core.ui2").enable({
-- 	enable = true,
-- 	msg = {
-- 		targets = {
-- 			[""] = "msg",
-- 			empty = "cmd",
-- 			bufwrite = "msg",
-- 			confirm = "cmd",
-- 			emsg = "pager",
-- 			echo = "msg",
-- 			echomsg = "msg",
-- 			echoerr = "pager",
-- 			completion = "cmd",
-- 			list_cmd = "pager",
-- 			lua_error = "pager",
-- 			lua_print = "msg",
-- 			progress = "pager",
-- 			rpc_error = "pager",
-- 			quickfix = "msg",
-- 			search_cmd = "cmd",
-- 			search_count = "cmd",
-- 			shell_cmd = "pager",
-- 			shell_err = "pager",
-- 			shell_out = "pager",
-- 			shell_ret = "msg",
-- 			undo = "msg",
-- 			verbose = "pager",
-- 			wildlist = "cmd",
-- 			wmsg = "msg",
-- 			typed_cmd = "cmd",
-- 		},
-- 		cmd = {
-- 			height = 0.5,
-- 		},
-- 		dialog = {
-- 			height = 0.5,
-- 		},
-- 		msg = {
-- 			height = 0.3,
-- 			timeout = 5000,
-- 		},
-- 		pager = {
-- 			height = 0.5,
-- 		},
-- 	},
-- })
