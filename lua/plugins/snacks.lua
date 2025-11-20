return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = {enabled = true},
    terminal = {
      shell = {"pwsh.exe", "-nologo"},
    },
    -- scroll = { enabled = false },
    indent = {
      animate = {
        enabled = false,
      }
    },
    quickfile = {enabled = true},
    -- gitbrowse = {enabled = true},
    dashboard = {
      preset = {
        header = [[
      ████ ██████           █████      ██                    
     ███████████             █████                            
     █████████ ███████████████████ ███   ███████████  
    █████████  ███    █████████████ █████ ██████████████  
   █████████ ██████████ █████████ █████ █████ ████ █████  
 ███████████ ███    ███ █████████ █████ █████ ████ █████ 
██████  █████████████████████ ████ █████ █████ ████ ██████]]
      }
    },
    notifier = {enabled = true},
    notify = { enabled = true },
    statuscolumn = {enabled = true },
    words = {enabled = true},
    picker = {
      layout = {
        preset = "default"
      },
    },
    input = { enabled = true },
  },
  keys = {
    -- Snacks picker registers
    { "<leader>sd", function() Snacks.picker.diagnostics_buffer() end, desc = "[s]earch [d]diagnostics" },
    -- Snacks picker registers
    { "<leader>sr", function() Snacks.picker.registers() end, desc = "[s]earch [r]egisters" },
    -- Grep
    { "<leader>sg", function() Snacks.picker.grep() end, desc = "[s]earch [g]rep" },
    -- Search files
    { "<leader>sf", function() Snacks.picker.files() end, desc = "[s]earch [f]iles" },
    -- Search marks
    { "<leader>sm", function() Snacks.picker.marks() end, desc = "[s]earch [m]arks" },
    -- Search zoxide directories
    { "<leader>sz", function() Snacks.picker.zoxide() end, desc = "[s]earch [z]oxide" },
    -- Search journal
    { "<leader>sj", function() Snacks.picker.files({ cwd = vim.fn.expand("$HOME") .. "/journal" }) end, desc = "[s]earch [J]ournal" },
    -- Search .config
    { "<leader>s.", function() Snacks.picker.files({ cwd = vim.fn.expand("$HOME") .. "/.config" }) end, desc = "[s]earch [.]config" },
    -- Search Help
    { "<leader>sh", function() Snacks.picker.help() end, desc = "[s]earch [h]elp" },
    -- Search config
    { "<leader>sc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "[s]earch [c]onfig" },
    -- Search Buffers
    { "<leader>sb", function() Snacks.picker.buffers() end, desc = "[s]earch [b]uffers" },
    -- Grep in open buffers
    { "<leader>s/", function() Snacks.picker.grep_buffers() end, desc = "[s]earch [/] in open files" },
    -- Search keymaps
    { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "[s]earch [k]eymaps" },
    -- Search notifications
    { "<leader>sn", function() Snacks.picker.notifications() end, desc = "[s]earch [n]otifications" },
    -- Check notifications
    { "<leader>cn", function() Snacks.notifier.show_history() end, desc = "[c]heck [n]otifications" },
    -- Search Highlights
    { "<leader>sH", function() Snacks.picker.highlights() end, desc = "[s]heck [H]ighlights " },
    -- Terminal open
    { "<leader>to", function()
      Snacks.terminal.toggle(
        {"pwsh", "-nologo"},
        {
          win = {
            style = "terminal",
            border = "rounded",
            backdrop = { bg = "none" },
            relative = "editor",
            width = 0.9,
            height = 0.9,
            -- title = "•¤ << VOID >> ¤•",
            title_pos = "center",
            wo = {
              winhighlight = "FloatBorder:VoidFloatTerm,FloatTitle:VoidFloatTerm"
            },
          },
        }
      )
    end, desc = "[t]erminal [o]pen" },
    -- Toggle file finders
    { "<leader>f", function() Snacks.picker.explorer() end, desc = "[f]ile explorer" },
    { "<leader>sq", function() Snacks.picker.qflist() end, desc = "[s]earch [q]uick fix list" },
    -- Search snacks picker higlight groups
    { "<leader>s1", function() Snacks.picker.highlights({pattern = "hl_group:^Snacks"}) end, desc = "[s]earch [1] snacks highlights" },
    { "<leader>ss", function() Snacks.picker.smart() end, desc = "[s]earch [s]mart" },
    { "<F12>", "<Esc>", desc = "Escape" },
    -- Check undodir
    { "<leader>u", function() Snacks.picker.undo() end, desc = "[n]ile explorer" },
    { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
    { "<leader>s:", function() Snacks.picker.command_history() end, desc = "Command History" },
    { "<leader>qe", function() Snacks.notifier.hide() end, desc = "hide notifications" },
    { "]]",         function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
    { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
  },
}
