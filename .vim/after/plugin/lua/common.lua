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
require'bufferline'.setup {}

-- Setup intellij on vim
require'intellij-on-vim'.setup {}

-- Setup codeium
require("codeium").setup {
  enable_chat = true,
}
