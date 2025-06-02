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
  },
})
require("vectorcode").setup({
  async_opts = {
    debounce = 10,
    events = { "BufWritePost", "InsertEnter", "BufReadPost" },
    exclude_this = true,
    n_query = 5,
    notify = false,
    query_cb = require("vectorcode.utils").make_surrounding_lines_cb(-1),
    run_on_register = false,
  },
  async_backend = "default", -- or "lsp"
  exclude_this = true,
  n_query = 5,
  notify = true,
  timeout_ms = 5000,
  on_setup = {
    update = false, -- set to true to enable update when `setup` is called.
    lsp = false,
  },
  sync_log_env_var = false,
})


-- Copilot
-- vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
--   expr = true,
--   replace_keycodes = false
-- })
-- vim.g.copilot_no_tab_map = true
