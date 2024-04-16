vim.g.mapleader = " "

local map = vim.keymap.set

-- Lsp
map("n", '<space>e', vim.diagnostic.open_float, { noremap = true, silent = false })
map("n", '[d', vim.diagnostic.goto_prev, { noremap = true, silent = false })
map("n", ']d', vim.diagnostic.goto_next, { noremap = true, silent = false })
map("n", '<space>q', vim.diagnostic.setloclist, { noremap = true, silent = false })
-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        map('n', 'gD', vim.lsp.buf.declaration, opts)
        map('n', 'gd', vim.lsp.buf.definition, opts)
        map('n', 'K', vim.lsp.buf.hover, opts)
        map('n', 'gi', vim.lsp.buf.implementation, opts)
        map('n', 'gk', vim.lsp.buf.signature_help, opts)
        map('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        map('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        map('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        map('n', '<space>D', vim.lsp.buf.type_definition, opts)
        map('n', '<space>rn', vim.lsp.buf.rename, opts)
        map({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        map('n', 'gr', vim.lsp.buf.references, opts)
        map('n', '<space>f', function()
            local buf_clients = vim.lsp.buf_get_clients()
            -- Check LSP clients that support formatting
            for _, client in pairs(buf_clients) do
                if client.supports_method('textDocument/formatting') then
                    vim.lsp.buf.format { async = true }
                    return
                end
            end
            -- Fallback on conform
            require('conform').format()
        end, opts)
    end,
})

-- Better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Better window navigation
map("n", "<C-h>", "<C-w>h", { noremap = true, silent = false })
map("n", "<C-j>", "<C-w>j", { noremap = true, silent = false })
map("n", "<C-k>", "<C-w>k", { noremap = true, silent = false })
map("n", "<C-l>", "<C-w>l", { noremap = true, silent = false })

-- Clear highlight with <esc>
map("n", "<esc>", "<cmd>noh<cr><esc>", { noremap = true, silent = false })

-- Telescope
map('n', '<leader>ff', "<cmd>Telescope find_files<cr>", {})
map('n', '<leader>fg', "<cmd>Telescope live_grep<cr>", {})
map('n', '<leader>fb', "<cmd>Telescope buffers<cr>", {})
map('n', '<leader>fh', "<cmd>Telescope help_tags<cr>", {})

-- neo-tree
map("n", "\\", "<cmd>Neotree toggle<cr>", { noremap = true, silent = false })
