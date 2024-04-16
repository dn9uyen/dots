return {
    {
        "williamboman/mason.nvim",
        config = true,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "mason.nvim",
        },
        config = function()
            local mason_lspconfig = require("mason-lspconfig")
            mason_lspconfig.setup({
                -- Language servers to be automatically installed
                ensure_installed = {
                    "clangd",
                    -- "basedpyright",
                    "pyright",
                    "lua_ls",
                    "tsserver",
                    "html",
                    "cssls",
                    "rust_analyzer"
                },
                automatic_installation = true,
            })
        end
    }
}
