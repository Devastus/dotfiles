local lspconfig = require('lspconfig')

vim.lsp.protocol.CompletionItemKind = {
    "  [Text]",
    "  [Method]",
    "  [Function]",
    "  [Constructor]",
    "  [Field]",
    "  [Variable]",
    " ﴯ [Class]",
    "  [Interface]",
    "  [Module]",
    " ﰠ [Property]",
    "  [Unit]",
    "  [Value]",
    "  [Enum]",
    "  [Keyword]",
    "  [Snippet]",
    "  [Color]",
    "  [File]",
    "  [Reference]",
    "  [Folder]",
    "  [EnumMember]",
    "  [Constant]",
    "  [Struct]",
    "  [Event]",
    "  [Operator]",
    "  [TypeParameter]"
}

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
    vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

    -- Mappings.
    local opts = { noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('i', '<C-j>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<leader>qf', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    buf_set_keymap('n', 'g0', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
    buf_set_keymap('n', 'gW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)
    -- buf_set_keymap('n', '<leader>dd', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '<leader>dd', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    buf_set_keymap('n', '<leader>dp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', '<leader>dn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    buf_set_keymap('n', '<space>rf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

    -- Format on save
    -- if client.resolved_capabilities.document_formatting then
    --     vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]
    -- end

    -- Diagnostics
    vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        underline = true,
        update_in_insert = false,
        focusable = false,
    })

    vim.api.nvim_command('inoremap <C-space> <C-x><C-o>')
end

local global = {
    on_attach = on_attach,
    -- capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    }
}

local servers = {
    ccls = {
        root_dir = lspconfig.util.root_pattern("compile_commands.json", ".ccls-root", ".ccls", "compile_flags.txt", ".git"),
        init_options = {
            clang = {
                resourceDir = "/usr/lib/clang/12.0.1",
            },
            index = {
                threads = 2,
            },
        }
    },
    -- clangd = {
    --     root_dir = lspconfig.util.root_pattern(".clangd", ".clang-tidy", ".clang-format", "compile_commands.json", "compile_flags.txt", "configure.ac", ".git"),
    --     single_file_support = true,
    -- },
    gopls = {
        cmd = {'gopls', '--remote=auto'},
    },
    rls = {},
    nimls = {},
    omnisharp = {
        cmd = { "/usr/bin/omnisharp", "--languageserver" , "--hostPID", tostring(vim.fn.getpid()) },
    },
    java_language_server = {
        cmd = { "lang_server_linux.sh" }
    },
    kotlin_language_server = {},
    html = {},
    cssls = {},
    jsonls = {},
    eslint = {},
    tsserver = {
        cmd = { "typescript-language-server", "--stdio", "--tsserver-path", HOME.."/.npm-global/bin/tsserver" },
        filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
        init_options = { hostInfo = "neovim" },
        root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
    },
    vuels = {
        root_dir = lspconfig.util.root_pattern("package.json", "vue.config.js"),
    },
    yamlls = {},
    zls = {},
}

for key, lsp in pairs(servers) do
    local conf = {}
    for i,v in pairs(global) do
        conf[i] = v
    end
    for i,v in pairs(lsp) do
        conf[i] = v
    end
    lspconfig[key].setup(conf)
end
