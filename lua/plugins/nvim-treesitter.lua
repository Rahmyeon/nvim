return {
	"nvim-treesitter/nvim-treesitter",
  lazy = vim.fn.argc(-1) == 0,
  event = { "BufReadPost", "BufNewFile", "BufWritePre", "VeryLazy" },
  opts = {
		indent = {
			enable = true,
		},
		ensure_installed = {
      "c_sharp",
			"lua",
			"dockerfile",
			"gitignore",
			"javascript",
			"html",
			"css",
			"lua",
			"python",
			"c",
			"cpp",
			-- "zig",
      "markdown",
      "markdown_inline",
      "toml",
      "json",
      "java",
      -- "org",
      -- "elisp"
		},
		auto_install = true,
		highlight = {
			enable = true,
			-- additional_vim_regex_highlighting = true,
		},
  }
}
--Downloaded c, cpp, css, html, python,query, javascript
