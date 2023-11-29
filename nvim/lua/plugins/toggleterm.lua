return {
  "akinsho/toggleterm.nvim",
  opts = {
    size = 10, -- Default terminal size
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_terminals = true,
    shading_factor = -50,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    persist_mode = true,
    direction = "horizontal", -- 'vertical' | 'horizontal' | 'tab' | 'float'
    close_on_exit = true,
    shell = vim.o.shell,
  }
}
