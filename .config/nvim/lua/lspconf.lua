-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
local lspconfig = require('lspconfig')

-- C/C++ (ccls)
lspconfig.ccls.setup{
    root_dir = lspconfig.util.root_pattern("compile_commands.json", ".ccls", "compile_flags.txt", ".git")
}

-- Go (gopls)
lspconfig.gopls.setup{}

-- Rust (rls)
lspconfig.rls.setup{}

-- C# (Omnisharp)
local pid = vim.fn.getpid()
local omnisharp_bin = "/opt/omnisharp-roslyn-http/OmniSharp"
lspconfig.omnisharp.setup{
  cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) },
}

-- Java (Eclipse JDT)
--lspconfig.jdtls.setup{}

-- HTML (npm i -g vscode-html-languageserver-bin)
lspconfig.html.setup{}

-- CSS (npm i -g vscode-css-languageserver-bin)
lspconfig.cssls.setup{}

-- JSON (npm i -g vscode-json-languageserver)
lspconfig.jsonls.setup{}

-- Javascript & Typescript (npm i -g typescript-language-server)
lspconfig.tsserver.setup{}

-- Vue (npm i -g vls)
lspconfig.vuels.setup{
    root_dir = lspconfig.util.root_pattern("package.json", "vue.config.js")
}

-- YAML (npm i -g yaml-language-server)
lspconfig.yamlls.setup{}
