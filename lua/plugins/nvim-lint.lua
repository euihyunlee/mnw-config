return {
    "nvim-lint",
    enabled = true,
    lazy = true,
    keys = {
        {
            "<leader>L",
            function()
                require("lint").try_lint()
            end,
            desc = "Lint",
        },
    },
    after = function()
        require("lint").linters_by_ft = {
            c = { "clang-tidy" },
            cpp = { "clang-tidy" },
            rust = { "clippy" },
            python = { "ruff" },
            javascript = { "eslint" },
            typescript = { "eslint" },
            svelte = { "eslint" },
        }
    end,
}
