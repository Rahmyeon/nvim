vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Bootstrap lazy.nvim
--local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
--if not (vim.uv or vim.loop).fs_stat(lazypath) then
--	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
--	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
--	if vim.v.shell_error ~= 0 then
--		vim.api.nvim_echo({
--			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
--			{ out, "WarningMsg" },
--			{ "\nPress any key to exit..." },
--		}, true, {})
--		vim.fn.getchar()
--		os.exit(1)
--	end
--end


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)


-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{
      import = "plugins"
    },
	},
 	performance = {
	  cache = {
	  	enabled = true,
	  },
	  rtp = {
      reset = true,
	  	disabled_plugins = {
	  		"matchit",
	  		"matchparen",
	  		"netrwPlugin",
	  		"gzip",
	  		"tarPlugin",
	  		"tohtml",
	  		"tutor",
	  		"zipPlugin",
	  	},
	  },
},
debug = false,
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	-- install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
})
-- vim.cmd.colorscheme("catppuccin-macchiato")

local function get_windows_theme()
  local handle = io.popen(
    'reg query HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize /v AppsUseLightTheme'
  )

  if handle then
    local result = handle:read("*a")
    handle:close()

    if result:match("0x0") then
      return "dark"
    else
      return "light"
    end
  end

  return "dark"
end

local theme = get_windows_theme()

if theme == "dark" then
  vim.o.background = "dark"
  vim.cmd.colorscheme("catppuccin-macchiato")
else
  vim.o.background = "light"
  vim.cmd.colorscheme("catppuccin-latte")
end


-- vim.cmd.colorscheme("catppuccin-latte")
-- vim.cmd("colorscheme vague")
require("config.options")
require("config.autocmds")
-- require("config.treesitter")
require("config.lsp_options")
-- require("lsp")
vim.lsp.enable({'lua_ls', 'jdtls', 'ltex_plus', 'marksman'})
-- vim.lsp.enable({'jdtls'})
-- vim.lsp.enable({'ltex_plus'})
-- vim.lsp.enable({'marksman'})

require("statusline")
require("config.keymaps")
-- require("config.markdown")
require("oil").setup()
-- require('mini.surround').setup()
require('mini.pairs').setup()
require('mini.icons').setup()
require('mini.ai').setup()
require('mini.clue').setup()
require("better_escape").setup()
-- require('mini.hipatterns').setup()
-- require('mini.operators').setup()
require("config.plugin_options")
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
-- require('mini.pick').setup()
-- require('colorizer').setup()
