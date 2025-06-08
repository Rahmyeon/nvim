return {
	"nvim-treesitter/nvim-treesitter",
  lazy = false,
  opts = {
		indent = {
			enable = true,
		},
		ensure_installed = {
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
			"zig",
      "markdown",
      "markdown_inline",
      "toml",
      "json",
      "java",
      "org",
      "elisp"
		},
		auto_install = true,
		highlight = {
			enable = true,
			-- additional_vim_regex_highlighting = true,
		},
  }
}
--Downloaded c, cpp, css, html, python,query, javascript
