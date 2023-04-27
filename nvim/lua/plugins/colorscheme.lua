return {
  "ellisonleao/gruvbox.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
      strings = false,
      operators = false,
      comments = false,
      folds = false,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "hard", -- can be "hard", "soft" or empty string
    palette_overrides = {},
    overrides = {
      SignColumn = { link = "GruvboxBg0" },
      -- Fix highlight conflicts
      NeoTreeGitModified = { fg = "#8ec07c", bg = "NONE" },
      NeoTreeGitStaged = { fg = "#8ec07c", bg = "NONE" },
      GitSignsAdd = { fg = "#b8bb26", bg = "NONE" },
      GitSignsChange = { fg = "#8ec07c", bg = "NONE" },
      GitSignsDelete = { fg = "#fb4934", bg = "NONE" },
      CursorLineNr = { fg = "#fabd2f", bg = "NONE" },
      IndentBlanklineContextChar = { fg = "#8f8271", bg = "NONE" },
      DiagnosticSignError = { fg = "#cc241d", bg = "NONE" },
      DiagnosticSignWarn = { fg = "#fabd2f", bg = "NONE" },
      DiagnosticSignInfo = { fg = "#83a598", bg = "NONE" },
      DiagnosticSignHint = { fg = "#8ec07c", bg = "NONE" },
      NormalFloat = { bg = "NONE" },
    },
    dim_inactive = false,
    transparent_mode = false,
  },

  config = function(_, opts)
    require("gruvbox").setup(opts)
    vim.o.background = "dark"
    vim.cmd.colorscheme("gruvbox")
  end,
}

-- old highlight fixes for reference
--vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = "#8ec07c", bg = "NONE" })
--vim.api.nvim_set_hl(0, "NeoTreeGitDeleted", { fg = "#cc241d", bg = "NONE" })
--vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = "#cc241d", bg = "NONE" })
--vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = "#fabd2f", bg = "NONE" })
--vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { fg = "#83a598", bg = "NONE" })
--vim.api.nvim_set_hl(0, "DiagnosticSignHint", { fg = "#8ec07c", bg = "NONE" })
--vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#b8bb26", bg = "NONE" })
--vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#8ec07c", bg = "NONE" })
--vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#fb4934", bg = "NONE" })
--vim.api.nvim_set_hl(0, "GitSignsUntracked", { fg = "#b8bb26", bg = "NONE" })
--vim.api.nvim_set_hl(0, "CursorLineNR", { fg = "#fabd2f", bg = "NONE" })
--vim.api.nvim_set_hl(0, "IndentBlanklineContextChar", { fg = "#8f8271", bg = "NONE" })
