local keys = {
    {
        "<leader>tf",
        function()
            require("telescope.builtin").find_files()
        end,
        desc = "Files",
    },
    {
        "<leader>tg",
        function()
            require("telescope.builtin").live_grep()
        end,
        desc = "Grep",
    },
    {
        "<leader>tb",
        function()
            require("telescope.builtin").buffers()
        end,
        desc = "Buffers",
    },
    {
        "<leader>td",
        function()
            require("telescope.builtin").diagnostics()
        end,
        desc = "Diagnostics",
    },
    {
        "<leader>th",
        function()
            require("telescope.builtin").help_tags()
        end,
        desc = "Help tags",
    },
    {
        "<leader>tj",
        function()
            require("telescope.builtin").jumplist()
        end,
        desc = "Jumplist",
    },
    {
        "<leader>tq",
        function()
            require("telescope.builtin").quickfix()
        end,
        desc = "Quickfix",
    },
    {
        "<leader>tld",
        function()
            require("telescope.builtin").lsp_definitions()
        end,
        desc = "Definitions",
    },
    {
        "<leader>tli",
        function()
            require("telescope.builtin").lsp_implementations()
        end,
        desc = "Implementations",
    },
    {
        "<leader>tlr",
        function()
            require("telescope.builtin").lsp_references()
        end,
        desc = "References",
    },
    {
        "<leader>tsd",
        function()
            require("telescope.builtin").lsp_document_symbols()
        end,
        desc = "Document symbols",
    },
    {
        "<leader>tsw",
        function()
            require("telescope.builtin").lsp_dynamic_workspace_symbols()
        end,
        desc = "Workspace symbols",
    },
}

return {
    "telescope.nvim",
    enabled = true,
    lazy = true,
    cmd = "Telescope",
    keys = keys,
    after = function()
        local lz = require("lz.n")

        lz.trigger_load("plenary.nvim")
        lz.trigger_load("telescope-fzf-native.nvim")
        lz.trigger_load("nvim-web-devicons")

        require("telescope").setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-y>"] = "select_default",
                        ["<C-s>"] = "select_horizontal",
                    },
                },
            },
        })

        require("telescope").load_extension("fzf")
    end,
}
