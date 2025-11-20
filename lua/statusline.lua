local icons = require "util.icons"
local M = {}

-- Don't show built-in mode since we render our own
vim.o.showmode = false

-- Track created highlights
local statusline_hls = {}

---@param hl string
---@return string
function M.get_or_create_hl(hl)
  local hl_name = 'StatusLine' .. hl
  if not statusline_hls[hl] then
    local bg_hl = vim.api.nvim_get_hl(0, { name = 'StatusLine' })
    local fg_hl = vim.api.nvim_get_hl(0, { name = hl })
    if bg_hl and fg_hl and fg_hl.fg then
      vim.api.nvim_set_hl(0, hl_name, {
        bg = bg_hl.bg and ('#%06x'):format(bg_hl.bg) or nil,
        fg = ('#%06x'):format(fg_hl.fg),
      })
      statusline_hls[hl] = true
    else
      return "StatusLine"
    end
  end
  return hl_name
end

--- Mode display
function M.mode_component()
  local mode_to_str = {
    -- n = 'NORMAL',
    -- i = 'INSERT',
    -- v = 'VISUAL',
    -- V = 'VISUAL',
    -- ['\22'] = 'VISUAL', -- CTRL-V
    -- c = 'COMMAND',
    -- s = 'SELECT',
    -- S = 'SELECT',
    -- r = 'PROMPT',
    -- R = 'REPLACE',
    -- t = 'TERMINAL',
   ['n'] = 'NORMAL',
   ['no'] = 'OP-PENDING',
   ['nov'] = 'OP-PENDING',
   ['noV'] = 'OP-PENDING',
   ['no\22'] = 'OP-PENDING',
   ['niI'] = 'NORMAL',
   ['niR'] = 'NORMAL',
   ['niV'] = 'NORMAL',
   ['nt'] = 'NORMAL',
   ['ntT'] = 'NORMAL',
   ['v'] = 'VISUAL',
   ['vs'] = 'VISUAL',
   ['V'] = 'VISUAL',
   ['Vs'] = 'VISUAL',
   ['\22'] = 'VISUAL',
   ['\22s'] = 'VISUAL',
   ['s'] = 'SELECT',
   ['S'] = 'SELECT',
   ['\19'] = 'SELECT',
   ['i'] = 'INSERT',
   ['ic'] = 'INSERT',
   ['ix'] = 'INSERT',
   ['R'] = 'REPLACE',
   ['Rc'] = 'REPLACE',
   ['Rx'] = 'REPLACE',
   ['Rv'] = 'VIRT REPLACE',
   ['Rvc'] = 'VIRT REPLACE',
   ['Rvx'] = 'VIRT REPLACE',
   ['c'] = 'COMMAND',
   ['cv'] = 'VIM EX',
   ['ce'] = 'EX',
   ['r'] = 'PROMPT',
   ['rm'] = 'MORE',
   ['r?'] = 'CONFIRM',
   ['!'] = 'SHELL',
   ['t'] = 'TERMINAL',
  }
  local mode = mode_to_str[vim.api.nvim_get_mode().mode] or 'UNKNOWN'
  local hl = 'Other'
  if mode:find 'NORMAL' then
    hl = 'Normal'
  elseif mode:find 'VISUAL' then
    hl = 'Visual'
  elseif mode:find 'INSERT' or mode:find 'SELECT' then
    hl = 'Insert'
  elseif mode:find 'COMMAND' or mode:find 'TERMINAL' or mode:find 'EX' then

    hl = 'Command'
  end
  return table.concat {
    string.format('%%#StatusLineModeSeparator%s#', hl),
    string.format('%%#StatusLineMode%s#%s', hl, mode),
    string.format('%%#StatusLineModeSeparator%s#', hl),
  }
end

