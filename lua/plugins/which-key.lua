return {
    "which-key.nvim",
    enabled = true,
    lazy = true,
    event = "DeferredUIEnter",
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Keymaps",
        },
    },
    after = function()
        require("lz.n").trigger_load("nvim-web-devicons")

        require("which-key").setup({
            preset = "modern",
            win = {
                width = math.huge,
            },
            spec = {
                { "<leader>t", group = "Telescope" },
                { "<leader>tl", group = "LSP" },
                { "<leader>ts", group = "Symbols" },
            },
        })
    end,
}
