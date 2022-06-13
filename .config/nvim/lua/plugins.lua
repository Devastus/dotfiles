vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
    use "wbthomason/packer.nvim"
    use "neovim/nvim-lspconfig"
    use "mfussenegger/nvim-dap"
    use "rcarriga/nvim-dap-ui"

    -- use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    use "sheerun/vim-polyglot"

    use "godlygeek/tabular"
    use "echasnovski/mini.nvim"
    use "nvim-lua/plenary.nvim"
    use "lewis6991/gitsigns.nvim"
    use "kdheepak/lazygit.nvim"
    use "akinsho/toggleterm.nvim"
    use "navarasu/onedark.nvim"
    use "kyazdani42/nvim-web-devicons"

    -- use "lmburns/lf.nvim"
    use "tamago324/lir.nvim"
    use "tamago324/lir-git-status.nvim"
    use "editorconfig/editorconfig-vim"
    use "mhartington/formatter.nvim"

    use "nvim-telescope/telescope.nvim"
    use "nvim-telescope/telescope-dap.nvim"
    use "gbrlsnchs/telescope-lsp-handlers.nvim"
    use "tknightz/telescope-termfinder.nvim"
end)

require("plugins/lsp")
require("plugins/dap")
require("plugins/telescope")
-- require("plugins/treesitter")
require("plugins/mini")
require("plugins/toggleterm")
-- require("plugins/lf")
require("plugins/lir")
require("plugins/git")
require("plugins/lazygit")
require("plugins/tabular")
require("plugins/editorconfig")
require("plugins/formatter")
