return {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    config = function()
        local mc = require("multicursor-nvim")
        mc.setup()

        local set = vim.keymap.set

        -- Add or skip cursor above/below the main cursor.
        set({"n", "x"}, "<c-s-K>", function() mc.lineAddCursor(-1) end)
        set({"n", "x"}, "<c-s-J>", function() mc.lineAddCursor(1) end)
        set({"n", "x"}, "<leader><c-s-K>", function() mc.lineSkipCursor(-1) end)
        set({"n", "x"}, "<leader><c-s-J>", function() mc.lineSkipCursor(1) end)

        -- Add or skip adding a new cursor by matching word/selection
        set({"n", "x"}, "<leader>e", function() mc.matchAddCursor(1) end)
        set({"n", "x"}, "<leader>i", function() mc.matchSkipCursor(1) end)
        set({"n", "x"}, "<leader>E", function() mc.matchAddCursor(-1) end)
        set({"n", "x"}, "<leader>I", function() mc.matchSkipCursor(-1) end)

        -- Add and remove cursors with control + left click.
        set("n", "<c-leftmouse>", mc.handleMouse)
        set("n", "<c-leftdrag>", mc.handleMouseDrag)
        set("n", "<c-leftrelease>", mc.handleMouseRelease)

        -- Disable and enable cursors.
        set({"n", "x"}, "<leader>mc", mc.toggleCursor)
        set({"n", "x"}, "<leader>me", mc.enableCursors)
        set({"n", "x"}, "<leader>md", mc.clearCursors)

        -- Mappings defined in a keymap layer only apply when there are
        -- multiple cursors. This lets you have overlapping mappings.
        -- mc.addKeymapLayer(function(layerSet)
        --
        --     -- Select a different cursor as the main one.
        --     layerSet({"n", "x"}, "<left>", mc.prevCursor)
        --     layerSet({"n", "x"}, "<right>", mc.nextCursor)
        --
        --     -- Delete the main cursor.
        --     layerSet({"n", "x"}, "<leader>x", mc.deleteCursor)
        --
        --     -- Enable and clear cursors using escape.
        --    layerSet("n", "<esc>", function()
        --         if not mc.cursorsEnabled() then
        --             mc.enableCursors()
        --         else
        --             mc.clearCursors()
        --         end
        --     end)
        -- end)

    -- Remove the <esc> mapping from addKeymapLayer entirely
        mc.addKeymapLayer(function(layerSet)
            layerSet({"n", "x"}, "<left>", mc.prevCursor)
            layerSet({"n", "x"}, "<right>", mc.nextCursor)
            layerSet({"n", "x"}, "<leader>x", mc.deleteCursor)
            -- DON'T map <esc> here
        end)
        
        -- Global Escape handler that works in all modes
        local escape_handler = function()
            if mc.hasCursors() then
                mc.clearCursors()
            else
                -- Fall back to default Escape behavior
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
            end
        end
        
        set({"n", "i", "x"}, "<esc>", escape_handler)
    
        -- Customize how cursors look.
        local hl = vim.api.nvim_set_hl
        hl(0, "MultiCursorCursor", { reverse = true })
        hl(0, "MultiCursorVisual", { link = "Visual" })
        hl(0, "MultiCursorSign", { link = "SignColumn"})
        hl(0, "MultiCursorMatchPreview", { link = "Search" })
        hl(0, "MultiCursorDisabledCursor", { reverse = true })
        hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
        hl(0, "MultiCursorDisabledSign", { link = "SignColumn"})
    end
}
