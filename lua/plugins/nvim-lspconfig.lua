local servers = {
    lua_ls = {},
    nixd = {},
    clangd = {},
    rust_analyzer = {},
    expert = {},
    ty = {
        settings = {
            ty = {
                experimental = {
                    rename = true,
                },
            },
        },
    },
    ruff = {},
    ts_ls = {},
    svelte = {},
    eslint = {},
    texlab = {},
}

return {
    "nvim-lspconfig",
    enabled = true,
    lazy = false,
    after = function()
        for server, config in pairs(servers) do
            vim.lsp.config(server, config)
            vim.lsp.enable(server)
        end

        if vim.g.have_nerd_font then
            local signs = { ERROR = "", WARN = "", INFO = "", HINT = "" }
            local diagnostic_signs = {}

            for type, icon in pairs(signs) do
                diagnostic_signs[vim.diagnostic.severity[type]] = icon
            end

            vim.diagnostic.config({ signs = { text = diagnostic_signs } })
        end

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
            callback = function(event)
                -- Define helper function to set keymaps
                local map = function(keys, func, desc, mode)
                    mode = mode or "n"
                    vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = desc })
                end

                map("grd", function()
                    vim.lsp.buf.definition()
                end, "vim.lsp.buf.definition()")

                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if not client then
                    return
                end

                if client:supports_method("textDocument/declaration") then
                    map("grD", function()
                        vim.lsp.buf.declaration()
                    end, "vim.lsp.buf.declaration()")
                end

                if client:supports_method("textDocument/inlay_hint") then
                    map("grh", function()
                        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
                    end, "vim.lsp.inlay_hint.toggle()")
                end
            end,
        })
    end,
}
