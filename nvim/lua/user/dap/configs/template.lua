local M = {}

local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
  return
end

M.setup = function()

dap.configurations.configNameHere = { 
    -- Config here
}

end

return M
