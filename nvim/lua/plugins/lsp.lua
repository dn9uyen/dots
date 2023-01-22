return {
    {
        "williamboman/mason.nvim",
        config = true,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "clangd", "sumneko_lua", },
            automatic_installation = true,
        },
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            -- Mappings.
            -- See `:help vim.diagnostic.*` for documentation on any of the below functions
            local wk = require("which-key")
            wk.register({
                ["<leader>e"] = { vim.diagnostic.open_float, "Float Diagnostic" },
                ["<leader>q"] = { vim.diagnostic.setloclist, "Window Diagnostic" },
                ["[d"] = { vim.diagnostic.goto_prev, "Previous Diagnostic" },
                ["]d"] = { vim.diagnostic.goto_next, "Next Diagnostic" },
            })

            -- Use an on_attach function to only map the following keys
            -- after the language server attaches to the current buffer
            local on_attach = function(_, bufnr)
                -- Enable completion triggered by <c-x><c-o>
                vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

                -- Mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                wk.register({
                    ["gD"] = { vim.lsp.buf.declaration, "Go to Declaration" },
                    ["gd"] = { vim.lsp.buf.definition, "Go to Definition" },
                    ["K"] = { vim.lsp.buf.hover, "View Information" },
                    ["gi"] = { vim.lsp.buf.implementation, "Go to Implementation" },
                    ["C-k"] = { vim.lsp.buf.signature_help, "Signature Help" },
                    ["<space>wa"] = { vim.lsp.buf.add_workspace_folder, "Add Workspace Folder" },
                    ["<space>wr"] = { vim.lsp.buf.remove_workspace_folder, "Remove Workspace Folder" },
                    ["<space>wl"] = { function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, "List Workspace Folders" },
                    ["<space>D"] = { vim.lsp.buf.type_definition, "View Type Definition" },
                    ["<space>rn"] = { vim.lsp.buf.rename, "Rename" },
                    ["<space>c"] = { name = "+code" },
                    ["<space>ca"] = { vim.lsp.buf.code_action, "Code Action" },
                    ["<space>cf"] = { vim.lsp.buf.format, "Format Code" },
                    ["gr"] = { vim.lsp.buf.references, "View References" },
                })
            end

            local lsp_flags = {
                -- This is the default in Nvim 0.7+
                debounce_text_changes = 150,
            }

            local lsp = require("lspconfig")

            lsp.sumneko_lua.setup {
                on_attach = on_attach,
                flags = lsp_flags,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            }

            lsp.clangd.setup {
                on_attach = on_attach,
                flags = lsp_flags,
            }
        end,
    },
}
