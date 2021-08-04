local nvim_lsp = require('lspconfig')
local protocol = require("vim.lsp.protocol")


-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<cr>', opts)
  buf_set_keymap('n', 'Gd', ':Lspsaga preview_definition<cr>', opts)
  buf_set_keymap('n', 'K', ':Lspsaga hover_doc<cr>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  buf_set_keymap('n', '<space>sh', ':Lspsaga signature_help<cr>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
  buf_set_keymap('n', '<space>rn', ':Lspsaga rename<cr>', opts)
  buf_set_keymap('n', '<space>ca', ':Lspsaga code_action<cr>', opts)
  buf_set_keymap('v', '<space>ca', ':<c-u>Lspsaga range_code_action<cr>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'gh', ':Lspsaga lsp_finder<cr>', opts)
  buf_set_keymap('n', '<leader>e', ':Lspsaga show_line_diagnostics<cr>', opts)
  buf_set_keymap('n', '[s', ':Lspsaga diagnostic_jump_next<cr>', opts)
  buf_set_keymap('n', ']s', ':Lspsaga diagnostic_jump_prev<cr>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>', opts)
  buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)
end

local servers = { "intelephense", "tsserver" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end


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


-- Config autocomplete
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
      priority = 40,
    },
    buffer = { kind = "  ", menu = " [BUFFER] ", priority = 20 },
    calc = { kind = "  " },
    tabnine = {
      max_num_results = 10,
      priority = 9,
      sort = false,
      show_prediction_strength = true,
      max_line = 1000,
    },
    nvim_lsp = { kind = "  ", menu = " [LSP] ", priority = 10 },
    nvim_lua = { kind = "  ", menu = " [LUA] ", priority = 10 },
    tags = false,
    vim_dadbod_completion = true,
    snippets_nvim = { kind = "  " },
    ultisnips = { kind = "  ", menu = " [SNIP] ", priority = 9 },
    treesitter = { kind = "  ", menu = " [TREESITTER] ", priority = 10 },
    emoji = { kind = " ﲃ ", filetypes = { "markdown", "text" } },
    tmux = {
      all_panes = true,
    },
    gql_schema = true,
  };
}

map('i', '<c-space>', 'compe#complete()', {expr = true, noremap = true, silent = true})
map('n', '<c-space>', 'viwA', {noremap = true})
map('i', '<cr>', [[compe#confirm(luaeval("require 'nvim-autopairs'.autopairs_cr()"))]], {expr = true, noremap = true, silent = true})
map('i', '<tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], {expr = true, noremap = true})
map('i', '<s-tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], {expr = true, noremap = true})

require("nvim-autopairs.completion.compe").setup({
  map_cr = true,
  map_complete = true,
})

-- Build LSP UI
require("lspsaga").init_lsp_saga({
  code_action_icon = "💡",
  use_saga_diagnostic_sign = true,
  error_sign = "",
  warn_sign = "",
  hint_sign = "",
  infor_sign = "",
  dianostic_header_icon = "   ",
  code_action_prompt = {
    enable = true,
    sign = true,
    sign_priority = 20,
    virtual_text = true,
  },
  finder_definition_icon = "  ",
  finder_reference_icon = "  ",
  max_preview_lines = 50, -- preview lines of lsp_finder and definition preview
  finder_action_keys = {
    open = "o",
    vsplit = "s",
    split = "i",
    quit = "q",
    scroll_down = "<C-f>",
    scroll_up = "<C-b>", -- quit can be a table
  },
  code_action_keys = {
    quit = "q",
    exec = "<cr>",
  },
  rename_action_keys = {
    quit = "<C-c>",
    exec = "<cr>", -- quit can be a table
  },
  definition_preview_icon = "  ",
  border_style = "single", -- or double
  -- rename_prompt_prefix = '➤',
  rename_prompt_prefix = "❱❱",
})
