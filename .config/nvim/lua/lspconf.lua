-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
local lspconfig = require('lspconfig')

-- C/C++ (ccls)
lspconfig.ccls.setup{
    root_dir = lspconfig.util.root_pattern("compile_commands.json", ".ccls-root", ".ccls", "compile_flags.txt", ".git")
}

-- Go (gopls)
lspconfig.gopls.setup{}

-- Rust (rls)
lspconfig.rls.setup{}

-- C# (Omnisharp)
local pid = vim.fn.getpid()
local omnisharp_bin = "/usr/bin/omnisharp"
lspconfig.omnisharp.setup{
  cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) },
}

-- Java (java-language-server)
lspconfig.java_language_server.setup{
    cmd = { "lang_server_linux.sh" }
}

lspconfig.kotlin_language_server.setup{}

-- HTML (npm i -g vscode-langservers-extracted)
lspconfig.html.setup{}

-- CSS (npm i -g vscode-langservers-extracted)
lspconfig.cssls.setup{}

-- JSON (npm i -g vscode-langservers-extracted)
lspconfig.jsonls.setup{}

-- ESLint (npm i -g vscode-langservers-extracted)
lspconfig.eslint.setup{}

-- Javascript & Typescript (npm i -g typescript-language-server)
lspconfig.tsserver.setup{
    root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
}

-- Vue (npm i -g vls)
lspconfig.vuels.setup{
    root_dir = lspconfig.util.root_pattern("package.json", "vue.config.js"),
}

-- YAML (npm i -g yaml-language-server)
lspconfig.yamlls.setup{}

-- ODIN (https://github.com/DanielGavin/ols)
-- lspconfig.ols.setup{
--     root_dir = lspconfig.util.root_pattern("ols.json"),
--     cmd = { "ols" },
--     filetypes = { "odin" }
-- }
