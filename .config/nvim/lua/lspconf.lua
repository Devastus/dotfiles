-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md

local lspconfig = require('lspconfig')
local luasnip = require("luasnip")
local cmp = require('cmp')

local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = ""
}

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
    formatting = {
        format = function(entry, vim_item)
            -- Kind icons
            vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
            -- Source
            vim_item.menu = ({
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                luasnip = "[LuaSnip]",
                nvim_lua = "[Lua]",
                latex_symbols = "[LaTeX]",
            })[entry.source.name]
            return vim_item
        end
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end
    },
    mapping = {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    },
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = 'buffer' },
    }),
})

cmp.setup.cmdline("/", {
    sources = {
        { name = "buffer" }
    }
})

cmp.setup.cmdline(":", {
    sources = cmp.config.sources({
        { name = "path" }
    },{
        { name = "cmdline" }
    })
})

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- C/C++ (ccls)
lspconfig.ccls.setup{
    capabilities = capabilities,
    root_dir = lspconfig.util.root_pattern("compile_commands.json", ".ccls-root", ".ccls", "compile_flags.txt", ".git")
}

-- Go (gopls)
lspconfig.gopls.setup{
    capabilities = capabilities,
}

-- Rust (rls)
lspconfig.rls.setup{
    capabilities = capabilities,
}

-- C# (Omnisharp)
local pid = vim.fn.getpid()
local omnisharp_bin = "/usr/bin/omnisharp"
lspconfig.omnisharp.setup{
    capabilities = capabilities,
    cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) },
}

-- Java (java-language-server)
lspconfig.java_language_server.setup{
    capabilities = capabilities,
    cmd = { "lang_server_linux.sh" }
}

lspconfig.kotlin_language_server.setup{
    capabilities = capabilities,
}

-- HTML (npm i -g vscode-langservers-extracted)
lspconfig.html.setup{
    capabilities = capabilities,
}

-- CSS (npm i -g vscode-langservers-extracted)
lspconfig.cssls.setup{
    capabilities = capabilities,
}

-- JSON (npm i -g vscode-langservers-extracted)
lspconfig.jsonls.setup{
    capabilities = capabilities,
}

-- ESLint (npm i -g vscode-langservers-extracted)
lspconfig.eslint.setup{
    capabilities = capabilities,
}

-- Javascript & Typescript (npm i -g typescript-language-server)
lspconfig.tsserver.setup{
    capabilities = capabilities,
    root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
}

-- Vue (npm i -g vls)
lspconfig.vuels.setup{
    capabilities = capabilities,
    root_dir = lspconfig.util.root_pattern("package.json", "vue.config.js"),
}

-- YAML (npm i -g yaml-language-server)
lspconfig.yamlls.setup{
    capabilities = capabilities,
}

-- ODIN (https://github.com/DanielGavin/ols)
-- lspconfig.ols.setup{
--     root_dir = lspconfig.util.root_pattern("ols.json"),
--     cmd = { "ols" },
--     filetypes = { "odin" }
-- }
