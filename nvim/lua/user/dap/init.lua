local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
  return
end

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

--[[ dap.listeners.after.event_initialized["dapui_config"] = function() ]]
--[[   dapui.open() ]]
--[[ end ]]
--[[]]
--[[ dap.listeners.before.event_terminated["dapui_config"] = function() ]]
--[[   dapui.close() ]]
--[[ end ]]
--[[]]
--[[ dap.listeners.before.event_exited["dapui_config"] = function() ]]
--[[   dapui.close() ]]
--[[ end ]]

require "user.dap.configs.cpp"
