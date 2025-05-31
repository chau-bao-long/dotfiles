require("supermaven-nvim").setup({
  keymaps = {
    accept_suggestion = "<C-l>",
    clear_suggestion = "<C-]>",
    accept_word = "<C-j>",
  },
})
require("codecompanion").setup({
  strategies = {
    chat = {
      adapter = "gemini",
    },
    inline = {
      adapter = "gemini",
    },
  },
  extensions = {
    vectorcode = {
      opts = { add_tool = true, add_slash_command = true, tool_opts = {} },
    },
  }
})
require("vectorcode").setup()
