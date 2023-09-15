return {
  "akinsho/bufferline.nvim",

  config = function()
    require('bufferline').setup({
      options = {
        offsets = {
          {
            filetype = "neo-tree",
            text = "",
            text_align = "center",
            separator = true,
          }
        },

        close_command = "bdelete! %d", -- can be a string | function, | false see "Mouse actions"
        right_mouse_command = nil,     -- can be a string | function | false, see "Mouse actions"
        left_mouse_command = nil,      -- can be a string | function, | false see "Mouse actions"
        middle_mouse_command = nil,    -- can be a string | function, | false see "Mouse actions"
      }
    })
  end
}
