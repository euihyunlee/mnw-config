return {
    "oil.nvim",
    enabled = true,
    lazy = true,
    cmd = "Oil",
    keys = {
        {
            "<leader>O",
            "<CMD>Oil<CR>",
            desc = "Oil",
        },
    },
    after = function()
        require("lz.n").trigger_load("nvim-web-devicons")

        require("oil").setup()
    end,
}
