return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        local lspconfig = require('lspconfig')
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        -- vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
        -- vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
        -- vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
        -- vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

        vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
            vim.lsp.handlers.hover,
            { border = 'rounded' }
        )

        vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
            vim.lsp.handlers.signature_help,
            { border = 'rounded' }
        )

        vim.diagnostic.config({
            virtual_text = false, -- conflicts with lsp_lines
            virtual_lines = { only_current_line = true },
            float = {
                border = 'rounded',
            },
        })

        -- Setup language servers.
        lspconfig.clangd.setup {
            capabilities = capabilities,
            cmd = {
                "clangd",
                "--clang-tidy",
                "--fallback-style=LLVM",
                "--function-arg-placeholders",
            }
        }
        lspconfig.lua_ls.setup {
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = { 'vim' },
                    },
                },
            },
        }
        lspconfig.pyright.setup {
            capabilities = capabilities,
        }
        -- lspconfig.basedpyright.setup {
        --     capabilities = capabilities,
        --     settings = {
        --         basedpyright = {
        --             analysis = {
        --                 typeCheckingMode = "standard"
        --             },
        --         }
        --     }
        -- }
        lspconfig.tsserver.setup { capabilities = capabilities, }
        lspconfig.html.setup { capabilities = capabilities, }
        lspconfig.cssls.setup { capabilities = capabilities, }
    end,
}
