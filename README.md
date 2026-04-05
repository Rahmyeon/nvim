# Preface
- This config works on windows and linux
- switched to oil.nvim
- jdtls may not work
- Hopefully you find something useful

## Directory structure
```
nvim:
|   .luacheckrc
|   .luarc.json
|   .neoconf.json
|   init.lua
|   lazy-lock.json
|   README.md
|   selene.toml
|   
+---after
|   \---ftplugin
|           markdown.lua
|           
+---lsp
|       jdtls.lua
|       ltex_plus.lua
|       lua_ls.lua
|       marksman.lua
|       
\---lua
    |   statusline.lua
    |   
    +---config
    |       autocmds.lua
    |       keymaps.lua
    |       lazy.lua
    |       lsp_options.lua
    |       markdown (not in use)
    |       options.lua
    |       plugin_options.lua
    |       
    +---plugins
    |       auto_dark_mode.lua
    |       better_escape.lua
    |       blink_cmp.lua
    |       catpuccin.lua
    |       dadbod (not in use)
    |       dadbod_ui (not in use)
    |       flash.lua
    |       LuaSnip.lua
    |       mason_nvim.lua
    |       none_ls.lua
    |       nvim-mini.lua
    |       nvim-treesitter.lua
    |       oil.lua
    |       rosepine
    |       snacks.lua
    |       tsto.lua
    |       
    \---util
            icons.lua
            
```
