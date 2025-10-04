return {
    "catppuccin-nvim",
    enabled = true,
    lazy = true,
    colorscheme = "catppuccin",
    after = function()
        require("catppuccin").setup({
            flavour = "mocha",
            color_overrides = {
                mocha = {
                    base = "#000000",
                    -- mantle = "#000000",
                    -- crust = "#000000",
                },
            },
            transparent_background = false,
            float = {
                solid = true,
            },
            no_bold = true,
            no_italic = true,
            no_underline = true,
            integrations = {
                which_key = true,
            },
        })
    end,
}
