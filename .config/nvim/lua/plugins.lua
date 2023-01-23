local vim = vim

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd [[packadd packer.nvim]]

local packer = require("packer")
packer.startup(function(use)
  use "wbthomason/packer.nvim"
  use { "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" }

  -- LSP
  use {
    "VonHeikemen/lsp-zero.nvim",
    requires = {
      -- LSP Support
      {"neovim/nvim-lspconfig", commit = "5f4b1fa83c80f43e434c1fb227967dac9ad8f44c" },
      {"williamboman/mason.nvim", commit = "a1f1fb070fb5acb9c535f0300b77d22561201e1b" },
      {"williamboman/mason-lspconfig.nvim", commit = "33a198bc5ee0215ae8ab3f61781b29103cf4ca5a"},

      -- Autocompletion
      {"hrsh7th/nvim-cmp", tag = "v0.0.1"},
      {"hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa"},
      {"hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23"},
      {"hrsh7th/cmp-nvim-lsp", commit = "78924d1d677b29b3d1fe429864185341724ee5a2"},
      {"hrsh7th/cmp-nvim-lua", commit = "f3491638d123cfd2c8048aefaf66d246ff250ca6"},
      {"saadparwaiz1/cmp_luasnip", commit = "18095520391186d634a0045dacaa346291096566"},

      -- Snippets
      {"L3MON4D3/LuaSnip", tag = "v1.1.0"},
      {"rafamadriz/friendly-snippets", commit = "484fb38b8f493ceeebf4e6fc499ebe41e10aae25"},
    }
  }

  -- use { "williamboman/mason.nvim", commit = "a1f1fb070fb5acb9c535f0300b77d22561201e1b" }
  -- use { "neovim/nvim-lspconfig", commit = "5f4b1fa83c80f43e434c1fb227967dac9ad8f44c" }
  -- use { "L3MON4D3/LuaSnip", tag = "v1.1.0" }
  -- use { "hrsh7th/nvim-cmp", tag = "v0.0.1" }
  -- use { "hrsh7th/cmp-nvim-lsp", commit = "78924d1d677b29b3d1fe429864185341724ee5a2" }
  -- use { "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" }
  -- use { "hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23" }
  -- use { "saadparwaiz1/cmp_luasnip", commit = "18095520391186d634a0045dacaa346291096566" }

  --  Telescope fuzzy finder
  use { "nvim-telescope/telescope.nvim", tag = "0.1.0" }
  use { "nvim-telescope/telescope-dap.nvim", commit = "b4134fff5cbaf3b876e6011212ed60646e56f060" }

  use { "Vonr/align.nvim", commit = "529d22bb2aa3f100ffaf78cf392ff0476a2e2462" }
  use { "https://github.com/echasnovski/mini.nvim", tag = "v0.6.0" }
  use { "mfussenegger/nvim-dap", tag = "0.3.0" }
  use { "sheerun/vim-polyglot", tag = "v4.17.1" }
  use { "kyazdani42/nvim-web-devicons", commit = "520776f30a3b39ed56402bffbdae57549e778b40" }
  -- use { "folke/tokyonight.nvim", commit = "29e2c689c10679f723ae1deadf7f0067d394a545" }
  -- use { "RRethy/nvim-base16", commit = "cf8252058c8fc486bc565a815083a2eb390f7621" }

  -- use { "kylechui/nvim-surround", tag = "v1.0.0" }
  -- use { "godlygeek/tabular" }
  -- use "hrsh7th/cmp-nvim-lsp-signature-help"
  -- use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

  if packer_bootstrap then
      packer.sync()
  end
end)

