return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "jay-babu/mason-nvim-dap.nvim",
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
        },

        config = function()
            require("mason-nvim-dap").setup({ ensure_installed = { "codelldb" } })
            local dap = require("dap")
            local dapui = require("dapui")

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
                    name = "Launch file",
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

            -- Start of dap config
            vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

            dapui.setup {
                icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
                mappings = {
                    -- Use a table to apply multiple mappings
                    expand = { "<CR>", "<2-LeftMouse>" },
                    open = "o",
                    remove = "d",
                    edit = "e",
                    repl = "r",
                    toggle = "t",
                },
                -- Expand lines larger than the window
                -- Requires >= 0.7
                expand_lines = vim.fn.has("nvim-0.7"),
                -- Layouts define sections of the screen to place windows.
                -- The position can be "left", "right", "top" or "bottom".
                -- The size specifies the height/width depending on position. It can be an Int
                -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
                -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
                -- Elements are the elements shown in the layout (in order).
                -- Layouts are opened in order so that earlier layouts take priority in window sizing.
                layouts = {
                    {
                        elements = {
                            -- Elements can be strings or table with id and size keys.
                            { id = "scopes", size = 0.25 },
                            "breakpoints",
                            "stacks",
                            "watches",
                        },
                        size = 40, -- 40 columns
                        position = "left",
                    },
                    {
                        elements = {
                            "repl",
                            "console",
                        },
                        size = 0.25, -- 25% of total lines
                        position = "bottom",
                    },
                },
                floating = {
                    max_height = nil, -- These can be integers or a float between 0 and 1.
                    max_width = nil, -- Floats will be treated as percentage of your screen.
                    border = "single", -- Border style. Can be "single", "double" or "rounded"
                    mappings = {
                        close = { "q", "<Esc>" },
                    },
                },
                windows = { indent = 1 },
                render = {
                    max_type_length = nil, -- Can be integer or nil.
                    max_value_lines = 100, -- Can be integer or nil.
                }
            }

            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end

            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end

            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end

            local wk = require("which-key")
            wk.register({
                ["<leader>d"] = { name = "Dap" },
                ["<leader>db"] = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
                ["<leader>dc"] = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
                ["<leader>di"] = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
                ["<leader>do"] = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
                ["<leader>dO"] = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
                ["<leader>dr"] = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
                ["<leader>dl"] = { "<cmd>lua require'dap'.run_last()<cr>", "Run Last" },
                ["<leader>du"] = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle Ui" },
                ["<leader>dt"] = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate Debug" },
            })
        end,
    },
    -- End of dap config
}
