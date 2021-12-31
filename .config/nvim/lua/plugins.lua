require "paq" {
    "savq/paq-nvim";

    "godlygeek/tabular";
    "echasnovski/mini.nvim";
    "sheerun/vim-polyglot"; -- Hopefully treesitter will deprecate this
    "nvim-lua/plenary.nvim";
    "lewis6991/gitsigns.nvim";

    "kdheepak/lazygit.nvim";
    "thezeroalpha/vim-lf";
    "rbgrouleff/bclose.vim";

    "neovim/nvim-lspconfig";
    "mfussenegger/nvim-dap";

    "nvim-telescope/telescope.nvim";
    "nvim-telescope/telescope-dap.nvim";
    "gbrlsnchs/telescope-lsp-handlers.nvim";

    { "nvim-treesitter/nvim-treesitter", run = fn ["TSUpdate"] };

    "nekonako/xresources-nvim";
    "kyazdani42/nvim-web-devicons";
}

require("plugins/lsp")
require("plugins/telescope")
require("plugins/treesitter")
require("plugins/mini")
require("plugins/lf")
require("plugins/git")
require("plugins/lazygit")
