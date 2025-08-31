local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
---@diagnostic disable-next-line: duplicate-set-field
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = "rounded" -- Or any other border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- vim.lsp.buf.hover() and any other windows like this one should have the border that you choosed above


local keymap = vim.keymap

local opts = { noremap = true, silent = true }

-- Map 'dm' followed by any character to delete that mark
keymap.set('n', 'dm', ':delmarks ', opts)
keymap.set('n', '<leader>la', ':Lazy<CR>', opts)
keymap.set('n', '<leader>ma', ':Mason<CR>', opts)
-- Notify.nvim
keymap.set("n", "<leader>qe", ":Noice dismiss<CR>", opts) -- Dismiss all notifications

-- Close buffer
keymap.set("n", "<leader>qb", ":bd!<CR>", opts)

-- Save file
keymap.set("n", "<leader>wf", ":w<CR>", { noremap = true, silent = false })
keymap.set("n", "<leader>ww", ":noa w<CR>", { noremap = true, silent = false })

-- Remove highlights
keymap.set("n", "<leader>no", ":noh<CR>", { noremap = true, silent = false })


-- Directory Navigation
-- keymap.set("n", "<leader>n", ":NvimTreeFocus<CR>", opts)
-- keymap.set("n", "<leader>f", ":NvimTreeToggle<CR>", opts)

--Pane navigation
-- keymap.set("n", "<C-h>", "<C-w>h", opts) -- Navigate left
-- keymap.set("n", "<C-j>", "<C-w>j", opts) -- Navigate Down
-- keymap.set("n", "<C-k>", "<C-w>k", opts) -- Navigate up
-- keymap.set("n", "<C-l>", "<C-w>l", opts) -- Naviage right




-- Create a function to toggle window zoom
keymap.set("n", "<leader>cv", ":vsplit<CR>", opts) --Split Vertically
keymap.set("n", "<leader>ch", ":split<CR>", opts) --Split horzonatlly
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
keymap.set("n", "<C-d>", "<C-d>zz", opts)
keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- keymap.set("n", "<leader>cm", "<cmd>MaximizerToggle<CR>", opts) --Toggle Minimise

-- UFO keymaps
-- keymap.set("n", "zR", require("ufo").openAllFolds)
-- keymap.set("n", "zM", require("ufo").closeAllFolds)

-- Check notifications
-- keymap.set("n", "<leader>cn", function() Snacks.notifier.show_history()end, { desc = "[c]heck [n]otifications"})

-- keymap.set("n", "<leader>u", require("undotree").toggle, { noremap = true, silent = true, desc = "toggle [U]ndotree" }) --toggle undotree

-- Themery stuff
-- keymap.set("n", "<leader>tt", ":Themery<CR>", opts) --Themery

--Toggle for transparency
-- keymap.set("n", "<leader>te", ":TransparentToggle<CR>", opts) -- Toggle transparency

-- Key maps for extended menu plugin
-- Keyboard users
keymap.set("n", "K", vim.lsp.buf.hover, {})
keymap.set("n", "gd", vim.lsp.buf.definition, {})
keymap.set("n", "gr", vim.lsp.buf.references, {})


keymap.set("n", "]g", function()
  vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Go to next diagnostic" })

keymap.set("n", "[g", function()
  vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Go to previous diagnostic" })


keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
keymap.set('n', '<leader>dq', ':copen<CR>', { noremap = true, silent = true })
keymap.set('n', '<leader>dq', ':cclose<CR>', { noremap = true, silent = true })



keymap.set('n', 'dm', ':delmarks ', opts)
-- keymap.set('n', 'R', '\"_ci', opts)
-- Set the next available alphabetical (lowercase) mark
--
-- Save this as 'lua/marks.lua' in your Neovim config directory
-- Then add this to your init.lua or other config file:

 keymap.set('n', 'm,', ':lua require("Setup.marks").set_next_mark()<CR>', { noremap = true, silent = true, desc = "Set next available mark" })

-- Toggle the next available mark at the current line
 keymap.set('n', 'm;', ':lua require("Setup.marks").toggle_mark()<CR>', { noremap = true, silent = true, desc = "Toggle next available mark" })

-- Delete all marks on the current line
 keymap.set('n', 'dm-', ':delmarks!<CR>', { noremap = true, silent = true, desc = "Delete all marks on current line" })

-- Delete all marks in the current buffer
 keymap.set('n', 'dm<space>', ':delmarks a-zA-Z0-9<CR>', { noremap = true, silent = true, desc = "Delete all marks in current buffer" })

-- Move to next mark
 keymap.set('n', 'm]', ':lua require("Setup.marks").next_mark()<CR>', { noremap = true, silent = true, desc = "Move to next mark" })

-- Move to previous mark
 keymap.set('n', 'm[', ':lua require("Setup.marks").prev_mark()<CR>', { noremap = true, silent = true, desc = "Move to previous mark" })

-- Preview mark
 keymap.set('n', 'm:', ':lua require("Setup.marks").preview_mark()<CR>', { noremap = true, silent = true, desc = "Preview mark" })

vim.keymap.set("n", "<leader>dt", function()
   if vim.diagnostic.is_enabled() then
     vim.diagnostic.enable(false)
   else
   vim.diagnostic.enable()
   end
end)

vim.keymap.set("n", "<leader>pa", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("file:", path)
end)

vim.keymap.set("n", "Y", "y$", { desc = " Yank to the end of the line"})
vim.keymap.set({"n", "v"}, "<leader>dd", '"_d', { desc = "Delete without yanking"})
