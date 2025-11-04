-- Bootstrap paq plugin manager when not using Nix
if mnw == nil then
    local function clone_paq()
        local path = vim.fn.stdpath("data") .. "/site/pack/paqs/start/paq-nvim"
        local is_installed = vim.fn.empty(vim.fn.glob(path)) == 0
        if not is_installed then
            vim.fn.system({ "git", "clone", "--depth=1", "https://github.com/savq/paq-nvim.git", path })
            return true
        end
    end

    local function bootstrap_paq(packages)
        local first_install = clone_paq()
        vim.cmd.packadd("paq-nvim")
        local paq = require("paq")
        if first_install then
            vim.notify("Installing plugins... If prompted, hit Enter to continue.")
        end

        -- Read and install packages
        paq(packages)
        paq.install()
    end

    -- Bootstrap paq plugin manager (see `:h paq-bootstrapping`)
    bootstrap_paq({
        "savq/paq-nvim",
        "nvim-neorocks/lz.n",

        -- Opt plugins
        "saghen/blink.cmp",
        { "catppuccin/nvim", as = "catppuccin-nvim" },
        "stevearc/conform.nvim",
        "rafamadriz/friendly-snippets",
        "lewis6991/gitsigns.nvim",
        "folke/lazydev.nvim",
        "nvim-lualine/lualine.nvim",
        "mfussenegger/nvim-lint",
        "neovim/nvim-lspconfig",
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
        "stevearc/oil.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-fzf-native.nvim",
        "nvim-telescope/telescope.nvim",
        "folke/which-key.nvim",
    })
end

-- Set vim globals, opts, and keymaps
require("config")

-- Load plugins via lz.n
require("lz.n").load("plugins")

-- Set colorscheme
vim.cmd.colorscheme("catppuccin")
