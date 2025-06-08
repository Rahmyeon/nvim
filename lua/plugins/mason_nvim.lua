return {
	"williamboman/mason.nvim",
	cmd = "Mason",
	event = "BufReadPre",
	opts = {
    registries = {
      -- 'github:nvim-java/mason-registry',
      'github:mason-org/mason-registry',
      },
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
    ensure_installed = {
        "marksmans",
        "markdown-toc",
        "markdownlint-cli2",
        "clangd",
        "clang-format",
        "mypy"
      },
		},
	},
}
