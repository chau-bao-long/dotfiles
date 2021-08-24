-- Lua function mapping
map('v', '<s-k>', ":lua require'common'.resize_visual_area('collapse')<cr>", {noremap = true})
map('v', '<s-j>', ":lua require'common'.resize_visual_area('expand')<cr>", {noremap = true})

-- Setup orgmode
require('orgmode').setup({
  org_agenda_files = {'~/org/*', '~/org/**/*'},
  org_default_notes_file = '~/org/refile.org',
})

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

-- Setup telescope
local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
  }
}
