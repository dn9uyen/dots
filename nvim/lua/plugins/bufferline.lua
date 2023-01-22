return {
    {
        "akinsho/bufferline.nvim",
        opts = {
            options = {
                diagnostics = "nvim_lsp",
                close_command = "Bdelete! %d",
                offsets = { {
                    filetype = "neo-tree",
                    text = "",
                    highlight = "Directory",
                    separator = true, -- use a "true" to enable the default, or set your own character
                } },

                custom_filter = function(buf_number, buf_numbers)
                    -- filter out filetypes you don't want to see
                    -- if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
                    --     return true
                    -- end
                    -- filter out by buffer name
                    if vim.fn.bufname(buf_number) ~= "[dap-repl]" then
                        return true
                    end
                    -- filter out based on arbitrary rules
                    -- e.g. filter out vim wiki buffer from tabline in your work repo
                    -- if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
                    --    return true
                    -- end
                    -- filter out by it's index number in list (don't show first buffer)
                    -- if buf_numbers[1] ~= buf_number then
                    --    return true
                    -- end
                end,
            },
        },
    },

    {
        "famiu/bufdelete.nvim"
    }
}
