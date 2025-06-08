-- Lualine component to show macro recording status
local M = {}

M.recording = function()
  local reg = vim.fn.reg_recording()
  if reg ~= "" then
    -- Return the recording register with a REC indicator
    return " REC @" .. reg
  else
    return ""
  end
end

-- Configure the component with highlight groups
M.config = {
  recording = {
    function()
      return M.recording()
    end,
    -- Use the built-in lualine highlight groups
    -- 'error' for recording to make it stand out
    color = function()
      local rec = vim.fn.reg_recording()
      if rec ~= "" then
        return { fg = nil, bg = nil, gui = "bold" }
      end
    end,
    icon = "󰑋",  -- Recording icon
    -- Use error highlight group when recording
    cond = function()
      local rec = vim.fn.reg_recording()
      return rec ~= ""
    end,
    -- Use warning highlight group for this component
    type = "error",
  }
}

return M
