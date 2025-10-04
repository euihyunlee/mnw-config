return {
    "gitsigns.nvim",
    enabled = true,
    lazy = true,
    event = "DeferredUIEnter",
    after = function()
        require("gitsigns").setup()
    end,
}
