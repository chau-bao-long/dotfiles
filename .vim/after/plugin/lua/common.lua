vim.api.nvim_set_keymap('v', '<s-k>', ":lua require'common'.resize_visual_area('collapse')<cr>", {noremap = true})
vim.api.nvim_set_keymap('v', '<s-j>', ":lua require'common'.resize_visual_area('expand')<cr>", {noremap = true})

require('orgmode').setup({
  org_agenda_files = {'~/org/*', '~/org/**/*'},
  org_default_notes_file = '~/org/refile.org',
})

require('nvim-autopairs').setup{}
