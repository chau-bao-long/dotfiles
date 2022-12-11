-- Lua function mapping
map('v', '<s-k>', ":lua require'common'.resize_visual_area('collapse')<cr>", {noremap = true})
map('v', '<s-j>', ":lua require'common'.resize_visual_area('expand')<cr>", {noremap = true})

-- Setup autopairs
require('nvim-autopairs').setup{
  disable_filetype = { "TelescopePrompt" , "vim" },
  enable_check_bracket_line = false,
}

-- Setup indent line
require("indent_blankline").setup {
    char_list = {'|', '¦', '┆', '┊'},
    buftype_exclude = {"terminal"},
    filetype_exclude = {"help", "dashboard", "calendar"},
}

-- Setup bufferline
require'bufferline'.setup {}

-- Setup luasnippet
require("luasnip.loaders.from_snipmate").lazy_load({ path = { "~/.vim/snippets" } })
map('n', '<space>sn', ':lua require("luasnip.loaders").edit_snippet_files()<cr>', {noremap = true})