--- Macro recording status
function M.recording_component()
  local reg = vim.fn.reg_recording()
  if reg == "" then
    return ""
  end

  -- Highlight: bold + error-like color to make it stand out
  return table.concat {
    '%#StatusLineError#',  -- or define your own like StatusLineRecording
    '󰑋 REC @', reg,
    '%#StatusLine#',       -- reset highlight
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
      local icon = icons_diag[level.name] or ""
      table.insert(parts, string.format('%%#%s#%s %d', M.get_or_create_hl(hl), icon, count))
    end
  end

  return table.concat(parts, ' ')
end

--- Filetype + devicons
function M.filetype_component()
  local devicons = require 'mini.icons'
  -- local devicons = require 'nvim-web-devicons'
  local filetype = vim.bo.filetype
  if filetype == '' then
    filetype = '[No Name]'
  end
  local buf_name = vim.api.nvim_buf_get_name(0)
  local name = vim.fn.fnamemodify(buf_name, ':t')
  -- local icon, icon_hl = devicons.get_icon(name, ext)
  local icon, icon_hl = devicons.get("file", name)
  if not icon then
    icon, icon_hl = devicons.get_icon_by_filetype(filetype, { default = true })
  end
  icon_hl = M.get_or_create_hl(icon_hl or "Normal")
  return string.format('%%#%s#%s %%#StatusLineTitle#%s', icon_hl, icon or "", filetype)
end

--- Encoding
function M.encoding_component()
  local encoding = vim.opt.fileencoding:get()
  return encoding ~= '' and string.format('%%#StatusLineModeSeparatorOther# %s', encoding) or ''
end

---@type table<string, string?>
local progress_status = {
  client = nil,
  kind = nil,
  title = nil,
}

vim.api.nvim_create_autocmd('LspProgress', {
  group = vim.api.nvim_create_augroup('wraitheus/statusline', { clear = true }),
  desc = 'Update LSP progress in statusline',
  pattern = { 'begin', 'end' },
  callback = function(args)
    if not args.data then
      return
    end

    progress_status = {
      client = vim.lsp.get_client_by_id(args.data.client_id).name,
      kind = args.data.params.value.kind,
      title = args.data.params.value.title,
    }

    if progress_status.kind == 'end' then
      progress_status.title = nil
      vim.defer_fn(function()
        vim.cmd.redrawstatus()
      end, 3000)
    else
      vim.cmd.redrawstatus()
    end
  end,
})

--- Active LSP servers or progress
function M.lsp_component()
  -- Show progress first if present
  if progress_status.client and progress_status.title then
    if not vim.startswith(vim.api.nvim_get_mode().mode, 'i') then
      return table.concat {
        '%#StatuslineSpinner#󱥸 ',
        string.format('%%#StatuslineTitle#%s  ', progress_status.client),
        string.format('%%#StatuslineItalic#%s...', progress_status.title),
      }
    end
  end

  -- Otherwise show attached clients
  if not rawget(vim, "lsp") or not vim.lsp.get_clients then
    return ""
  end
  local clients = vim.lsp.get_clients { bufnr = 0 }
  if #clients == 0 then
    return ""
  end
  local names = {}
  for _, client in ipairs(clients) do
    table.insert(names, client.name)
  end
  return string.format("%%#StatusLineItalic#LSP: %%#StatusLineTitle#%s", table.concat(names, ", "))
end

--- Position
-- function M.position_component()
--   local line = vim.fn.line '.'
--   local line_count = vim.api.nvim_buf_line_count(0)
--   local col = vim.fn.virtcol '.'
--   return table.concat {
--     '%#StatusLineItalic#l: ',
--     string.format('%%#StatusLineTitle#%d', line),
--     string.format('%%#StatusLineItalic#/%d c: %d', line_count, col),
--   }
-- end

function M.position_component()
  local line = vim.fn.line '.'
  local col = vim.fn.virtcol '.'
  return string.format('%s%d%s:%d', '%#StatusLineTitle#', line, '%#StatusLineItalic#', col)
end

--- Renders the statusline
---@return string
function M.render()
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
    return table.concat(out, '|')
  end

  return table.concat {
    concat_components {
      M.mode_component(),
      -- M.recording_component(),
    },
    '%#StatusLine#%=',
    concat_components {
      M.diagnostics_component(),
      M.filetype_component(),
      -- M.encoding_component(),
      M.lsp_component(), -- merged (progress OR clients)
      M.position_component(),
    },
    ' ',
  }
end

-- Set the statusline
vim.o.statusline = "%!v:lua.require'statusline'.render()"

return M
