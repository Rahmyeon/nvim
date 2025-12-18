local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
---@diagnostic disable-next-line: duplicate-set-field
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = "rounded" -- Or any other border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- vim.lsp.buf.hover() and any other windows like this one should have the border that you choosed above


-- local keymap = vim.keymap
local map = vim.keymap.set

local opts = { noremap = true, silent = true }

-- Map 'dm' followed by any character to delete that mark
-- keymap.set('n', 'dm', ':delmarks ', opts)

for i = string.byte('a'), string.byte('z') do
	local letter = string.char(i)
	map('n', 'dm' .. letter, ':delmarks ' .. letter .. '<CR>', opts)
end


for i = string.byte('A'), string.byte('Z') do
	local letter = string.char(i)
	map('n', 'dm' .. letter, ':delmarks ' .. letter .. '<CR>', opts)
end

map({ "n", "v", "x" }, ";", ":", { desc = "Self explanatory" })
map({ "n", "v", "x" }, ":", ";", { desc = "Self explanatory" })
map({ "n", "v", "x" }, "<C-s>", [[:s/\V]], { desc = "Enter substitue mode in selection" })

map('n', '<leader>la', ':Lazy<CR>', opts)
map('n', '<leader>ma', ':Mason<CR>', opts)
-- Notify.nvim
-- map("n", "<leader>qe", ":Noice dismiss<CR>", opts) -- Dismiss all notifications

-- Close buffer
map("n", "<leader>qb", ":bd!<CR>", opts)

-- Save file
map("n", "<leader>wf", ":w<CR>", { noremap = true, silent = false,  desc = "Save and Format" })
map("n", "<leader>ww", ":noa w<CR>", { noremap = true, silent = false, desc = "Save without format"})

-- Remove highlights
map("n", "<leader>no", ":noh<CR>", { noremap = true, silent = false })


-- Directory Navigation
-- map("n", "<leader>n", ":NvimTreeFocus<CR>", opts)
-- map("n", "<leader>f", ":NvimTreeToggle<CR>", opts)

--Pane navigation
map("n", "<C-h>", "<C-w>h", opts) -- Navigate left
map("n", "<C-j>", "<C-w>j", opts) -- Navigate Down
map("n", "<C-k>", "<C-w>k", opts) -- Navigate up
map("n", "<C-l>", "<C-w>l", opts) -- Naviage right


