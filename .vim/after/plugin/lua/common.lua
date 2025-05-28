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

-- AI integration
require('codeium').setup {}

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
})
vim.opt.conceallevel = 2
map('n', '<space>no', ":ObsidianOpen<cr>", {noremap=true})
map('n', '<space>ne', ":ObsidianQuickSwitch<cr>", {noremap=true})
map('n', '<space>nw', ":ObsidianWorkspace<cr>", {noremap=true})
map('n', '<space>ns', ":ObsidianSearch<cr>", {noremap=true})
map('n', '<space>nl', ":ObsidianTOC<cr>", {noremap=true})
map('n', '<space>nr', ":ObsidianRename<cr>", {noremap=true})
map('n', '<space>nn', ":ObsidianNew<cr>", {noremap=true})
