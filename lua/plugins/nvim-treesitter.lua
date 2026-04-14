local languages = {
  "lua",
  "gitignore",
  "c",
  "cpp",
  "markdown",
  "toml",
  "json",
  -- "ps1",
  "java",
  -- "conf",
  "php"
}


return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  lazy = vim.fn.argc(-1) == 0,
  event = { "BufReadPost", "BufNewFile", "BufWritePre", "VeryLazy" },

  config = function()
    -- ensure_installed (async, skips existing)
    require("nvim-treesitter.install").prefer_git = true
    require("nvim-treesitter").install(languages)

    local group = vim.api.nvim_create_augroup("treesitter.setup", {})

    vim.api.nvim_create_autocmd("FileType", {
      group = group,
      callback = function(ev)
        local buf = ev.buf
        local ft = ev.match

        -- resolve Treesitter language
        local lang = vim.treesitter.language.get_lang(ft) or ft

        -- auto_install (only if valid language & missing)
        if not vim.treesitter.language.add(lang) then
          return
        end

        -- attach treesitter (highlight)
        vim.treesitter.start(buf, lang)

        -- folds
        vim.wo.foldmethod = "expr"
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"

        -- indent
        vim.bo[buf].indentexpr =
          "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}

-- return {
-- 	"nvim-treesitter/nvim-treesitter",
--   lazy = false,
--   -- lazy = vim.fn.argc(-1) == 0,
--   branch = "main",
--   -- version = false,
--   build = ':TSUpdate',
--       config = function()
--         -- replicate `ensure_installed`, runs asynchronously, skips existing languages
--         require('nvim-treesitter').install(languages)
--
--         vim.api.nvim_create_autocmd('FileType', {
--             group = vim.api.nvim_create_augroup('treesitter.setup', {}),
--             callback = function(args)
--                 local buf = args.buf
--                 local filetype = args.match
--
--                 -- you need some mechanism to avoid running on buffers that do not
--                 -- correspond to a language (like oil.nvim buffers), this implementation
--                 -- checks if a parser exists for the current language
--                 local language = vim.treesitter.language.get_lang(filetype) or filetype
--                 if not vim.treesitter.language.add(language) then
--                     return
--                 end
--
--                 -- replicate `fold = { enable = true }`
--                 -- vim.wo.foldmethod = 'expr'
--                 -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
--
--                 -- replicate `highlight = { enable = true }`
--                 vim.treesitter.start(buf, language)
--
--                 -- replicate `indent = { enable = true }`
--                 vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
--
--                 -- `incremental_selection = { enable = true }` cannot be easily replicated
--             end,
--         })
--     end,
--   -- main = 'nvim-treesitter.configs', -- Sets main module to use for opts
--   -- main = 'nvim-treesitter.configs',
--   -- lazy = false,
--   -- event = { "BufReadPost", "BufNewFile", "BufWritePre", "VeryLazy" },
--   -- opts = {
--   --   -- indent = {
--   --   -- 	enable = true,
--   --   -- },
--   --   -- ensure_installed = {
--   --   --     -- "c_sharp",
--   --   -- 	"lua",
--   --   -- 	-- "dockerfile",
--   --   -- 	"gitignore",
--   --   -- 	-- "javascript",
--   --   -- 	-- "html",
--   --   -- 	-- "css",
--   --   -- 	-- "lua",
--   --   -- 	-- "python",
--   --   -- 	"c",
--   --   -- 	"cpp",
--   --   -- 	-- "zig",
--   --   --     "markdown",
--   --   --     "markdown_inline",
--   --   --     "toml",
--   --   --     "json",
--   --   --     "java",
--   --   --     -- "sql"
--   --   --     -- "org",
--   --   --     -- "elisp"
--   --   -- },
--   --   -- auto_install = true,
--   --   -- highlight = {
--   --   -- 	enable = true,
--   --   -- 	additional_vim_regex_highlighting = true
--   --   -- },
--   --     -- injection = {
--   --     --   enable = true,
--   --     -- }
--   -- }
-- }
-- -- --Downloaded c, cpp, css, html, python,query, javascript
