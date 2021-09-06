local protocol = require("vim.lsp.protocol")

-- CONFIGURES ICONS NEXT TO COMPLETION ITEMS FOR LSP
-- HOW CAN WE ADD BUFFER ICONS?
-- inspo from onsails/lspkind-nvim
protocol.CompletionItemKind = {
  " Text", -- = 1
  "ƒ Method", -- = 2;
  "ƒ Function", -- = 3; or 
  " Constructor", -- = 4;
  "ƒ Field", -- = 5;
  " Variable", -- = 6;
  " Class", -- = 7;
  "ﰮ Interface", -- = 8;
  " Module", -- = 9;
  " Property", -- = 10;
  " Unit", -- = 11;
  " Value", -- = 12;
  "了Enum", -- = 13;
  " Keyword", -- = 14;
  "﬌ Snippet", -- = 15;
  " Color", -- = 16;
  " File", -- = 17;
  " Reference", -- = 18;
  " Folder", -- = 19;
  " EnumMember", -- = 20;
  " Constant", -- = 21;
  " Struct", -- = 22;
  "ﯓ Event", -- = 23;
  " Operator", -- = 24;
  " TypeParameter", -- = 25;
}


-- Config auto-complete
vim.o.completeopt = "menuone,noselect"

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    path = {
      menu = " [PATH] ",
      priority = 20,
    },
    buffer = { kind = "  ", menu = " [BUFFER] ", priority = 15 },
    tabnine = {
      max_num_results = 10,
      priority = 9,
      sort = false,
      show_prediction_strength = true,
      max_line = 100,
    },
    comrade = {
      priority = 100,
    },
    nvim_lsp = { kind = "  ", menu = " [LSP] ", priority = 30 },
    nvim_lua = { kind = "  ", menu = " [LUA] ", priority = 10 },
    tags = false,
    vim_dadbod_completion = true,
    snippets_nvim = { kind = "  " },
    ultisnips = { kind = "  ", menu = " [SNIP] ", priority = 9 },
    treesitter = { kind = "  ", menu = " [TREESITTER] ", priority = 10 },
    tmux = {
      all_panes = true,
    },
    gql_schema = true,
  };
}

-- Auto-complete mapping
map('i', '<c-space>', 'compe#complete()', {expr = true, noremap = true, silent = true})
map('n', '<c-space>', 'viwA', {noremap = true})
map('i', '<cr>', [[compe#confirm(luaeval("require 'nvim-autopairs'.autopairs_cr()"))]], {expr = true, noremap = true, silent = true})
map('i', '<tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], {expr = true, noremap = true})
map('i', '<s-tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], {expr = true, noremap = true})

require("nvim-autopairs.completion.compe").setup({
  map_cr = true,
  map_complete = true,
})
