return {
    "vimtex",
    enabled = true,
    lazy = false,
    after = function()
        if vim.fn.has("mac") == 1 then
            vim.g.vimtex_view_method = "skim"
        else
            vim.g.vimtex_view_method = "zathura"
        end
    end,
}
