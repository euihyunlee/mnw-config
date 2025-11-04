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

        "nvim-treesitter/nvim-treesitter",
        "neovim/nvim-lspconfig",

        -- Optional (i.e., lazy-loaded) plugins
        { "saghen/blink.cmp", opt = true },
        { "catppuccin/nvim", as = "catppuccin-nvim", opt = true },
        { "stevearc/conform.nvim", opt = true },
        { "rafamadriz/friendly-snippets", opt = true },
        { "lewis6991/gitsigns.nvim", opt = true },
        { "folke/lazydev.nvim", opt = true },
        { "nvim-lualine/lualine.nvim", opt = true },
        { "mfussenegger/nvim-lint", opt = true },
        { "nvim-tree/nvim-web-devicons", opt = true },
        { "stevearc/oil.nvim", opt = true },
        { "nvim-lua/plenary.nvim", opt = true },
        { "nvim-telescope/telescope-fzf-native.nvim", opt = true },
        { "nvim-telescope/telescope.nvim", opt = true },
        { "folke/which-key.nvim", opt = true },
    })
end

-- Set vim globals, opts, and keymaps
require("config")

-- Load plugins via lz.n
require("lz.n").load("plugins")

-- Set colorscheme
vim.cmd.colorscheme("catppuccin")
