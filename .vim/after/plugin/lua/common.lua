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

-- Note taking
require("obsidian").setup({
  workspaces = {
    {
      name = "work",
      path = "~/vaults/work",
    },
    {
      name = "personal",
      path = "~/vaults/personal",
    },
  },
  follow_url_func = function(url)
    vim.ui.open(url)
  end,
})
vim.opt.conceallevel = 2
