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
vim.cmd.colorscheme("catppuccin-macchiato")
-- vim.cmd("colorscheme vague")
require("config.options")
require("config.autocmds")
require("lsp")


require("statusline")
require("config.keymaps")
require("oil").setup()
require('mini.surround').setup()
require('mini.pairs').setup()
require('mini.icons').setup()
require('mini.ai').setup()
require('mini.clue').setup()


-- require('mini.hipatterns').setup()
-- require('mini.operators').setup()
require("config.plugin_options")
-- require('mini.pick').setup()
-- require('colorizer').setup()
