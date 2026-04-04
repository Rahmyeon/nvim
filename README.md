# Preface
- This config works on windows and linux
- switched to oil.nvim
- jdtls may not work
- Hopefully you find something useful

## Directory structure
```
nvim:.
¦   .luacheckrc
¦   .luarc.json
¦   .neoconf.json
¦   init.lua
¦   lazy-lock.json
¦   README.md
¦   selene.toml
¦   test.md
¦   
+---after
¦   +---ftplugin
¦           markdown.lua
¦           
+---lsp
¦       jdtls.lua
¦       ltex_plus.lua
¦       lua_ls.lua
¦       marksman.lua
¦       
+---lua
    ¦   statusline.lua
    ¦   
    +---config
    ¦       autocmds.lua
    ¦       keymaps.lua
    ¦       lazy.lua
    ¦       lsp_options.lua
    ¦       markdown
    ¦       options.lua
    ¦       plugin_options.lua
    ¦       
    +---plugins
    ¦       auto_dark_mode.lua
    ¦       better_escape.lua
    ¦       blink_cmp.lua
    ¦       catpuccin.lua
    ¦       dadbod
    ¦       dadbod_ui
    ¦       flash.lua
    ¦       LuaSnip.lua
    ¦       mason_nvim.lua
    ¦       none_ls.lua
    ¦       nvim-mini.lua
    ¦       nvim-treesitter.lua
    ¦       oil.lua
    ¦       rosepine
    ¦       snacks.lua
    ¦       tsto.lua
    ¦       
    +---util
            .lua
            icons.lua
```
