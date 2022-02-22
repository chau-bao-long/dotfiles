local actions = require('telescope.actions')
local telescope = require('telescope')

telescope.load_extension('lsp_handlers')
telescope.setup{
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
  }
}

map('n', '<space>p', '<cmd>Telescope find_files<cr>', {noremap = true})
map('n', '<space>P', '<cmd>Telescope git_files<cr>', {noremap = true})
map('n', '<space>q', '<cmd>Telescope live_grep<cr>', {noremap = true})
map('n', '<space>b', '<cmd>Telescope buffers<cr>', {noremap = true})
map('n', '<space>u', '<cmd>Telescope oldfiles<cr>', {noremap = true})
map('n', '<space>B', '<cmd>Telescope current_buffer_fuzzy_find<cr>', {noremap = true})
map('n', 'Q', '<cmd>Telescope grep_string<cr>', {noremap = true})
