-- Lua function mapping
map('v', '<s-k>', ":lua require'common'.resize_visual_area('collapse')<cr>", {noremap = true})
map('v', '<s-j>', ":lua require'common'.resize_visual_area('expand')<cr>", {noremap = true})

-- Setup autopairs
require('nvim-autopairs').setup{
    disable_filetype = { "TelescopePrompt" , "vim" },
    enable_check_bracket_line = false,
}

-- Setup indent line
require("ibl").setup {
    indent = { char = {'|', '¦', '┆', '┊'} },
    exclude = {
      filetypes = {"help", "dashboard", "calendar"},
      buftypes = {"terminal"},
    },
}

-- Setup bufferline
require'bufferline'.setup {
  options = {
    mode = "tabs",
    max_name_length = 54,
  }
}

-- Setup intellij on vim
require'intellij-on-vim'.setup {}

-- Setup AI integration
require("codecompanion").setup({
  strategies = {
    chat = {
      adapter = "copilot",
    },
    inline = {
      adapter = "anthropic",
    },
    cmd = {
      adapter = "anthropic",
    }
  },
  adapters = {
    anthropic = function()
      return require("codecompanion.adapters").extend("anthropic", {
        env = {
          api_key = "cmd: gpg --batch --quiet --decrypt ~/claude_api_key.txt.gpg",
        },
      })
    end,
  },
})
vim.keymap.set({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
