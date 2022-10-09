local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
  return
end

dap.configurations.configNameHere = { 
    -- Config here
}
