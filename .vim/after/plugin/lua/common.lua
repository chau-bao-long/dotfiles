-- Lua function mapping
map('v', '<s-k>', ":lua require'common'.resize_visual_area('collapse')<cr>", {noremap = true})
map('v', '<s-j>', ":lua require'common'.resize_visual_area('expand')<cr>", {noremap = true})

-- Setup orgmode
require('orgmode').setup({
  org_agenda_files = {'~/org/*', '~/org/**/*'},
  org_default_notes_file = '~/org/refile.org',
})
