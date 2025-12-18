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

local map = vim.keymap.set
vim.opt.showbreak = "↪ "  -- Adds a visual indicator for wrapped lines

-- Enable line wrapping and remap j/k for visual line movement in Markdown files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true  -- Wrap at word boundaries
    -- Remap j and k to move by visual lines
    map("n", "j", "gj", { buffer = true })
    map("n", "k", "gk", { buffer = true })
    map("n", "$", "g$", { buffer = true })
    map("n", "g$", "$", { buffer = true })
    map("n", "gj", "j", { buffer = true })
    map("n", "gk", "k", { buffer = true })
    map("n", "0", "g0", { buffer = true })
    map("v", "<leader>mb", function()
      -- Get the selected text range
      local start_row, start_col = unpack(vim.fn.getpos("'<"), 2, 3)
      local end_row, end_col = unpack(vim.fn.getpos("'>"), 2, 3)
      -- Get the selected lines
      local lines = vim.api.nvim_buf_get_lines(0, start_row - 1, end_row, false)
      local selected_text = table.concat(lines, "\n"):sub(start_col, #lines == 1 and end_col or -1)
      if selected_text:match("^%*%*.*%*%*$") then
        vim.notify("Text already bold", vim.log.levels.INFO)
      else
        vim.cmd("normal g2sa*")
      end
    end, { desc = "[P]BOLD current selection" })

    map("v", "<leader>mc", function()
      -- Get the selected text range
      local start_row, start_col = unpack(vim.fn.getpos("'<"), 2, 3)
      local end_row, end_col = unpack(vim.fn.getpos("'>"), 2, 3)
      -- Get the selected lines
      local lines = vim.api.nvim_buf_get_lines(0, start_row - 1, end_row, false)
      local selected_text = table.concat(lines, "\n"):sub(start_col, #lines == 1 and end_col or -1)
      if selected_text:match("^%*%*.*%*%*$") then
        vim.notify("Text already bold", vim.log.levels.INFO)
      else
        vim.cmd("normal gsa`")
      end
    end, { desc = "[P]Code current selection" })

    vim.cmd("TSBufEnable highlight")
  end,
})

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

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "markdown",
--   callback = function()
--     vim.cmd("TSBufEnable highlight")
--   end,
-- })

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
