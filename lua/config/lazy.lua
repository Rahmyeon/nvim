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
-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)


-- require("lazy").setup("plugins")

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

-- require("lazy").setup({
--   { import = "plugins" },
--   	performance = {
-- 		cache = {
-- 			enabled = true,
-- 		},
-- 		rtp = {
-- 			disabled_plugins = {
-- 				"matchit",
-- 				"matchparen",
-- 				"netrwPlugin",
-- 				"gzip",
-- 				"tarPlugin",
-- 				"tohtml",
-- 				"tutor",
-- 				"zipPlugin",
-- 			},
-- 		},
-- 	},
-- 	debug = false,
-- })





require("config.options")
-- vim.cmd.colorscheme("catppuccin-macchiato")
vim.cmd("colorscheme vague")
require("config.autocmds")
require("config.keymaps")
require("config.statusline")
-- vim.cmd('runtime! lua/keymaps/*.lua')

-- Lsp directory required
-- vim.cmd('runtime! lua/lsp/*.lua')
require("lsp")


-- local opts = {
-- 	defaults = { true },
-- 	install = {
-- 		colorscheme = { "themery.nvim" },
-- 	},
-- 	rtp = {
-- 		disabled_plugins = {
-- 			"gzip",
-- 			"matchit",
-- 			"matchparen",
-- 			"newtrw",
-- 			"newtrwPlugin",
-- 			"tarPlugin",
-- 			"zipPlugin",
-- 		},
-- 	},
-- 	change_detection = {
-- 		notify = true,
-- 	},
-- }

-- require("nvim-tree").setup({
-- 	sort = {
-- 		sorter = "case_sensitive",
-- 	},
-- 	view = {
-- 		width = 30,
-- 	},
-- 	renderer = {
-- 		group_empty = true,
-- 	},
-- 	filters = {
-- 		dotfiles = true,
-- 	},
-- })

