return {
  -- Provides an aesthetically pleasing, GUI-like tab bar at the top of the editor, allowing users to visualize, manage, and switch between open files (buffers)
  -- shamelessly attempts to emulate the aesthetics of GUI text editors/Doom Emacs
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      mode = "tabs",
      separator_style = "slant",
    },
  },
}
