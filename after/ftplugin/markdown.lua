local map = vim.keymap.set

vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt.showbreak = "↪ "  -- Adds a visual indicator for wrapped lines

map("n", "j", "gj", { buffer = 0 })
map("n", "k", "gk", { buffer = 0 })
map("n", "$", "g$", { buffer = 0 })
map("n", "0", "g0", { buffer = 0 })
map("n", "g$", "$", { buffer = 0 })
map("n", "gj", "j", { buffer = 0 })
map("n", "gk", "k", { buffer = 0 })
map("n", "g0", "0", { buffer = 0 })

map("v", "<leader>mi", function()
  local start_row, start_col = unpack(vim.fn.getpos("'<"), 2, 3)
  local end_row, end_col = unpack(vim.fn.getpos("'>"), 2, 3)
  local lines = vim.api.nvim_buf_get_lines(0, start_row - 1, end_row, false)
  local selected_text = table.concat(lines, "\n"):sub(start_col, #lines == 1 and end_col or -1)
  if selected_text:match("^%*%*.*%*%*$") then
    vim.notify("Text already italic", vim.log.levels.INFO)
  else
    vim.cmd("normal sa*")
  end
end, { buffer = 0, desc = "Italic current selection" })

map("v", "<leader>mb", function()
  local start_row, start_col = unpack(vim.fn.getpos("'<"), 2, 3)
  local end_row, end_col = unpack(vim.fn.getpos("'>"), 2, 3)
  local lines = vim.api.nvim_buf_get_lines(0, start_row - 1, end_row, false)
  local selected_text = table.concat(lines, "\n"):sub(start_col, #lines == 1 and end_col or -1)
  if selected_text:match("^%*%*.*%*%*$") then
    vim.notify("Text already bold", vim.log.levels.INFO)
  else
    vim.cmd("normal 2sa*")
  end
end, { buffer = 0, desc = "Bold current selection" })

map("v", "<leader>mc", function()
  local start_row, start_col = unpack(vim.fn.getpos("'<"), 2, 3)
  local end_row, end_col = unpack(vim.fn.getpos("'>"), 2, 3)
  local lines = vim.api.nvim_buf_get_lines(0, start_row - 1, end_row, false)
  local selected_text = table.concat(lines, "\n"):sub(start_col, #lines == 1 and end_col or -1)
  if selected_text:match("^%*%*.*%*%*$") then
    vim.notify("Text already code", vim.log.levels.INFO)
  else
    vim.cmd("normal sa`")
  end
end, { buffer = 0, desc = "Code current selection" })

-- vim.cmd("TSBufEnable highlight")
