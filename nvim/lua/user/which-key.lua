local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

which_key.setup {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = '<c-d>', -- binding to scroll down inside the popup
    scroll_up = '<c-u>', -- binding to scroll up inside the popup
  },
  window = {
    border = "none", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

which_key.register({
    -- Misc
    ["<leader>e"] = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Show Error" },
    ["<leader>h"] = { "<cmd>nohlsearch<CR>", "Clear Highlights" },
    ["<leader>t"] = { "<cmd>NvimTreeToggle<<CR>", "Toggle Tree" },

    -- Telescope and files
    ["<leader>f"] = { name = "+file" },
    ["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Find File" },
    --[[ ["<leader>fr"] = { "<cmd>oldfiles<cr>", "Open Recent File" }, ]]
    ["<leader>fn"] = { "<cmd>Telescope enew<cr>", "New File" },
    ["<leader>ft"] = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
    ["<leader>fa"] = { "<cmd>vim.lsp.buf.add_workspace_folder<cr>", "Add folder" },
    ["<leader>fr"] = { "<cmd>vim.lsp.buf.remove_workspace_folder<cr>", "Remove folder" },
    ["<leader>fl"] = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders())<cr>", "List folders" },

    -- Dap
    ["<leader>d"] = { name = "Dap" },
    ["<leader>db"] = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
    ["<leader>dc"] = { "<cmd>require'dap'.continue()<cr>", "Continue" },
    ["<leader>di"] = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
    ["<leader>do"] = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
    ["<leader>dO"] = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
    ["<leader>dr"] = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
    ["<leader>dl"] = { "<cmd>lua require'dap'.run_last()<cr>", "Run Last" },
    ["<leader>du"] = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle Ui" },
    ["<leader>dt"] = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate Debug" },

})
