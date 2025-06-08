-- Create a module for marks functionality
local M = {}

-- Function to set the next available mark
function M.set_next_mark()
  local marks = vim.fn.getmarklist(vim.fn.bufnr('%'))
  local used_marks = {}
  
  -- Collect all marks currently in use
  for _, mark_info in ipairs(marks) do
    local mark_name = string.sub(mark_info.mark, 2, 2)
    if string.match(mark_name, "[a-z]") then
      used_marks[mark_name] = true
    end
  end
  
  -- Find the first available lowercase mark
  for i = 97, 122 do -- ASCII 'a' to 'z'
    local mark_char = string.char(i)
    if not used_marks[mark_char] then
      vim.cmd("normal! m" .. mark_char)
      vim.api.nvim_echo({{"Mark '" .. mark_char .. "' set", "None"}}, false, {})
      return
    end
  end
  
  vim.api.nvim_echo({{"No available marks", "WarningMsg"}}, false, {})
end

-- Function to toggle a mark at the current line
function M.toggle_mark()
  local line_num = vim.fn.line('.')
  local marks = vim.fn.getmarklist(vim.fn.bufnr('%'))
  
  -- Check if there's already a mark on this line
  for _, mark_info in ipairs(marks) do
    local mark_name = string.sub(mark_info.mark, 2, 2)
    if string.match(mark_name, "[a-z]") and mark_info.pos[2] == line_num then
      vim.cmd("delmarks " .. mark_name)
      vim.api.nvim_echo({{"Mark '" .. mark_name .. "' deleted", "None"}}, false, {})
      return
    end
  end
  
  -- If no mark on this line, set the next available one
  M.set_next_mark()
end

-- Function to delete a mark (will prompt for which mark)
function M.delete_mark()
  vim.api.nvim_echo({{"Mark to delete: ", "None"}}, false, {})
  local mark_char = vim.fn.nr2char(vim.fn.getchar())
  vim.cmd("delmarks " .. mark_char)
  vim.api.nvim_echo({{"Mark '" .. mark_char .. "' deleted", "None"}}, false, {})
end

-- Function to go to the next mark
function M.next_mark()
  local marks = vim.fn.getmarklist(vim.fn.bufnr('%'))
  local cur_line = vim.fn.line('.')
  local next_mark_line = nil
  local next_mark_name = nil
  
  -- Find the next mark after current line
  for _, mark_info in ipairs(marks) do
    local mark_name = string.sub(mark_info.mark, 2, 2)
    if string.match(mark_name, "[a-zA-Z]") then
      local mark_line = mark_info.pos[2]
      if mark_line > cur_line and (next_mark_line == nil or mark_line < next_mark_line) then
        next_mark_line = mark_line
        next_mark_name = mark_name
      end
    end
  end
  
  -- If no next mark, wrap around to the first mark
  if next_mark_name == nil then
    local min_line = math.huge
    for _, mark_info in ipairs(marks) do
      local mark_name = string.sub(mark_info.mark, 2, 2)
      if string.match(mark_name, "[a-zA-Z]") then
        local mark_line = mark_info.pos[2]
        if mark_line < min_line then
          min_line = mark_line
          next_mark_name = mark_name
        end
      end
    end
  end
  
  if next_mark_name then
    vim.cmd("normal! `" .. next_mark_name)
    vim.api.nvim_echo({{"Jumped to mark '" .. next_mark_name .. "'", "None"}}, false, {})
  else
    vim.api.nvim_echo({{"No marks found", "WarningMsg"}}, false, {})
  end
end

-- Function to go to the previous mark
function M.prev_mark()
  local marks = vim.fn.getmarklist(vim.fn.bufnr('%'))
  local cur_line = vim.fn.line('.')
  local prev_mark_line = nil
  local prev_mark_name = nil
  
  -- Find the previous mark before current line
  for _, mark_info in ipairs(marks) do
    local mark_name = string.sub(mark_info.mark, 2, 2)
    if string.match(mark_name, "[a-zA-Z]") then
      local mark_line = mark_info.pos[2]
      if mark_line < cur_line and (prev_mark_line == nil or mark_line > prev_mark_line) then
        prev_mark_line = mark_line
        prev_mark_name = mark_name
      end
    end
  end
  
  -- If no previous mark, wrap around to the last mark
  if prev_mark_name == nil then
    local max_line = -1
    for _, mark_info in ipairs(marks) do
      local mark_name = string.sub(mark_info.mark, 2, 2)
      if string.match(mark_name, "[a-zA-Z]") then
        local mark_line = mark_info.pos[2]
        if mark_line > max_line then
          max_line = mark_line
          prev_mark_name = mark_name
        end
      end
    end
  end
  
  if prev_mark_name then
    vim.cmd("normal! `" .. prev_mark_name)
    vim.api.nvim_echo({{"Jumped to mark '" .. prev_mark_name .. "'", "None"}}, false, {})
  else
    vim.api.nvim_echo({{"No marks found", "WarningMsg"}}, false, {})
  end
end

-- Function to preview a mark
function M.preview_mark()
  vim.api.nvim_echo({{"Mark to preview (Enter for next): ", "None"}}, false, {})
  local char = vim.fn.getchar()
  
  -- If Enter was pressed, show the next mark
  if char == 13 then -- ASCII for Enter/Return
    M.next_mark()
    return
  end
  
  local mark_char = vim.fn.nr2char(char)
  local mark_pos = vim.fn.getpos("'" .. mark_char)
  
  if mark_pos[2] == 0 then
    vim.api.nvim_echo({{"Mark '" .. mark_char .. "' not set", "WarningMsg"}}, false, {})
    return
  end
  
  local line_content = vim.fn.getline(mark_pos[2])
  vim.api.nvim_echo({{"Mark '" .. mark_char .. "' at line " .. mark_pos[2] .. ": " .. line_content, "None"}}, false, {})
end

-- Return the module
return M