-- Create a function to toggle window zoom
map("n", "<leader>cv", ":vsplit<CR>", opts) --Split Vertically
map("n", "<leader>ch", ":split<CR>", opts) --Split horzonatlly
map("n", "n", "nzzzv", { desc = "Next search result (centered)" })
map("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
map("n", "<C-d>", "<C-d>zz", { desc = "Half a page down centered"})
map("n", "<C-u>", "<C-u>zz", { desc = "Half a page up centered"})

-- map("n", "<leader>cm", "<cmd>MaximizerToggle<CR>", opts) --Toggle Minimise

-- UFO keymaps
-- map("n", "zR", require("ufo").openAllFolds)
-- map("n", "zM", require("ufo").closeAllFolds)

-- Check notifications
-- map("n", "<leader>cn", function() Snacks.notifier.show_history()end, { desc = "[c]heck [n]otifications"})

-- map("n", "<leader>u", require("undotree").toggle, { noremap = true, silent = true, desc = "toggle [U]ndotree" }) --toggle undotree

-- Themery stuff
-- map("n", "<leader>tt", ":Themery<CR>", opts) --Themery

--Toggle for transparency
-- map("n", "<leader>te", ":TransparentToggle<CR>", opts) -- Toggle transparency

-- Key maps for extended menu plugin
-- Keyboard users
map("n", "K", vim.lsp.buf.hover, {})
-- map("n", "<leader>k", vim.lsp.buf.hover, {})
map("n", "gd", vim.lsp.buf.definition, {})
-- map("n", "gr", vim.lsp.buf.references, {})


-- map("n", "]d", function()
--   vim.diagnostic.jump({ count = 1, float = true })
-- end, { desc = "Go to next diagnostic" })
--
-- map("n", "[d", function()
--   vim.diagnostic.jump({ count = -1, float = true })
-- end, { desc = "Go to previous diagnostic" })


map("n", "<leader>ca", vim.lsp.buf.code_action, {})
map('n', '<leader>dq', ':copen<CR>', { noremap = true, silent = true })
map('n', '<leader>dq', ':cclose<CR>', { noremap = true, silent = true })



-- map('n', 'dm', ':delmarks ', opts)
-- map('n', 'R', '\"_ci', opts)
-- Set the next available alphabetical (lowercase) mark
--
-- Save this as 'lua/marks.lua' in your Neovim config directory
-- Then add this to your init.lua or other config file:

 -- map('n', 'm,', ':lua require("Setup.marks").set_next_mark()<CR>', { noremap = true, silent = true, desc = "Set next available mark" })

-- Toggle the next available mark at the current line
 -- map('n', 'm;', ':lua require("Setup.marks").toggle_mark()<CR>', { noremap = true, silent = true, desc = "Toggle next available mark" })

-- Delete all marks on the current line
 -- map('n', 'dm-', ':delmarks!<CR>', { noremap = true, silent = true, desc = "Delete all marks on current line" })

-- Delete all marks in the current buffer
 -- map('n', 'dm<space>', ':delmarks a-zA-Z0-9<CR>', { noremap = true, silent = true, desc = "Delete all marks in current buffer" })

-- Move to next mark
 -- map('n', 'm]', ':lua require("Setup.marks").next_mark()<CR>', { noremap = true, silent = true, desc = "Move to next mark" })

-- Move to previous mark
 -- map('n', 'm[', ':lua require("Setup.marks").prev_mark()<CR>', { noremap = true, silent = true, desc = "Move to previous mark" })

-- Preview mark
 -- map('n', 'm:', ':lua require("Setup.marks").preview_mark()<CR>', { noremap = true, silent = true, desc = "Preview mark" })

map("n", "<leader>dt", function()
   if vim.diagnostic.is_enabled() then
     vim.diagnostic.enable(false)
   else
   vim.diagnostic.enable()
   end
end)

map("n", "<leader>pa", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("file:", path)
end)

map({ "n" }, "<C-f>", "<Cmd>Open .<CR>", { desc = "Open current directory in Finder." })

map("n", "Y", "y$", { desc = " Yank to the end of the line"})
map({"n", "v"}, "<leader>dd", '"_d', { desc = "Delete without yanking"})

map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
map("n", "<leader>o", require("oil").toggle_float, { desc = "toggle oil float" })

map("n", "<C-q>", ":copen<CR>", { silent = true })
for i = 1, 9 do
	map('n', '<leader>' .. i, ':cc ' .. i .. '<CR>', { noremap = true, silent = true })
end
map("n", "<leader>a",
	function() vim.fn.setqflist({ { filename = vim.fn.expand("%"), lnum = 1, col = 1, text = vim.fn.expand("%"), } }, "a") end,
	{ desc = "Add current file to QuickFix" })

vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = "*",
	group = vim.api.nvim_create_augroup("qf", { clear = true }),
	callback = function()
		if vim.bo.buftype == "quickfix" then
			map("n", "<C-q>", ":ccl<cr>", { buffer = true, silent = true })
			map("n", "dd", function()
				local idx = vim.fn.line('.')
				local qflist = vim.fn.getqflist()
				table.remove(qflist, idx)
				vim.fn.setqflist(qflist, 'r')
			end, { buffer = true })
		end
	end,
})

-- local key_seq = vim.api.nvim_replace_termcodes("\x1b[27;5;13~", true, false, true)
-- vim.keymap.set("i", key_seq, "<Esc>", { silent = true })



-- vim.keymap.set({"n", "i", "v"}, "\x1b[27;5;13~", "<Esc>", { 
--   noremap = true, 
--   silent = true,
--
-- })


-- vim.opt.keyprotocol = kitty"
-- \x1b[27;5;13~
-- vim.keymap.set({ "i" }, "\x1b[27;5;13~", function ()
--   print("I was pressed") 
-- end, { noremap = true })
map({"n", "i", "v"}, "<F12>", "<Esc>", opts)



-- map({"i"}, "<C-m>", "<Esc>", opts)

-- map("x", "O", function ()
--   vim.cmd([[
--     '<,'>normal! $o
--   ]])
-- end, {desc = "Visual block open line below"})
