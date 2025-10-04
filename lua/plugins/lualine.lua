return {
    "lualine.nvim",
    enabled = true,
    lazy = true,
    event = "DeferredUIEnter",
    after = function()
        require("lz.n").trigger_load("nvim-web-devicons")

        require("lualine").setup()
    end,
}
