-- auto-format on save
-- local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	group = lsp_fmt_group,
-- 	callback = function()
-- 		local efm = vim.lsp.get_clients({ name = "efm" })
-- 
-- 		if vim.tbl_isempty(efm) then
-- 			return
-- 		end
-- 
-- 		vim.lsp.buf.format({ name = "efm", async = true })
-- 	end,
-- })


-- Highlighted yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 500 }
  end,
})

-- Line wrap and line break in markdow files
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "markdown",
--   callback = function()
--     vim.opt_local.wrap = true
--     vim.opt_local.linebreak = true  -- Ensures wrapping happens at word boundaries
--   end,
-- })

vim.opt.showbreak = "↪ "  -- Adds a visual indicator for wrapped lines


-- Enable line wrapping and remap j/k for visual line movement in Markdown files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true  -- Wrap at word boundaries
    -- Remap j and k to move by visual lines
    vim.keymap.set("n", "j", "gj", { buffer = true })
    vim.keymap.set("n", "k", "gk", { buffer = true })
    vim.keymap.set("n", "$", "g$", { buffer = true })
    vim.keymap.set("n", "g$", "$", { buffer = true })
    vim.keymap.set("n", "gj", "j", { buffer = true })
    vim.keymap.set("n", "gk", "k", { buffer = true })
    vim.keymap.set("n", "0", "g0", { buffer = true })
  end,
})
-- vim.api.nvim_set_hl(0, 'FloatBorder', {
--   border = 'rounded',
--   fg = '#91d7e3', -- Example foreground color
--   bg = 'none', -- Example background color
-- })

-- vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter" }, {
--   callback = function()
--     vim.wo.winbar = "%!v:lua.require'statusline'.render()"
--   end,
-- })
