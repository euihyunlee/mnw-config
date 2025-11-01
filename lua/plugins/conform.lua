return {
    "conform.nvim",
    enabled = true,
    lazy = true,
    cmd = "ConformInfo",
    keys = {
        {
            "<leader>F",
            function()
                require("conform").format({ async = true, lsp_format = "fallback" })
            end,
            desc = "Format",
        },
    },
    after = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                nix = { "alejandra" },
                c = { "clang-format" },
                cpp = { "clang-format" },
                rust = { "rustfmt" },
                elixir = { "mix" },
                python = { "ruff_format" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                svelte = { "prettier" },
                typst = { "typstyle" },
                tex = { "tex-fmt" },
            },
        })
    end,
}
