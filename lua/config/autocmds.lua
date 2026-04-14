-- auto-format on save
-- local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
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
    vim.hl.on_yank { higroup = 'IncSearch', timeout = 500 }
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

local map = vim.keymap.set
-- vim.opt.showbreak = "↪ "  -- Adds a visual indicator for wrapped lines

-- Enable line wrapping and remap j/k for visual line movement in Markdown files
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "markdown",
--   callback = function()
--     vim.opt_local.wrap = true
--     vim.opt_local.linebreak = true  -- Wrap at word boundaries
--     -- Remap j and k to move by visual lines
--     map("n", "j", "gj", { buffer = true })
--     map("n", "k", "gk", { buffer = true })
--     map("n", "$", "g$", { buffer = true })
--     map("n", "g$", "$", { buffer = true })
--     map("n", "gj", "j", { buffer = true })
--     map("n", "gk", "k", { buffer = true })
--     map("n", "0", "g0", { buffer = true })
--     map("n", "g0", "0", { buffer = true })
--     map("v", "<leader>mi", function()
--       -- Get the selected text range
--       local start_row, start_col = unpack(vim.fn.getpos("'<"), 2, 3)
--       local end_row, end_col = unpack(vim.fn.getpos("'>"), 2, 3)
--       -- Get the selected lines
--       local lines = vim.api.nvim_buf_get_lines(0, start_row - 1, end_row, false)
--       local selected_text = table.concat(lines, "\n"):sub(start_col, #lines == 1 and end_col or -1)
--       if selected_text:match("^%*%*.*%*%*$") then
--         vim.notify("Text already italic", vim.log.levels.INFO)
--       else
--         vim.cmd("normal sa*")
--       end
--     end, { desc = "[P]BOLD current selection" })
--     map("v", "<leader>mb", function()
--       -- Get the selected text range
--       local start_row, start_col = unpack(vim.fn.getpos("'<"), 2, 3)
--       local end_row, end_col = unpack(vim.fn.getpos("'>"), 2, 3)
--       -- Get the selected lines
--       local lines = vim.api.nvim_buf_get_lines(0, start_row - 1, end_row, false)
--       local selected_text = table.concat(lines, "\n"):sub(start_col, #lines == 1 and end_col or -1)
--       if selected_text:match("^%*%*.*%*%*$") then
--         vim.notify("Text already bold", vim.log.levels.INFO)
--       else
--         vim.cmd("normal 2sa*")
--       end
--     end, { desc = "[P]BOLD current selection" })
--
--     map("v", "<leader>mc", function()
--       -- Get the selected text range
--       local start_row, start_col = unpack(vim.fn.getpos("'<"), 2, 3)
--       local end_row, end_col = unpack(vim.fn.getpos("'>"), 2, 3)
--       -- Get the selected lines
--       local lines = vim.api.nvim_buf_get_lines(0, start_row - 1, end_row, false)
--       local selected_text = table.concat(lines, "\n"):sub(start_col, #lines == 1 and end_col or -1)
--       if selected_text:match("^%*%*.*%*%*$") then
--         vim.notify("Text already code", vim.log.levels.INFO)
--       else
--         vim.cmd("normal sa`")
--       end
--     end, { desc = "[P]Code current selection" })
--
--     vim.cmd("TSBufEnable highlight")
--   end,
-- })

-- local langs = {
--   "lua",
--   "gitignore",
--   "c",
--   "cpp",
--   "markdown",
--   "toml",
--   "json",
--   "java",
-- }

-- local filetypes = {}
-- for _, lang in ipairs(langs) do
--   for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
--     table.insert(filetypes, ft)
--   end
-- end

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = filetypes,
--   callback = function(ev)
--     vim.treesitter.start(ev.buf)
--   end,
-- })

-- restore cursor to file position in previous editing session
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function(args)
		local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
		local line_count = vim.api.nvim_buf_line_count(args.buf)
		if mark[1] > 0 and mark[1] <= line_count then
			vim.api.nvim_win_set_cursor(0, mark)
			-- defer centering slightly so it's applied after render
			vim.schedule(function()
				vim.cmd("normal! zz")
			end)
		end
	end,
})

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "java",
--   callback = function()
--     vim.opt_local.makeprg = "javac %"
--   end,
-- })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function()
    vim.keymap.set("n", "<leader>cf", ":!javac %<CR>", { buffer = true, desc = "Compile Java" })
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "OilActionsPost",
  callback = function(event)
      if event.data.actions[1].type == "move" then
          Snacks.rename.on_rename_file(event.data.actions[1].src_url, event.data.actions[1].dest_url)
      end
  end,
})


-- vim.opt.cmdheight = 0
-- vim.api.nvim_create_autocmd({ 'CmdlineEnter', "CmdlineLeave" }, {
--   group = vim.api.nvim_create_augroup("cmdline-auto-hide", { clear = true }),
--   callback = function(args)
--     local target_height = args.event == 'CmdlineEnter' and 1 or 0
--     if vim.opt_local.cmdheight:get() ~= target_height then
--       vim.opt_local.cmdheight = target_height
--       vim.cmd.redrawstatus()
--     end
--   end,
-- })


-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = "cmd",
-- 	callback = function()
-- 		local ui2 = require("vim._core.ui2")
-- 		vim.schedule(function()
-- 			local win = ui2.wins and ui2.wins.cmd
-- 			if win and vim.api.nvim_win_is_valid(win) then
-- 				local win_config = vim.api.nvim_win_get_config(win)
-- 				local width = win_config.width or math.floor(vim.o.columns * 0.6)
-- 				local height = win_config.height or 1
-- 				local row = (vim.o.lines - height) / 2
-- 				local col = (vim.o.columns - width) / 2
-- 				pcall(vim.api.nvim_win_set_config, win, {
-- 					relative = "editor",
-- 					row = row,
-- 					col = col,
-- 					width = width,
-- 					height = height,
-- 					anchor = "NW",
-- 					border = "rounded",
--                     style = "minimal"
-- 				})
-- 			end
-- 		end)
-- 	end,
-- })

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "markdown",
--   callback = function()
--     vim.cmd("TSBufEnable highlight")
--   end,
--g})

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