-- LSP
-- local lspconfig = require('lspconfig')
-- local lsp_defaults = lspconfig.util.default_config
-- local cmp = require('cmp')
-- local luasnip = require('luasnip')
--
-- lsp_defaults.capabilities = vim.tbl_deep_extend(
--   'force',
--   lsp_defaults.capabilities,
--   require('cmp_nvim_lsp').default_capabilities()
-- )
--
-- local select_opts = {behavior = cmp.SelectBehavior.Select}
--
-- cmp.setup({
--   snippet = {
--     expand = function(args)
--       luasnip.lsp_expand(args.body)
--     end
--   },
--   sources = {
--     {name = 'path'},
--     {name = 'nvim_lsp', keyword_length = 3},
--     {name = 'buffer', keyword_length = 3},
--     {name = 'luasnip', keyword_length = 2},
--   },
--   mapping = {
--     ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
--     ['<C-n>'] = cmp.mapping.select_next_item(select_opts),
--
--     ['<C-u>'] = cmp.mapping.scroll_docs(-4),
--     ['<C-f>'] = cmp.mapping.scroll_docs(4),
--
--     ['<C-e>'] = cmp.mapping.abort(),
--     ['<CR>'] = cmp.mapping.confirm({select = false}),
--
--     -- ['<Tab>'] = cmp.mapping(function(fallback)
--     --   local col = vim.fn.col('.') - 1
--     --
--     --   if cmp.visible() then
--     --     cmp.select_next_item(select_opts)
--     --   elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
--     --     fallback()
--     --   else
--     --     cmp.complete()
--     --   end
--     -- end, {'i', 's'}),
--     --
--     -- ['<S-Tab>'] = cmp.mapping(function(fallback)
--     --   if cmp.visible() then
--     --     cmp.select_prev_item(select_opts)
--     --   else
--     --     fallback()
--     --   end
--     -- end, {'i', 's'}),
--   },
-- })
--
-- vim.api.nvim_create_autocmd('LspAttach', {
--   desc = 'LSP actions',
--   callback = function()
--     local bufmap = function(mode, lhs, rhs)
--       local opts = {buffer = true}
--       vim.keymap.set(mode, lhs, rhs, opts)
--     end
--
--     -- Displays hover information about the symbol under the cursor
--     bufmap('n', '<C-j>', '<cmd>lua vim.lsp.buf.hover()<cr>')
--
--     -- Jump to the definition
--     bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
--
--     -- Jump to declaration
--     bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
--
--     -- Lists all the implementations for the symbol under the cursor
--     bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
--
--     -- Jumps to the definition of the type symbol
--     bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
--
--     -- Lists all the references
--     bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
--
--     -- Displays a function's signature information
--     bufmap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
--
--     -- Renames all references to the symbol under the cursor
--     bufmap('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<cr>')
--
--     -- Selects a code action available at the current cursor position
--     bufmap('n', '<leader>qf', '<cmd>lua vim.lsp.buf.code_action()<cr>')
--     bufmap('x', '<leader>qf', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')
--
--     -- Show diagnostics in a floating window
--     bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
--
--     -- Move to the previous diagnostic
--     bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
--
--     -- Move to the next diagnostic
--     bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
--   end
-- })
--
-- lspconfig.html.setup({})
-- lspconfig.cssls.setup({})
-- lspconfig.jsonls.setup({})
-- lspconfig.yamlls.setup({})
-- lspconfig.eslint.setup({})
-- lspconfig.tsserver.setup({
--   filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
--   init_options = { hostInfo = "neovim" },
--   root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
-- })
-- lspconfig.clangd.setup({})
-- lspconfig.gopls.setup({})
-- lspconfig.rust_analyzer.setup({
--   cmd = {"rustup", "run", "stable", "rust-analyzer"}
-- })
-- lspconfig.omnisharp.setup({
--   cmd = { "/usr/local/bin/omnisharp", "--languageserver" , "--hostPID", tostring(vim.fn.getpid()) },
-- })
-- lspconfig.sumneko_lua.setup({})
-- lspconfig.nimls.setup({
--   cmd = {'nimlsp'},
--   filetypes = {'nim'},
--   root_dir = lspconfig.util.root_pattern("*.nimble", ".git"),
--   single_file_support = true,
-- })

-- require("mason").setup()

local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.configure("sumneko_lua", {
  settings = {
    Lua = {
      runtime = {
        version = 'Lua 5.4',
        path = {
          "?.lua",
          "?/init.lua",
          vim.fn.expand("./lua_modules/share/lua/5.4/?.lua"),
          vim.fn.expand("./lua_modules/share/lua/5.4/?/init.lua"),
          vim.fn.expand("~/.luarocks/share/lua/5.4/?.lua"),
          vim.fn.expand("~/.luarocks/share/lua/5.4/?/init.lua"),
          "/usr/share/5.4/?.lua",
          "/usr/share/lua/5.4/?/init.lua",
        }
      },
      diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { "vim" },
      },
      workspace = {
        library = {
          vim.fn.expand('~/.luarocks/share/lua/5.4'),
          '/usr/share/lua/5.4',
          vim.fn.expand("./lua_modules/share/lua/5.4/?.lua"),
          vim.fn.expand("./lua_modules/share/lua/5.4/?/init.lua"),
        }
      },

      telemetry = {
        enable = false,
      },
    }
  }
})

lsp.set_preferences({
  set_lsp_keymaps = false
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  -- Displays hover information about the symbol under the cursor
  vim.keymap.set('n', '<C-j>', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)

  -- Jump to the definition
  vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)

  -- Jump to declaration
  vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)

  -- Lists all the implementations for the symbol under the cursor
  vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)

  -- Jumps to the definition of the type symbol
  vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)

  -- Lists all the references
  vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)

  -- Displays a function's signature information
  vim.keymap.set('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)

  -- Renames all references to the symbol under the cursor
  vim.keymap.set('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)

  -- Selects a code action available at the current cursor position or selected range
  vim.keymap.set('n', '<leader>qf', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  vim.keymap.set('x', '<leader>qf', '<cmd>lua vim.lsp.buf.range_code_action()<cr>', opts)

  -- Show diagnostics in a floating window
  vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)

  -- Move to the previous diagnostic
  vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)

  -- Move to the next diagnostic
  vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
end)

lsp.ensure_installed({
  "html",
  "cssls",
  "jsonls",
  "yamlls",
  "tsserver",
  "sumneko_lua",
})

lsp.nvim_workspace()
lsp.setup()

require("mini.comment").setup({})
require("mini.cursorword").setup({ delay = 300 })
require("mini.pairs").setup({})
require("mini.surround").setup({})
require("mini.tabline").setup({})
require("mini.statusline").setup({})

