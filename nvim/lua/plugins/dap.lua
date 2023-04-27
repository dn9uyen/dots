return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "jay-babu/mason-nvim-dap.nvim",
            "theHamsta/nvim-dap-virtual-text",
            "rcarriga/nvim-dap-ui",
        },

        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            require("mason-nvim-dap").setup({ ensure_installed = { "codelldb" } })
            require("nvim-dap-virtual-text").setup()

            vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

            dap.adapters.codelldb = {
                type = 'server',
                port = "${port}",
                executable = {
                    command = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb",
                    args = { "--port", "${port}" },
                    -- On windows you may have to uncomment this:
                    -- detached = false,
                }
            }

            dap.configurations.cpp = {
                {
                    name = "Launch file (lldb)",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                }
            }

            dap.configurations.c = dap.configurations.cpp

            dapui.setup({
            })

            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
                require'dap'.repl.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
                require'dap'.repl.close()
            end

        end,
    },
}
