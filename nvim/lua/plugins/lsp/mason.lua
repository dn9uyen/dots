return {
    {
        "williamboman/mason.nvim",
        config = function()
            local mason = require("mason")
            mason.setup()
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
        },
        config = function()
            local mason_lspconfig = require("mason-lspconfig")
            mason_lspconfig.setup({
                -- Language servers to be automatically installed
                ensure_installed = {
                    "clangd",
                    "lua_ls",
                },
                automatic_installation = true,
            })
        end,
    }
}
