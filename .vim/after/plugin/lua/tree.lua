map('n', '<space>5', '<cmd>UndotreeToggle<cr>', {noremap = true})
map('n', '<space>h', '<cmd>NvimTreeFindFile<cr>', {noremap = true})
map('n', '<space>H', '<cmd>NvimTreeToggle<cr>', {noremap = true})

local key_bindings = {
  { key = {"o", "l", },               action = "edit" },
  { key = {"O"},                      action = "edit_no_picker" },
  { key = {"<CR>", "<C-]>"},          action = "cd" },
  { key = "v",                        action = "vsplit" },
  { key = "s",                        action = "split" },
  { key = "t",                        action = "tabnew" },
  { key = "<",                        action = "prev_sibling" },
  { key = ">",                        action = "next_sibling" },
  { key = "u",                        action = "parent_node" },
  { key = "h",                        action = "close_node" },
  { key = "<Tab>",                    action = "preview" },
  { key = "K",                        action = "first_sibling" },
  { key = "J",                        action = "last_sibling" },
  { key = "I",                        action = "toggle_ignored" },
  { key = "H",                        action = "toggle_dotfiles" },
  { key = "R",                        action = "refresh" },
  { key = "a",                        action = "create" },
  { key = "d",                        action = "remove" },
  { key = "D",                        action = "trash" },
  { key = "r",                        action = "rename" },
  { key = "<C-r>",                    action = "full_rename" },
  { key = "x",                        action = "cut" },
  { key = "c",                        action = "copy" },
  { key = "p",                        action = "paste" },
  { key = "y",                        action = "copy_name" },
  { key = "Y",                        action = "copy_path" },
  { key = "gy",                       action = "copy_absolute_path" },
  { key = "[c",                       action = "prev_git_item" },
  { key = "]c",                       action = "next_git_item" },
  { key = "-",                        action = "dir_up" },
  { key = "s",                        action = "system_open" },
  { key = "q",                        action = "close" },
  { key = "?",                        action = "toggle_help" },
}

require'nvim-tree'.setup {
  disable_netrw        = true,
  hijack_netrw         = true,
  open_on_setup        = false,
  ignore_ft_on_setup   = {},
  auto_close           = true,
  auto_reload_on_write = true,
  open_on_tab          = false,
  hijack_cursor        = true,
  update_cwd           = false,
  hijack_unnamed_buffer_when_opening = false,
  hijack_directories   = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 50,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = key_bindings,
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes"
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  },
  actions = {
    change_dir = {
      global = false,
    },
    open_file = {
      quit_on_open = false,
    }
  }
}
