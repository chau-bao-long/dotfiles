local actions = require('telescope.actions')
local telescope = require('telescope')

map('n', '<space>p', '<cmd>Telescope find_files<cr>', {noremap = true})
map('n', '<space>P', '<cmd>Telescope git_files<cr>', {noremap = true})
map('n', '<space>Q', '<cmd>Telescope live_grep<cr>', {noremap = true})
map('n', '<space>b', '<cmd>Telescope buffers<cr>', {noremap = true})
map('n', '<space>u', '<cmd>Telescope oldfiles<cr>', {noremap = true})
map('n', '<space>B', '<cmd>Telescope current_buffer_fuzzy_find<cr>', {noremap = true})
