---@brief
---
--- https://projects.eclipse.org/projects/eclipse.jdt.ls
---
--- Language server for Java.
---
--- IMPORTANT: If you want all the features jdtls has to offer, [nvim-jdtls](https://github.com/mfussenegger/nvim-jdtls)
--- is highly recommended. If all you need is diagnostics, completion, imports, gotos and formatting and some code actions
--- you can keep reading here.
---
--- For manual installation you can download precompiled binaries from the
--- [official downloads site](http://download.eclipse.org/jdtls/snapshots/?d)
--- and ensure that the `PATH` variable contains the `bin` directory of the extracted archive.
---
--- ```lua
---   -- init.lua
---   vim.lsp.enable('jdtls')
--- ```
---
--- You can also pass extra custom jvm arguments with the JDTLS_JVM_ARGS environment variable as a space separated list of arguments,
--- that will be converted to multiple --jvm-arg=<param> args when passed to the jdtls script. This will allow for example tweaking
--- the jvm arguments or integration with external tools like lombok:
---
--- ```sh
--- export JDTLS_JVM_ARGS="-javaagent:$HOME/.local/share/java/lombok.jar"
--- ```
---
--- For automatic installation you can use the following unofficial installers/launchers under your own risk:
---   - [jdtls-launcher](https://github.com/eruizc-dev/jdtls-launcher) (Includes lombok support by default)
---     ```lua
---       -- init.lua
---       vim.lsp.config('jdtls', { cmd = { 'jdtls' } })
---     ```

local function get_jdtls_cache_dir()
  return vim.fn.stdpath('cache') .. '/jdtls'
end

local function get_jdtls_workspace_dir()
  return get_jdtls_cache_dir() .. '/workspace'
end

local function get_jdtls_jvm_args()
  local env = os.getenv('JDTLS_JVM_ARGS')
  local args = {}
  for a in string.gmatch((env or ''), '%S+') do
    local arg = string.format('--jvm-arg=%s', a)
    table.insert(args, arg)
  end
  return unpack(args)
end

local root_markers1 = {
  -- Multi-module projects
  'mvnw', -- Maven
  'gradlew', -- Gradle
  'settings.gradle', -- Gradle
  'settings.gradle.kts', -- Gradle
  -- Use git directory as last resort for multi-module maven projects
  -- In multi-module maven projects it is not really possible to determine what is the parent directory
  -- and what is submodule directory. And jdtls does not break if the parent directory is at higher level than
  -- actual parent pom.xml so propagating all the way to root git directory is fine
  '.git',
}
local root_markers2 = {
  -- Single-module projects
  'build.xml', -- Ant
  'pom.xml', -- Maven
  'build.gradle', -- Gradle
  'build.gradle.kts', -- Gradle
}

---@type vim.lsp.Config
  ---@param dispatchers? vim.lsp.rpc.Dispatchers
  ---@param config vim.lsp.ClientConfig
 vim.lsp.config.jdtls = ({
  cmd = function(dispatchers, config)
    local workspace_dir = get_jdtls_workspace_dir()
    local data_dir = workspace_dir

    if config.root_dir then
      data_dir = data_dir .. '/' .. vim.fn.fnamemodify(config.root_dir, ':p:h:t')
    end

    local config_cmd = {
      'jdtls',
      '-data',
      data_dir,
      get_jdtls_jvm_args(),
    }

    return vim.lsp.rpc.start(config_cmd, dispatchers, {
      cwd = config.cmd_cwd,
      env = config.cmd_env,
      detached = config.detached,
    })
  end,
  filetypes = { 'java' },
  root_markers = vim.fn.has('nvim-0.11.3') == 1 and { root_markers1, root_markers2 }
    or vim.list_extend(root_markers1, root_markers2),
  init_options = {},

  handlers = {
    -- Due to an invalid protocol implementation in the jdtls we have to conform these to be spec compliant.
    -- https://github.com/eclipse/eclipse.jdt.ls/issues/376
    ["$/progress"] = function(_, result, ctx) end,
  },
  settings = {
    java = {
      -- Enable code formatting
        format = {
          enabled = true,
          -- Use the Google Style guide for code formattingh
          settings = {
            url = vim.fn.stdpath("config") .. "/lang_servers/intellij-java-google-style.xml",
              profile = "GoogleStyle"
          }
        },
        -- Enable downloading archives from eclipse automatically
        eclipse = {
          downloadSource = true
        },
        -- Enable downloading archives from maven automatically
        maven = {
          downloadSources = true
        },
        -- Enable method signature help
        signatureHelp = {
          enabled = true
        },
        -- Use the fernflower decompiler when using the javap command to decompile byte code back to java code
        contentProvider = {
          preferred = "fernflower"
        },
        -- Setup automatical package import oranization on file save
        saveActions = {
          organizeImports = true
        },
        -- Customize completion options
        completion = {
          -- Set the order in which the language server should organize imports
          importOrder = {
            "java",
            "jakarta",
            "javax",
            "com",
            "org",
          }
        },
        sources = {
          -- How many classes from a specific package should be imported before automatic imports combine them all into a single import
          organizeImports = {
            starThreshold = 9999,
            staticThreshold = 9999
          }
        },
        -- How should different pieces of code be generated?
        codeGeneration = {
          -- When generating toString use a json format
          toString = {
              template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
          },
          -- When generating hashCode and equals methods use the java 7 objects method
          hashCodeEquals = {
              useJava7Objects = true
          },
          -- When generating code use code blocks
          useBlocks = true
        },
         -- If changes to the project will require the developer to update the projects configuration advise the developer before accepting the change
        configuration = {
            updateBuildConfiguration = "interactive"
        },
        -- enable code lens in the lsp
        referencesCodeLens = {
            enabled = true
        },
        -- enable inlay hints for parameter names,
        inlayHints = {
          parameterNames = {
            enabled = "all"
        }
      }
    }
  }
})

vim.lsp.enable({'jdtls'})
