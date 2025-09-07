local icons = require "util.icons"
local M = {}

-- Don't show built-in mode since we render our own
vim.o.showmode = false

-- Track created highlights
local winbar_hls = {}

---@param hl string
---@return string
function M.get_or_create_hl(hl)
  local hl_name = 'Winbar' .. hl
  if not winbar_hls[hl] then
    local bg_hl = vim.api.nvim_get_hl(0, { name = 'Winbar' })
    local fg_hl = vim.api.nvim_get_hl(0, { name = hl })
    if bg_hl and fg_hl and fg_hl.fg then
      vim.api.nvim_set_hl(0, hl_name, {
        bg = bg_hl.bg and ('#%06x'):format(bg_hl.bg) or nil,
        fg = ('#%06x'):format(fg_hl.fg),
      })
      winbar_hls[hl] = true
    else
      return "Winbar"
    end
  end
  return hl_name
end

--- Mode display
function M.mode_component()
  local mode_to_str = {
    n = 'NORMAL',
    i = 'INSERT',
    v = 'VISUAL',
    V = 'VISUAL',
    ['\22'] = 'VISUAL', -- CTRL-V
    c = 'COMMAND',
    s = 'SELECT',
    S = 'SELECT',
    r = 'PROMPT',
    R = 'REPLACE',
    t = 'TERMINAL',
  }
  local mode = mode_to_str[vim.api.nvim_get_mode().mode] or 'UNKNOWN'
  local hl = 'Other'
  if mode:find 'NORMAL' then
    hl = 'Normal'
  elseif mode:find 'VISUAL' then
    hl = 'Visual'
  elseif mode:find 'INSERT' or mode:find 'SELECT' then
    hl = 'Insert'
  elseif mode:find 'COMMAND' or mode:find 'TERMINAL' then
    hl = 'Command'
  end
  return table.concat {
    string.format('%%#WinbarModeSeparator%s#', hl),
    string.format('%%#WinbarMode%s#%s', hl, mode),
    string.format('%%#WinbarModeSeparator%s#', hl),
  }
end


--- Diagnostics (from built-in LSP client)
function M.diagnostics_component()
  if not vim.diagnostic then
    return ''
  end

  local icons_diag = icons.diagnostics
  local bufnr = 0 -- current buffer
  local parts = {}

  local levels = {
    { name = "ERROR", severity = vim.diagnostic.severity.ERROR },
    { name = "WARN",  severity = vim.diagnostic.severity.WARN  },
    { name = "INFO",  severity = vim.diagnostic.severity.INFO  },
    { name = "HINT",  severity = vim.diagnostic.severity.HINT  },
  }

  for _, level in ipairs(levels) do
    local count = #vim.diagnostic.get(bufnr, { severity = level.severity })
    if count > 0 then
      local hl = 'Diagnostic' .. level.name:sub(1,1) .. level.name:sub(2):lower()
      local icon = icons_diag[level.name] or ""
      table.insert(parts, string.format('%%#%s#%s %d', M.get_or_create_hl(hl), icon, count))
    end
  end

  return table.concat(parts, ' ')
end

--- Diagnostics (fallback without LSP = always empty)
-- function M.diagnostics_component()
--   local icons_diag = icons.diagnostics
--   local counts = { ERROR = 0, WARN = 0, HINT = 0, INFO = 0 }
--   local parts = {}
--   for severity, count in pairs(counts) do
--     if count > 0 then
--       local hl = 'Diagnostic' .. severity:sub(1, 1) .. severity:sub(2):lower()
--       table.insert(parts, string.format('%%#%s#%s %d', M.get_or_create_hl(hl), icons_diag[severity], count))
--     end
--   end
--   return table.concat(parts, ' ')
-- end
--
--- Filetype + devicons
function M.filetype_component()
  local devicons = require 'nvim-web-devicons'
  local filetype = vim.bo.filetype
  if filetype == '' then
    filetype = '[No Name]'
  end
  local buf_name = vim.api.nvim_buf_get_name(0)
  local name, ext = vim.fn.fnamemodify(buf_name, ':t'), vim.fn.fnamemodify(buf_name, ':e')
  local icon, icon_hl = devicons.get_icon(name, ext)
  if not icon then
    icon, icon_hl = devicons.get_icon_by_filetype(filetype, { default = true })
  end
  icon_hl = M.get_or_create_hl(icon_hl or "Normal")
  return string.format('%%#%s#%s %%#WinbarTitle#%s', icon_hl, icon or "", filetype)
end

--- Encoding
function M.encoding_component()
  local encoding = vim.opt.fileencoding:get()
  return encoding ~= '' and string.format('%%#WinbarModeSeparatorOther# %s', encoding) or ''
end

--- Position
function M.position_component()
  local line = vim.fn.line '.'
  local line_count = vim.api.nvim_buf_line_count(0)
  local col = vim.fn.virtcol '.'
  return table.concat {
    '%#WinbarItalic#l: ',
    string.format('%%#WinbarTitle#%d', line),
    string.format('%%#WinbarItalic#/%d c: %d', line_count, col),
  }
end

--- Render

--- Renders the statusline/winbar.
---@return string
function M.render()
  -- Hide in non-writable or special buffers
  if not vim.bo.modifiable or vim.bo.readonly then
    return ""
  end

  local function concat_components(components)
    local out = {}
    for _, c in ipairs(components) do
      if c and #c > 0 then
        table.insert(out, c)
      end
    end
    return table.concat(out, '    ')
  end

  return table.concat {
    concat_components {
      M.mode_component(),
    },
    '%#StatusLine#%=',
    concat_components {
      M.diagnostics_component(),
      M.filetype_component(),
      M.encoding_component(),
      M.position_component(),
    },
    ' ',
  }
end

-- function M.render()
--   local function concat_components(components)
--     local out = {}
--     for _, c in ipairs(components) do
--       if c and #c > 0 then table.insert(out, c) end
--     end
--     return table.concat(out, '    ')
--   end
--   return table.concat {
--     concat_components {
--       M.mode_component(),
--     },
--     '%#TabLine#%=',
--     concat_components {
--       M.diagnostics_component(),
--       M.filetype_component(),
--       M.encoding_component(),
--       M.position_component(),
--     },
--     -- ' ',
--   }
-- end

vim.o.winbar = "%!v:lua.require'statusline'.render()"

return M
